package ca.uottawa.seg3102.carhms.application.usecases

import ca.uottawa.seg3102.carhms.application.dtos.queries.BrowseHikesRequest
import ca.uottawa.seg3102.carhms.application.dtos.results.HikeSummary

/** Application boundary for the BrowseHikes use case (CAR-Req-01, section 3.2). */
interface BrowseHikes {
    /**
     * Returns open hikes matching the supplied filters, ordered by start date.
     * For an authenticated hiker, identifies which results match their skill eligibility.
     */
    fun browseHikes(request: BrowseHikesRequest): List<HikeSummary>
}
