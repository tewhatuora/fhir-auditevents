Extension: AgentAdditionalDetailsExtension
Id: agent-additional-details-extension
Title: "AuditEvent.Agent additional details"
Description: "This extension stores detailed information about the agent"

* extension contains
    mha-confidence-level 0..1

* extension[mha-confidence-level] ^short = "The confidence level of authorization"
* extension[mha-confidence-level].value[x] only string
