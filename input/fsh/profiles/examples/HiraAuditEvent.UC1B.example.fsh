Instance: HiraAuditEventExampleUC1B
InstanceOf: HiraAuditEvent
Title: "Example Hira Audit Event for UC1: Member of the public (patient) accesses their own health record (Server Error Response)"
Usage: #example

* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest
* action = http://hl7.org/fhir/audit-event-action#R
* recorded = "2024-04-27T08:04:27.434+00:00"
* outcome = http://hl7.org/fhir/audit-event-outcome#8
* outcomeDesc = "500"

* purposeOfEvent = http://terminology.hl7.org/CodeSystem/v3-ActReason#PATRQT

// Patient self agent[slf]
* agent[slf] insert SlfAgent
* agent[slf].policy = "1c7739fb-5099-4db9-a1f9-c928ee059640"

// agent [sys]
* agent[system] insert SystemAgent

* source.observer.display = "Hira Mulesoft Gateway"

* entity[accessedResource] insert AccessedResourceAgentWithError(https://fhir.digital.health.nz/fhir/R4/CarePlan, P3BhdGllbnQ9MTIzNA==, Reading CarePlan, {\"error\": \"Server Unavailable\"})
* entity[dataSubject] insert DataSubjectAgent(https://api.hip.digital.health.nz/fhir/Patient/NHI123)