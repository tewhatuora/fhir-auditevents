# Verification sample

`POST [base]/AuditEvent/$verification-sample` accepts a FHIR R4 `Parameters` resource and returns a deterministic sample of clinical accesses. The operation is defined by [VerificationSample](OperationDefinition-verification-sample.html), with a [request example](Parameters-VerificationSampleRequestExample.html) and a [response example](Bundle-VerificationSampleResponseExample.html).

Supply each parameter exactly once:

| Parameter | Type | Meaning |
| --- | --- | --- |
| `clientId` | `string` | Exact source application client identifier. |
| `startDate` | `dateTime` | Inclusive start of the period. |
| `endDate` | `dateTime` | Exclusive end of the period; later than `startDate`. |
| `percentage` | `decimal` | Fraction greater than 0 and at most 1; `0.02` means 2%. |

Dates require a full timestamp with timezone and no more than millisecond precision. The caller must have either `system/AuditEvent.crus`, or both `system/AuditEvent.rs` and `https://fhir-ig.digital.health.nz/auditevents/OperationDefinition/verification-sample`. The requested client must match a signed client claim or an authorized client in the signed token.

The operation filters AuditEvents by client and `recorded` time, then groups eligible events by clinician identifier, patient identifier and calendar date in `Pacific/Auckland`. It selects `ceil(unique groups × percentage)` groups across the whole client population, using stable ranking, and returns the earliest recorded AuditEvent from each selected group. Repeating a request against unchanged source data returns the same representatives. Changes to the source data can change the result.

Success is HTTP 200 with a `collection` Bundle, including an empty `entry` array when no source records match. Each entry contains one AuditEvent; the Bundle has no `total`. Invalid parameters return 400, missing authentication 401, unauthorized scope or client 403, synchronous size limits 413, and sampling or backing-store failures 503. Errors return `OperationOutcome`; no partial sample is returned.
