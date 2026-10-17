package ca.uottawa.seg3102.carhms.application.usecases

import ca.uottawa.seg3102.carhms.application.dtos.queries.CreateHikeRequest
import java.util.UUID

/** Application boundary for the CreateHike use case (CAR-Req-01, section 3.2). */
interface CreateHike {
    /**
     * Creates an open hike on an NCC trail that allows hiking during its opening season.
     * Requires an organizer certified through the hike date and qualified for its difficulty.
     * The registration deadline is before the start and at most two weeks earlier.
     * Returns the new hike identifier and records its organizer as the creation actor.
     */
    fun createHike(request: CreateHikeRequest): UUID
}
