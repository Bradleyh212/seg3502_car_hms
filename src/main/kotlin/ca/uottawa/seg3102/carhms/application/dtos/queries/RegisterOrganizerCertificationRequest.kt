package ca.uottawa.seg3102.carhms.application.dtos.queries

import ca.uottawa.seg3102.carhms.application.dtos.TrailDifficulty
import java.time.LocalDate

/** An authenticated administrator approves an organizer by recording certification. */
data class RegisterOrganizerCertificationRequest(
    val administratorEmail: String,
    val hikerEmail: String,
    val certificateNumber: String,
    val issuedOn: LocalDate,
    val expiresOn: LocalDate,
    val organizerLevel: TrailDifficulty,
)
