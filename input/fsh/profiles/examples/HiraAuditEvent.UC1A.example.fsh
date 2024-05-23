Instance: HiraAuditEventExampleUC1A
InstanceOf: HiraAuditEvent
Title: "Example Hira Audit Event for UC1: Member of the public (patient) accesses their own health record (Successful Request)"
Usage: #example

* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest
* action = http://hl7.org/fhir/audit-event-action#R
* recorded = "2024-04-27T08:04:27.434+00:00"
* outcome = http://hl7.org/fhir/audit-event-outcome#0
* outcomeDesc = "200"

// Patient self agent[slf]
* agent[slf] insert SlfAgent

// agent [sys]
* agent[system] insert SystemAgent

* source.observer.display = "Hira Mulesoft Gateway"

* entity[accessedResource] insert AccessedResourceAgent(https://fhir.digital.health.nz/fhir/R4/CarePlan, P3BhdGllbnQ9MTIzNA==, Reading CarePlan)
* entity[dataSubject] insert DataSubjectAgent(https://api.hip.digital.health.nz/fhir/Patient/NHI123)