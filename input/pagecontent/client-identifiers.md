The verification sampling operation accepts the source application client ID from either of these locations on an AuditEvent's `dataprocessor` agent:

- `agent.who.identifier.value`, for a client stored as an identifier.
- `agent.who.display`, for a legacy client stored as display text.

Matching is exact and requires the `dataprocessor` role from `http://terminology.hl7.org/CodeSystem/extra-security-role-type` on that same agent. HTTP and HTTPS forms of the terminology URL are accepted. A matching value on a clinician or another agent does not establish the client. Sampling eligibility also requires exactly one dataprocessor agent.

The [selected clinical access example](AuditEvent-verification-sample-access-1.html) shows the identifier form. Existing events using the display form remain eligible without migrating the client ID. The operation's `clientId` input is a string and matches the identifier value; it does not accept a `system|value` token.

`clientId` is a required input to `POST [base]/AuditEvent/$verification-sample`. See [Verification sample](verification-sample.html) for the operation, its service URL filter and authorization requirements.
