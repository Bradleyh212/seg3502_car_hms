package ca.uottawa.seg3102.carhms.application.dtos.queries

import java.util.UUID

/** Identifies a hike whose registration deadline has been reached. */
data class CloseHikeRequest(
    val hikeId: UUID,
)
