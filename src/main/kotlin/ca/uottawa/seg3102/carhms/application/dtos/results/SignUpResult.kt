package ca.uottawa.seg3102.carhms.application.dtos.results

import ca.uottawa.seg3102.carhms.application.dtos.SignUpStatus

/** waitlistPosition is one-based for WAITLISTED and null for CONFIRMED. */
data class SignUpResult(
    val status: SignUpStatus,
    val waitlistPosition: Int?,
)
