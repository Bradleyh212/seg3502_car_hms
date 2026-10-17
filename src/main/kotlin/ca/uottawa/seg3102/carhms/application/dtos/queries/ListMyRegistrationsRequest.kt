package ca.uottawa.seg3102.carhms.application.dtos.queries

/** hikerEmail must be obtained from the authenticated hiker identity. */
data class ListMyRegistrationsRequest(
    val hikerEmail: String,
)
