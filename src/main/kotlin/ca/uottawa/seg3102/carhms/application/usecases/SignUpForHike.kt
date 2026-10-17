package ca.uottawa.seg3102.carhms.application.usecases

import ca.uottawa.seg3102.carhms.application.dtos.queries.SignUpForHikeRequest
import ca.uottawa.seg3102.carhms.application.dtos.results.SignUpResult

/** Application boundary for the SignUpForHike use case (CAR-Req-01, section 3.2). */
interface SignUpForHike {
    /**
     * Registers an authenticated, active member for an eligible hike before its deadline.
     * Confirms a place or appends to the full hike's FIFO waitlist; sends the outcome by email.
     * Taking the last place marks the hike full and records the responsible actor.
     */
    fun signUpForHike(request: SignUpForHikeRequest): SignUpResult
}
