The AuditEvents API is secured using the oAuth2.0 client_credentials grant type with SMART on FHIR system to system scopes.

A valid oAuth2.0 `access_token` MUST be provided in the HTTP `Authorization` header as a Bearer token. This must be signed by the expected token issuer. This token can be obtained by providing valid client_credentials in a request to the token issuer's `/token` endpoint.

Example:

```
curl --location 'https://auth.integration-test.covid19.health.nz/oauth2/token' \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode 'grant_type=client_credentials' \
  --data-urlencode 'client_id=id' \
  --data-urlencode 'client_secret=secret' \
  --data-urlencode 'scope=system/AuditEvent.rs'
```

The `scope` claim within the provided access_token MUST contain:

- `system/AuditEvent.c` - to permit the `create` operation on an `AuditEvent` resource
- `system/AuditEvent.rs` - to permit both `read` and `search-type` operation on the `AuditEvent` resource
