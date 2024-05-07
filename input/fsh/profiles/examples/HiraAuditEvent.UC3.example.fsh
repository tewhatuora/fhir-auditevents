Instance: HiraAuditEventExampleUC3
InstanceOf: HiraAuditEvent
Title: "Example Hira Audit Event for UC3: Member of the public accesses another member of the public (patient’s) health"
Usage: #example

* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest
* action = http://hl7.org/fhir/audit-event-action#R
* recorded = "2024-04-27T08:04:27.434+00:00"
* outcome = http://hl7.org/fhir/audit-event-outcome#0
* outcomeDesc = "200"

// Patient self agent[own]
// patient whom record belongs to
* agent[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-RoleClass"
* agent[=].type.coding[=].code = #PAT
* agent[=].type.coding[=].display = "patient"
* agent[=].who.reference = "https://api.hip.digital.health.nz/fhir/Patient/{patientNHI}"
* agent[=].requestor = false

// agent[agt]
// member of public with delegated access
* agent[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* agent[=].type.coding[=].code = #DELEGATEE
* agent[=].type.coding[=].display = "delegatee"
* agent[=].who.reference = "https://api.hip.digital.health.nz/fhir/Patient/{delegateNHI}"
* agent[=].requestor = true
* agent[=].altId = "73a35fec-6d01-4148-832f-f5389f9fd0fa"
* agent[=].network.address = "12.21.213.213"

// agent [sys]
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
