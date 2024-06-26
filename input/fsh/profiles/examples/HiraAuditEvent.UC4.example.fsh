Instance: HiraAuditEventExampleUC4
InstanceOf: HiraAuditEvent
Title: "Example profile instance UC4"
Description: "Example Hira Audit Event for UC4: Member of the health workforce accesses a patient’s health record"
Usage: #example

* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest
* action = http://hl7.org/fhir/audit-event-action#R
* recorded = "2024-04-27T08:04:27.434+00:00"
* outcome = http://hl7.org/fhir/audit-event-outcome#0
* outcomeDesc = "200"

* purposeOfEvent = http://terminology.hl7.org/CodeSystem/v3-ActReason#PUBHLTH

// health workforce member
* agent[healthworkforce] insert HealthWorkforceAgent
* agent[healthworkforce].policy = "urn:uuid:1c7739fb-5099-4db9-a1f9-c928ee059640"

* agent[organisation] insert OrganisationAgent

// agent [sys]
* agent[system] insert SystemAgent

* source.observer.display = "HNZ API Gateway"

* entity[accessedResource] insert AccessedResourceAgent(https://fhir.digital.health.nz/fhir/R4/CarePlan, P3BhdGllbnQ9MTIzNA==, Reading CarePlan)
* entity[dataSubject] insert DataSubjectAgent(NHI123)
