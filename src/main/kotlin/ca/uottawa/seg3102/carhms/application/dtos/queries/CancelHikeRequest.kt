package ca.uottawa.seg3102.carhms.application.dtos.queries

import java.util.UUID

/** The actor must be the authenticated hike organizer or an administrator. */
data class CancelHikeRequest(
    val actorEmail: String,
    val hikeId: UUID,
    val reason: String,
)
