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

/* Start Agents - These are the people and systems involed in the data access event */
* agent contains
  slf 0..1 and
  dlg 0..1 and
  caregiver 0..1 and
  delegatee 0..1 and
  healthworkforce 0..1 and
  system 0..1 and
  facility 0..1 and
  organisation 0..1

* agent[slf].role = https://terminology.hl7.org/CodeSystem/v3-RoleClass#patient
* agent[slf].role 1..1
* agent[slf].name 0..0

* agent[dlg].role = https://terminology.hl7.org/CodeSystem/v3-RoleCode#DELEGATOR
* agent[dlg].role 1..1
* agent[dlg].name 0..0

* agent[caregiver].role = http://terminology.hl7.org/CodeSystem/v3-ParticipationFunction#AUCG
* agent[caregiver].role 1..1
* agent[caregiver].name 0..0

* agent[delegatee].role = https://terminology.hl7.org/CodeSystem/v3-RoleCode#DELEGATEE
* agent[delegatee].role 1..1
* agent[delegatee].name 0..0

* agent[healthworkforce].role = https://terminology.hl7.org/CodeSystem/v3-RoleClass#PROV
* agent[healthworkforce].role 1..1
// * agent[healthworkforce].extension contains HeatlhCareAgentDetailsExtension named healthcareDetails 0..1

* agent[system].role = http://terminology.hl7.org/CodeSystem/extra-security-role-type#dataprocessor
* agent[system].role 1..1
/* End Agents */

* agent[slf] ^short = "The Patient who is logged in and accessing their own records"
* agent[dlg] ^short = "The Patient who has provided delegated access to their own records"
* agent[caregiver] ^short = "The Caregiver accessing a child's records"
* agent[delegatee] ^short = "A Delegate accessing a patient's records on their behalf"
* agent[healthworkforce] ^short = "A member of the Health Workforce accessing patient records"
* agent[system] ^short = "A system accessing Patient records"
* agent[facility] ^short = "The facility accessing Patient records"
* agent[organisation] ^short = "The organisation accessing Patient records"

/* Start Entities - This is the data entity accessed (e.g. the resource) and a subject within the data */
* entity 1..*
* entity ^short = "Details of the endpoints being accessed"

* entity ^slicing.discriminator.type = #value
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #open

* entity contains
    accessedResource 1..1 and
    dataSubject 0..*

* entity[accessedResource].role = https://terminology.hl7.org/CodeSystem/audit-entity-type#2
* entity[accessedResource].role 1..1
* entity[accessedResource] ^short = "The REST or FHIR resource that is being accessed"

* entity[dataSubject].role = https://terminology.hl7.org/CodeSystem/audit-entity-type#1
* entity[dataSubject].role 1..1
* entity[dataSubject] ^short = "The data subject of the accessed resource, derived from the resource itself"
/* End entities */
