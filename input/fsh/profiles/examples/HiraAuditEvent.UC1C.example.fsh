Instance: HiraAuditEventExampleUC1C
InstanceOf: HiraAuditEvent
Description: "Example Hira Audit Event for UC1: Member of the public (patient) accesses their own health record (POST Search example)"
Title: "Example profile instance UC1"
Usage: #example

* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest
* action = http://hl7.org/fhir/audit-event-action#R
* recorded = "2024-04-27T08:04:27.434+00:00"
* outcome = http://hl7.org/fhir/audit-event-outcome#0
* outcomeDesc = "200"

* purposeOfEvent = http://terminology.hl7.org/CodeSystem/v3-ActReason#PATRQT

// Patient self agent[slf]
* agent[slf] insert SlfAgent
* agent[slf].policy = "urn:uuid:1c7739fb-5099-4db9-a1f9-c928ee059640"

// agent [sys]
* agent[system] insert SystemAgent

* source.observer.display = "HNZ API Gateway"

* entity[accessedResource] insert AccessedResourceAgentSearch(https://fhir.digital.health.nz/fhir/R4/Immunization/_search, e1wicGF0aWVudFwiOlwiTkhJMTIzXCJ9, Search Immunizations, admin=true)
* entity[dataSubject] insert DataSubjectAgent(NHI123)
