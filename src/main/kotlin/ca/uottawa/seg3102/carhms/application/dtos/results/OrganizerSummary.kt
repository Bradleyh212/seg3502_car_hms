package ca.uottawa.seg3102.carhms.application.dtos.results

import ca.uottawa.seg3102.carhms.application.dtos.TrailDifficulty

data class OrganizerSummary(
    val email: String,
    val name: String,
    val organizerLevel: TrailDifficulty,
)
