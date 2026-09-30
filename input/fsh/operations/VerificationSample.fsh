Instance: VerificationSampleOperation
InstanceOf: OperationDefinition
Usage: #definition
Title: "Verification sample"
Description: "Deterministic percentage sample of unique clinical accesses for an authorized client and period."

* id = "verification-sample"
* url = "https://fhir-ig.digital.health.nz/auditevents/OperationDefinition/verification-sample"
* name = "VerificationSample"
* status = #active
* kind = #operation
* code = #verification-sample
* description = "Deterministic global percentage sample of unique clinical accesses for an authorized client and period."
* affectsState = false
* resource[0] = #AuditEvent
* system = false
* type = true
* instance = false
* parameter[0].name = #clientId
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #string
* parameter[=].documentation = "Exact source application client identifier."
* parameter[+].name = #startDate
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #dateTime
* parameter[=].documentation = "Inclusive full timestamp with timezone and at most millisecond precision."
* parameter[+].name = #endDate
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #dateTime
* parameter[=].documentation = "Exclusive full timestamp with timezone and at most millisecond precision."
* parameter[+].name = #percentage
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #decimal
* parameter[=].documentation = "Fraction greater than zero and at most one; rounded up once across all unique groups."
* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Bundle
