Instance: AuditEventCorrelationIdSearchParameter
InstanceOf: SearchParameter
Description: "A search parameter for finding AuditEvents by their correlation ID."
Usage: #definition

* status = #active
* code = #correlationId
* base = #AuditEvent
* type = #string
* name = "correlationId"
* multipleOr = false
* multipleAnd = false
* purpose = "This search parameter is used to find AuditEvents by their correlation ID."
* expression = "AuditEvent.entity.detail.where(type = 'correlationId').value"
