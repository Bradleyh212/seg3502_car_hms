package ca.uottawa.seg3102.carhms.application.dtos.results

import ca.uottawa.seg3102.carhms.application.dtos.RegistrationStatus
import java.time.OffsetDateTime
import java.util.UUID

/**
 * A hiker's registration and the hike information needed to select it for cancellation.
 * canCancel reflects current eligibility; cancellation must recheck it at submission time.
 */
data class RegistrationSummary(
    val hikeId: UUID,
    val hikeTitle: String,
    val trailName: String,
    val startsAt: OffsetDateTime,
    val registrationDeadline: OffsetDateTime,
    val registeredAt: OffsetDateTime,
    val status: RegistrationStatus,
    val canCancel: Boolean,
)
