Instance: HiraAuditEventExampleUC4
InstanceOf: HiraAuditEvent
Title: "Example Hira Audit Event for UC4: Member of the health workforce accesses a patient’s health record"
Usage: #example

* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest
* action = http://hl7.org/fhir/audit-event-action#R
* recorded = "2024-04-27T08:04:27.434+00:00"
* outcome = http://hl7.org/fhir/audit-event-outcome#0
* outcomeDesc = "200"

// agent[hwf]
// health workforce member
* agent[healthworkforce] insert HealthWorkforceAgent

// agent [sys]
* agent[system] insert SystemAgent

* source.observer.display = "Hira Mulesoft Gateway"

* entity[accessedResource] insert AccessedResourceAgent(https://fhir.digital.health.nz/fhir/R4/CarePlan, P3BhdGllbnQ9MTIzNA==, Reading CarePlan)
* entity[dataSubject] insert DataSubjectAgent(https://api.hip.digital.health.nz/fhir/Patient/NHI123)
