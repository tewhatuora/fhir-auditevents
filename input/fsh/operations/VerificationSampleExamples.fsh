Instance: VerificationSampleRequestExample
InstanceOf: Parameters
Usage: #example
Title: "Verification sample request"
Description: "Request a two percent sample of one client's August 2026 clinical accesses to one service."
* parameter[0].name = "clientId"
* parameter[=].valueString = "example-client"
* parameter[+].name = "serviceBaseUrl"
* parameter[=].valueUri = "https://api.example.org/s2s"
* parameter[+].name = "startDate"
* parameter[=].valueDateTime = "2026-08-01T00:00:00+12:00"
* parameter[+].name = "endDate"
* parameter[=].valueDateTime = "2026-09-01T00:00:00+12:00"
* parameter[+].name = "percentage"
* parameter[=].valueDecimal = 0.02

Instance: VerificationSampleAuditEventExample
InstanceOf: AuditEvent
Usage: #example
Title: "Selected clinical access"
Description: "One representative AuditEvent for a selected clinician, patient and Auckland date."
* id = "verification-sample-access-1"
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest
* action = #R
* recorded = "2026-08-05T10:15:00+12:00"
* agent[0].role = http://terminology.hl7.org/CodeSystem/extra-security-role-type#dataprocessor
* agent[=].who.identifier.system = "https://example.org/clients"
* agent[=].who.identifier.value = "example-client"
* agent[=].requestor = false
* agent[+].role = http://terminology.hl7.org/CodeSystem/v3-RoleClass#PROV
* agent[=].who.identifier.system = "https://example.org/clinicians"
* agent[=].who.identifier.value = "clinician-123"
* agent[=].requestor = true
* source.observer.identifier.system = "https://example.org/systems"
* source.observer.identifier.value = "audit-producer"
* entity[0].what.identifier.system = "https://example.org/patients"
* entity[=].what.identifier.value = "patient-456"
* entity[=].role = http://terminology.hl7.org/CodeSystem/object-role#1
* entity[+].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2
* entity[=].what.reference = "https://api.example.org/s2s/Patient/patient-456"

Instance: VerificationSampleResponseExample
InstanceOf: Bundle
Usage: #example
Title: "Verification sample response"
Description: "A collection Bundle containing one representative AuditEvent for each selected access group."
* type = #collection
* entry[0].resource = VerificationSampleAuditEventExample
