package ca.uottawa.seg3102.carhms.application.dtos.queries

import java.util.UUID

/** Identifies the authenticated hiker and their registration to cancel. */
data class CancelSignUpRequest(
    val hikerEmail: String,
    val hikeId: UUID,
)
