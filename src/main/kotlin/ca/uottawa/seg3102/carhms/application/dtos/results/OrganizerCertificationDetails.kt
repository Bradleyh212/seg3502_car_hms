package ca.uottawa.seg3102.carhms.application.dtos.results

import ca.uottawa.seg3102.carhms.application.dtos.TrailDifficulty
import java.time.LocalDate

/** Existing certification values used to prepopulate the administrator's update form. */
data class OrganizerCertificationDetails(
    val certificateNumber: String,
    val issuedOn: LocalDate,
    val expiresOn: LocalDate,
    val organizerLevel: TrailDifficulty,
)
