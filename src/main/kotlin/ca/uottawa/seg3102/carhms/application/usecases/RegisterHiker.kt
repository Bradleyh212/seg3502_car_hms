package ca.uottawa.seg3102.carhms.application.usecases

import ca.uottawa.seg3102.carhms.application.dtos.queries.RegisterHikerRequest

/** Application boundary for the RegisterHiker use case (CAR-Req-01, section 3.2). */
interface RegisterHiker {
    /**
     * Registers a unique email with an invitation code and an accepted waiver.
     * A minor requires guardian acceptance and a recorded guardian name.
     * Successful registration creates an active membership.
     */
    fun registerHiker(request: RegisterHikerRequest)
}
