package ca.uottawa.seg3102.carhms.application.usecases

import ca.uottawa.seg3102.carhms.application.dtos.queries.CancelSignUpRequest
import ca.uottawa.seg3102.carhms.application.dtos.queries.ListMyRegistrationsRequest
import ca.uottawa.seg3102.carhms.application.dtos.results.RegistrationSummary

/** Application boundary for the CancelSignUp use case (CAR-Req-01, section 3.2). */
interface CancelSignUp {
    /**
     * Retrieves only the authenticated hiker's registrations so one can be selected to cancel.
     * Includes current cancellation eligibility; cancelled registrations cannot be selected.
     */
    fun listMyRegistrations(request: ListMyRegistrationsRequest): List<RegistrationSummary>

    /**
     * Cancels the hiker's confirmed or waitlisted registration before the deadline.
     * A freed confirmed place promotes the first waiting hiker and notifies them by email.
     * Reopens a full hike if places remain and records the responsible actor.
     */
    fun cancelSignUp(request: CancelSignUpRequest)
}
