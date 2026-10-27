`POST [base]/AuditEvent/$verification-sample` returns a deterministic percentage sample of unique clinical accesses for a client, service base URL and period. The operation is defined by [VerificationSample](OperationDefinition-verification-sample.html), with a [request example](Parameters-VerificationSampleRequestExample.html) and a [response example](Bundle-VerificationSampleResponseExample.html). Scheduling and downstream verification processing are the caller's responsibility.

### Request

Send a FHIR R4 `Parameters` resource containing each of these parameters exactly once:

| Parameter | Type | Meaning |
| --- | --- | --- |
| `clientId` | `string` | Exact source application client identifier; non-blank and at most 256 characters. |
| `serviceBaseUrl` | `uri` | Absolute HTTP(S) service base URL, at most 256 characters, without credentials, query or fragment. |
| `startDate` | `dateTime` | Inclusive start of the access period. |
| `endDate` | `dateTime` | Exclusive end of the access period; later than `startDate`. |
| `percentage` | `decimal` | Fraction greater than 0 and at most 1; `0.02` means 2%, and `1` selects every eligible group. |

The linked request artifact includes an ID for publication in this guide. Omit that ID when calling the API; send this request body:

```json
{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "clientId",
      "valueString": "example-client"
    },
    {
      "name": "serviceBaseUrl",
      "valueUri": "https://api.example.org/s2s"
    },
    {
      "name": "startDate",
      "valueDateTime": "2026-08-01T00:00:00+12:00"
    },
    {
      "name": "endDate",
      "valueDateTime": "2026-09-01T00:00:00+12:00"
    },
    {
      "name": "percentage",
      "valueDecimal": 0.02
    }
  ]
}
```

Only `resourceType` and `parameter` are accepted at the resource level. Each parameter contains only its `name` and corresponding `value[x]`. Missing, duplicate, unknown or wrongly typed parameters return HTTP 400.

Dates require a full timestamp through seconds, a timezone (`Z` or an offset), and at most millisecond precision. Equivalent instants normalize to UTC. The period filters `AuditEvent.recorded`, rather than ingestion time or `meta.lastUpdated`.

Trailing slashes are removed from the normalized service base URL. The recorded request URI must equal that base or begin with the base followed by `/`. For example, `https://api.example.org/s2s/Patient/123` matches `https://api.example.org/s2s`, but `https://api.example.org/s2s-other` does not.

### Authorization

The token MUST contain the scope `https://fhir-ig.digital.health.nz/auditevents/OperationDefinition/verification-sample`. This scope authorizes the operation and its returned AuditEvents; `system/AuditEvent.rs` is not required. The scope alone does not authorize generic AuditEvent searches, reads, writes or batch/transaction requests.

Approved service callers can sample on behalf of source clients. The requested `clientId` need not equal the token client. `serviceBaseUrl` scopes the source system and environment.

### Eligible accesses

The operation filters by client, service request URI and recorded period. Each eligible AuditEvent must have a resource ID, a supported recorded timestamp and unambiguous source identities:

| Identity | Requirement |
| --- | --- |
| Client | Exactly one agent with role `dataprocessor` from `http://terminology.hl7.org/CodeSystem/extra-security-role-type`. That agent's `who.identifier.value` or legacy `who.display` must match `clientId`. |
| Clinician | Exactly one agent with `requestor=true` and role `PROV` from `http://terminology.hl7.org/CodeSystem/v3-RoleClass`. Its `who.identifier` must contain both `system` and `value`. |
| Patient | Exactly one entity with role `1` from `http://terminology.hl7.org/CodeSystem/object-role`. Its `what.identifier` must contain both `system` and `value`. |
| Service | An entity with type `2` from `http://terminology.hl7.org/CodeSystem/audit-entity-type`, whose `what.reference` matches the requested service base or a path below it. |

Role and entity-type matching accepts either HTTP or HTTPS terminology system URLs. Display names are not clinician or patient identifiers. Records with missing or ambiguous identities are excluded before grouping. [Client identifiers](client-identifiers.html) describes matching the two client ID locations.

### Grouping and selection

Events are grouped by clinician identifier, patient identifier and access calendar date in `Pacific/Auckland`. Both identifier systems and values form part of the key. Multiple calls by the same clinician for the same patient on the same Auckland date count as one access. Date grouping observes Auckland daylight saving; period boundaries are instants and may cut through a local calendar day.

The selected count is `ceil(unique groups × percentage)`, rounded up once across the whole filtered client population. Groups receive equal weight regardless of their event counts; there is no guaranteed selection per clinician. For example, 251 groups sampled at 2% return 6 representatives.

Stable SHA-256 ranking uses the client, normalized service URL and normalized period boundaries. Percentage is excluded from the ranking seed, so increasing it extends the same ranked sample for an unchanged population. Each selected group contributes its original AuditEvent with the earliest `recorded` timestamp; resource ID breaks timestamp ties. Original resource IDs and identities are retained.

Equivalent requests against unchanged source data return the same representatives in the same order. Source additions or corrections can change the result; the operation does not create an immutable historical batch.

### Response and errors

Success is HTTP 200 with a `collection` Bundle. Each entry contains one representative AuditEvent; the Bundle has no `total`. The response is synchronous and has no pagination. Current response entries contain `resource` without `fullUrl`; FHIR R4 Bundle validation reports a missing `fullUrl` for non-empty responses. The response example preserves this implemented behavior. A query with no source records returns an empty `entry` array. A non-empty backing-store population with no eligible groups returns HTTP 503.

Errors return a FHIR `OperationOutcome` with safe diagnostics:

| HTTP status | Meaning |
| --- | --- |
| 400 | Invalid request parameters. |
| 401 | Authentication or authorization rejected. |
| 403 | Access denied, including rejected tokens or missing sampling scope. |
| 413 | Source population, eligible group or response-size limit exceeded. |
| 503 | Execution budget exceeded, incompatible mappings, incomplete query, eligibility failure or backend failure. |

No failure returns a partial sample. The default limits are 100,000 matched source records, 100,000 eligible groups, a 4 MiB serialized response Bundle and a 20-second sampling execution budget. Lowering the percentage reduces the selected response size but does not reduce the source population read. If a request exceeds synchronous limits, use a smaller explicit period. Separate periods produce independent samples with rounding and ranking applied to each request.

Sampling searches monthly indexes overlapping the requested recorded period in UTC, applying the exact timestamp filter within those months. Missing months are skipped; if no usable mappings exist, sampling returns HTTP 503. The indexer chooses its month using `meta.lastUpdated`, so events indexed or updated outside the selected recorded months may be omitted. Backend pages do not form a snapshot: concurrent source changes can affect the result.
