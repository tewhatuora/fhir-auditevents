// not currently used, but here in case it is required later

// Extension: HeatlhCareAgentDetailsExtension
// Id: agent-details-extension
// Title: "Healthcare Agent Details Extension"
// Description: "This extension stores detailed information about the agent, including identifiers and names of the organization and facility."

// * extension contains
//     CPN 0..1 and
//     OrgIdentifier 0..1 and
//     FacilityIdentifier 0..1

// * extension[CPN] ^short = "HPI CPN"
// * extension[CPN].value[x] only Identifier
// * extension[CPN].valueIdentifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"

// * extension[OrgIdentifier] ^short = "HPI Organization Identifier"
// * extension[OrgIdentifier].value[x] only Identifier
// * extension[OrgIdentifier].valueIdentifier.system = "https://standards.digital.health.nz/ns/hpi-organisation-id"

// * extension[FacilityIdentifier] ^short = "HPI Facility Identifier"
// * extension[FacilityIdentifier].value[x] only Identifier
// * extension[FacilityIdentifier].valueIdentifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
