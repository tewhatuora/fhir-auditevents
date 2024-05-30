Instance: HiraAuditEventExampleUC2
InstanceOf: HiraAuditEvent
Description: "Example Hira Audit Event for UC2: Member of the public accesses their child’s record"
Title: "Example profile instance UC2"
Usage: #example

* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest
* action = http://hl7.org/fhir/audit-event-action#R
* recorded = "2024-04-27T08:04:27.434+00:00"
* outcome = http://hl7.org/fhir/audit-event-outcome#0
* outcomeDesc = "200"

* purposeOfEvent = http://terminology.hl7.org/CodeSystem/v3-ActReason#FAMRQT

* agent[dlg] insert PatientDelegatorAgent
// parent accessing record
* agent[caregiver] insert CaregiverAgent
* agent[caregiver].policy = "urn:uuid:1c7739fb-5099-4db9-a1f9-c928ee059640"

// agent [sys]
// software system
* agent[system] insert SystemAgent

* source.observer.display = "HNZ API Gateway"

* entity[accessedResource] insert AccessedResourceAgent(https://fhir.digital.health.nz/fhir/R4/CarePlan, P3BhdGllbnQ9MTIzNA==, Reading CarePlan)
* entity[dataSubject] insert DataSubjectAgent(NHI123)
