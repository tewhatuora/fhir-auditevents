Instance: HiraAuditEventExampleUC2
InstanceOf: HiraAuditEvent
Title: "Example Hira Audit Event for UC2: Member of the public accesses their child’s record"
Usage: #example

* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest
* action = http://hl7.org/fhir/audit-event-action#R
* recorded = "2024-04-27T08:04:27.434+00:00"
* outcome = http://hl7.org/fhir/audit-event-outcome#0
* outcomeDesc = "200"

// Patient self agent[own]
// child whom record belongs to
* agent[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-RoleClass"
* agent[=].type.coding[=].code = #PAT
* agent[=].type.coding[=].display = "patient"
* agent[=].who.reference = "https://api.hip.digital.health.nz/fhir/Patient/{childNHI}"
* agent[=].requestor = false

// agent[agt]
// parent accessing record
* agent[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-RoleClass"
* agent[=].type.coding[=].code = #CAREGIVER
* agent[=].type.coding[=].display = "caregiver"
* agent[=].who.reference = "https://api.hip.digital.health.nz/fhir/Patient/{parentNHI}"
* agent[=].requestor = true
* agent[=].altId = "56237238-0a38-4ae3-b148-1e6d7a9b9d07"
* agent[=].network.address = "12.21.213.213"

// agent [sys]
// software system
* agent[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/extra-security-role-type"
* agent[=].type.coding[=].code = #dataprocessor
* agent[=].type.coding[=].display = "dataprocessor"
* agent[=].who.display = "client_id123"
* agent[=].requestor = false
* agent[=].name = "My Health Record"
* agent[=].network.address = "88.11.333.213"

* source.observer.display = "Hira Connector Plane HNZ"

* entity[+].what.reference = "https://fhir.digital.health.nz/fhir/R4/CarePlan"
* entity[=].query = "P3BhdGllbnQ9MTIzNA=="
