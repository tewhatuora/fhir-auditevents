The AuditEvents API is secured using the oAuth2.0 client_credentials grant type with SMART on FHIR system to system scopes for the AuditEvent resource.

A valid oAuth2.0 `access_token` MUST be provided in the HTTP `Authorization` header as a Bearer token. This must be signed by the expected token issuer. This token can be obtained by providing valid client_credentials in a request to the token issuer's `/token` endpoint.

Example:

```
curl --location '{token endpoint}' \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode 'grant_type=client_credentials' \
  --data-urlencode 'client_id=id' \
  --data-urlencode 'client_secret=secret' \
  --data-urlencode 'scope=system/AuditEvent.rs'
```

For ordinary resource operations, the `scope` claim MUST contain the scope required by the requested interaction:

- `system/AuditEvent.c` - to permit the `create` operation on an `AuditEvent` resource
- `system/AuditEvent.rs` - to permit both `read` and `search-type` operation on the `AuditEvent` resource

For `POST [base]/AuditEvent/$verification-sample`, the `scope` claim MUST contain `https://fhir-ig.digital.health.nz/auditevents/OperationDefinition/verification-sample`. This scope authorizes the operation and its returned AuditEvents. A separate `system/AuditEvent.rs` scope is not required. The sampling scope alone does not grant generic AuditEvent read, search or create access. Approved service callers can sample on behalf of source clients; the requested `clientId` need not equal the token client. See [Verification sample](verification-sample.html) for the request and eligibility rules.
