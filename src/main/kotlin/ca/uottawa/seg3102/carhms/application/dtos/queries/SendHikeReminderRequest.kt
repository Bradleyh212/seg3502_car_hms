package ca.uottawa.seg3102.carhms.application.dtos.queries

import java.util.UUID

/** Identifies a hike due to take place in one day. */
data class SendHikeReminderRequest(
    val hikeId: UUID,
)
