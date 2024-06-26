Instance: HiraCapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition

* status =  #draft
* date = "2024-04-18"
* kind = #instance
* fhirVersion = #4.0.1
* format = #json
* implementation.description = "Audit Events API"
* implementation.url = "https://auditevents.digital.health.nz/fhir/R4"
* implementationGuide = "https://build.fhir.org/ig/tewhatuora/fhir-auditevents"
* publisher = "Te Whatu Ora Health New Zealand"
* description = "FHIR API for AuditEvents"
* rest.mode = #server

* rest.documentation = "Details the FHIR Server API for AuditEvents. This API allows for the creation, retrieval and searching of AuditEvent resources."
* rest.security.description = "Details security requirements are detailed at [security](./security.html)."
* rest.security.cors = false
* rest.security.service = http://terminology.hl7.org/CodeSystem/restful-security-service#SMART-on-FHIR
* rest.security.extension.url = "http://fhir-registry.smarthealthit.org/StructureDefinition/oauth-uris"
* rest.security.extension.extension[0].url = "token"
* rest.security.extension.extension[=].valueUri = "https://ppd.auth.services.health.nz/realms/hnz-integration/protocol/openid-connect/token"


* rest.interaction[+].code = #transaction
* rest.interaction[+].code = #batch

* rest.resource[+].type = #AuditEvent
* rest.resource[=].profile = Canonical(AuditEvent)
* rest.resource[=].supportedProfile = Canonical(HiraAuditEvent)
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #create
* rest.resource[=].versioning = #versioned
* rest.resource[=].searchParam[0].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/AuditEvent-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "Allows searching for AuditEvent resources by patient. e.g. [base]/AuditEvent?patient=https://api.hip.digital.health.nz/fhir/Patient/ZXP7823"
* rest.resource[=].searchParam[1].name = "correlationId"
* rest.resource[=].searchParam[=].definition = Canonical(AuditEventCorrelationIdSearchParameter)
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "Allows searching for AuditEvent resources by correlationId. e.g. [base]/AuditEvent?correlationId=123456. This is a custom parameter."
