package ca.uottawa.seg3102.carhms.application.usecases

import ca.uottawa.seg3102.carhms.application.dtos.queries.CancelHikeRequest

/** Application boundary for the CancelHike use case (CAR-Req-01, section 3.2). */
interface CancelHike {
    /**
     * Allows its organizer or an administrator to cancel a hike before it starts, with a reason.
     * Cancels confirmed and waitlisted registrations and emails those hikers the reason.
     * Records the actor responsible for cancellation.
     */
    fun cancelHike(request: CancelHikeRequest)
}
