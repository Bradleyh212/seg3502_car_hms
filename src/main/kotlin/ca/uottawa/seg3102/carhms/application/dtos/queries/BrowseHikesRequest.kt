package ca.uottawa.seg3102.carhms.application.dtos.queries

import ca.uottawa.seg3102.carhms.application.dtos.TrailDifficulty
import java.time.LocalDate

/** Optional search filters; a null hikerEmail represents a visitor. */
data class BrowseHikesRequest(
    val trailName: String? = null,
    val date: LocalDate? = null,
    val difficulty: TrailDifficulty? = null,
    val hikerEmail: String? = null,
)
