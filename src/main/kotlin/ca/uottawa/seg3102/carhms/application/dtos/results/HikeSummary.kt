package ca.uottawa.seg3102.carhms.application.dtos.results

import java.time.Duration
import java.time.OffsetDateTime
import java.util.UUID

/** Public details of an open hike; difficulty and meeting point come from its trail. */
data class HikeSummary(
    val hikeId: UUID,
    val title: String,
    val description: String,
    val trail: TrailSummary,
    val organizer: OrganizerSummary,
    val startsAt: OffsetDateTime,
    val expectedDuration: Duration,
    val registrationDeadline: OffsetDateTime,
    val capacity: Int,
    val remainingPlaces: Int,
    val matchesHikerSkillLevel: Boolean?,
)
