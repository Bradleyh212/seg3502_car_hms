package ca.uottawa.seg3102.carhms.application.dtos.queries

import java.time.Duration
import java.time.OffsetDateTime

/** The organizer identity is authenticated; trailId refers to an NCC trail. */
data class CreateHikeRequest(
    val organizerEmail: String,
    val title: String,
    val description: String,
    val trailId: String,
    val startsAt: OffsetDateTime,
    val expectedDuration: Duration,
    val registrationDeadline: OffsetDateTime,
    val capacity: Int,
)
