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
