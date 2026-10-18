package ca.uottawa.seg3102.carhms.application.usecases

import ca.uottawa.seg3102.carhms.application.dtos.queries.GetHikerForUpdateRequest
import ca.uottawa.seg3102.carhms.application.dtos.queries.RegisterOrganizerCertificationRequest
import ca.uottawa.seg3102.carhms.application.dtos.queries.UpdateHikerProfileRequest
import ca.uottawa.seg3102.carhms.application.dtos.queries.UpdateMembershipStatusRequest
import ca.uottawa.seg3102.carhms.application.dtos.results.HikerForUpdate

/** Application boundary for the UpdateHiker use case (CAR-Req-01, section 3.2). */
interface UpdateHiker {
    /**
     * Retrieves current personal, membership and certification information for the update form.
     * The authenticated actor must be the target hiker or an authorized administrator.
     */
    fun getHikerForUpdate(request: GetHikerForUpdateRequest): HikerForUpdate

    /** Replaces the authenticated hiker's personal information. */
    fun updateHikerProfile(request: UpdateHikerProfileRequest)

    /** Allows an administrator to change a hiker's membership status. */
    fun updateMembershipStatus(request: UpdateMembershipStatusRequest)

    /** Records certification and maximum difficulty, approving the hiker as an organizer. */
    fun registerOrganizerCertification(request: RegisterOrganizerCertificationRequest)
}
