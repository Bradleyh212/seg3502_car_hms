package ca.uottawa.seg3102.carhms.application.dtos.results

import ca.uottawa.seg3102.carhms.application.dtos.MembershipStatus
import ca.uottawa.seg3102.carhms.application.dtos.queries.HikerDetails

/**
 * Current values for the Update Hiker form; these private details require authorization.
 * A null certification means no organizer certification is recorded, not that one has expired.
 * Returning administrative fields does not grant permission to change them.
 */
data class HikerForUpdate(
    val email: String,
    val details: HikerDetails,
    val membershipStatus: MembershipStatus,
    val organizerCertification: OrganizerCertificationDetails?,
)
