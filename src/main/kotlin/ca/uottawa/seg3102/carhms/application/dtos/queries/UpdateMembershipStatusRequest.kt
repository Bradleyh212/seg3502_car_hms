package ca.uottawa.seg3102.carhms.application.dtos.queries

import ca.uottawa.seg3102.carhms.application.dtos.MembershipStatus

/** An authenticated administrator records a membership-status change. */
data class UpdateMembershipStatusRequest(
    val administratorEmail: String,
    val hikerEmail: String,
    val membershipStatus: MembershipStatus,
)
