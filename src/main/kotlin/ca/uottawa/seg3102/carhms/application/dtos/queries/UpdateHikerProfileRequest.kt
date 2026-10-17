package ca.uottawa.seg3102.carhms.application.dtos.queries

/** Replaces personal details for the authenticated hiker; email remains the identity. */
data class UpdateHikerProfileRequest(
    val hikerEmail: String,
    val details: HikerDetails,
)
