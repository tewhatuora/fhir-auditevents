Profile: HiraAuditEvent
Parent: AuditEvent
Id: hira-audit-event
Title: "Hira Audit Event"
Description: "Constrains the AuditEvent resource to represent Data Access through the Hira Connector Plane"

* ^purpose = "Capture of Data Access through the Hira Connector Plane"

* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest
* action 1..1
* recorded 1..1
* outcome 1..1
* outcomeDesc 1..1

* source.observer.display 1..1
* source.observer.display ^short = "The gateway or entity which logged the event"

* agent ^slicing.discriminator.type = #value
* agent ^slicing.discriminator.path = "role"
* agent ^slicing.rules = #open

* agent contains
  patient 1..1 and
  caregiver 0..1 and
  delegatee 0..1 and
  healthworkforce 0..1 and
  system 0..1

* agent[patient].role = https://hl7.org/fhir/R4/v3/RoleClass/cs.html#patient
* agent[patient].role 1..1
* agent[caregiver].role = https://hl7.org/fhir/R4/v3/RoleClass/cs.html#caregiver
* agent[caregiver].role 1..1
* agent[delegatee].role = https://hl7.org/fhir/R4/v3/RoleClass/cs.html#delegatee
* agent[delegatee].role 1..1
* agent[healthworkforce].role = https://hl7.org/fhir/R4/v3/RoleClass/cs.html#healthworkforce
* agent[healthworkforce].role 1..1
* agent[system].role = https://hl7.org/fhir/R4/v3/RoleClass/cs.html#system
* agent[system].role 1..1

* agent[patient] ^short = "The Patient who is the subject of the data access"
* agent[caregiver] ^short = "The Caregiver accessing a child's records"
* agent[delegatee] ^short = "A Delegate accessing a patient's records on their behalf"
* agent[healthworkforce] ^short = "A member of the Health Workforce accessing a patient's records"
* agent[system] ^short = "A system accessing Patient records"

* entity 1..*
* entity ^short = "Details of the endpoints being accessed"
