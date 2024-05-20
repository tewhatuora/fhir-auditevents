RuleSet: PatientAgent
* type.coding = http://terminology.hl7.org/CodeSystem/v3-RoleClass#PAT
* who.reference = "https://api.hip.digital.health.nz/fhir/Patient/NHI123"
* requestor = false

RuleSet: CaregiverAgent
* type.coding = http://terminology.hl7.org/CodeSystem/v3-RoleClass#CAREGIVER
* who.reference = "https://api.hip.digital.health.nz/fhir/Patient/NHI456"
* requestor = true
* altId = "56237238-0a38-4ae3-b148-1e6d7a9b9d07"
* network.address = "12.21.213.213"

RuleSet: DelegateeAgent
* type.coding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#DELEGATEE
* who.reference = "https://api.hip.digital.health.nz/fhir/Patient/NHI789"
* requestor = true
* altId = "73a35fec-6d01-4148-832f-f5389f9fd0fa"
* network.address = "12.21.213.213"

RuleSet: HealthWorkforceAgent
* type.coding = http://terminology.hl7.org/CodeSystem/v3-RoleCode#PROV
* who.reference = "https://api.hip.digital.health.nz/fhir/Practitioner/HPI123"
* altId = "externalSystemId"
* location.display = "Waikato Hospital"
* requestor = true
* network.address = "12.21.213.213"

RuleSet: SystemAgent
* type.coding = http://terminology.hl7.org/CodeSystem/extra-security-role-type#dataprocessor
* who.display = "client_id123"
* requestor = false
* name = "My Health Record"
* network.address = "88.11.333.213"

RuleSet: DataSubjectAgent(what)
* what.reference = "{what}"
* type = https://terminology.hl7.org/CodeSystem/audit-entity-type#1

RuleSet: AccessedResourceAgent(what, query)
* type = https://terminology.hl7.org/CodeSystem/audit-entity-type#2
* what.reference = "{what}"
* query = "{query}"
