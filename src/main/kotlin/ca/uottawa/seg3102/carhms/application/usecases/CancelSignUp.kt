package ca.uottawa.seg3102.carhms.application.usecases

import ca.uottawa.seg3102.carhms.application.dtos.queries.CancelSignUpRequest

/** Application boundary for the CancelSignUp use case (CAR-Req-01, section 3.2). */
interface CancelSignUp {
    /**
     * Cancels the hiker's confirmed or waitlisted registration before the deadline.
     * A freed confirmed place promotes the first waiting hiker and notifies them by email.
     * Reopens a full hike if places remain and records the responsible actor.
     */
    fun cancelSignUp(request: CancelSignUpRequest)
}
