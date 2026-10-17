package ca.uottawa.seg3102.carhms.application.dtos.results

import ca.uottawa.seg3102.carhms.application.dtos.TrailDifficulty

/** NCC trail information needed to display a hike and its meeting point. */
data class TrailSummary(
    val trailId: String,
    val name: String,
    val difficulty: TrailDifficulty,
    val startLocation: String,
)
