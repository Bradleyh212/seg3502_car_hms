package ca.uottawa.seg3102.carhms.application.dtos.queries

/** For a minor, waiver acceptance is by the named legal guardian. */
data class RegisterHikerRequest(
    val email: String,
    val invitationCode: String,
    val details: HikerDetails,
    val liabilityWaiverAccepted: Boolean,
    val legalGuardianName: String? = null,
)
