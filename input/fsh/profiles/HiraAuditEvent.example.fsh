Instance: HiraAuditEventExample
InstanceOf: HiraAuditEvent
Title: "Example Hira Audit Event for a request to the Aotearoa Immunisation Register"
Usage: #example

* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest
* action = http://hl7.org/fhir/audit-event-action#R
* recorded = "2024-04-27T08:04:27.434+00:00"
* outcome = http://hl7.org/fhir/audit-event-outcome#0

* agent[+].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v3-RoleClass"
* agent[=].type.coding[=].code = #PAT
* agent[=].type.coding[=].display = "patient"
* agent[=].who.reference = "https://api.hip.digital.health.nz/fhir/Patient/ZXP7823"
* agent.requestor = true

* source.site = "Hira Connector Plane"
* source.observer.type = "Device"
* source.observer.display = "Hira Connector Plane"
* source.observer.identifier.system = "https://standards.digital.health.nz/ns/connector-id"
* source.observer.identifier.value = "HiraConnectorPlane"
* source.observer.identifier.use = #official
