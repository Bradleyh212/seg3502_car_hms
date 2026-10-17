package ca.uottawa.seg3102.carhms.application.dtos.queries

/** The authenticated actor must be the target hiker or an authorized administrator. */
data class GetHikerForUpdateRequest(
    val actorEmail: String,
    val hikerEmail: String,
)
