package ca.uottawa.seg3102.carhms.application.usecases

import ca.uottawa.seg3102.carhms.application.dtos.queries.CloseHikeRequest

/** Application boundary for the CloseHike use case (CAR-Req-01, section 3.2). */
interface CloseHike {
    /**
     * Closes a hike when its registration deadline is reached and records the system actor.
     * Once closed, neither registrations nor registration cancellations are accepted.
     */
    fun closeHike(request: CloseHikeRequest)
}
