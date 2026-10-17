package ca.uottawa.seg3102.carhms.application.dtos.queries

import java.util.UUID

/** The hikerEmail must come from the authenticated hiker identity. */
data class SignUpForHikeRequest(
    val hikerEmail: String,
    val hikeId: UUID,
)
