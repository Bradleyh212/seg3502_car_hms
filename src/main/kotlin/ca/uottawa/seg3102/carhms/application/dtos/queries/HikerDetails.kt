package ca.uottawa.seg3102.carhms.application.dtos.queries

import ca.uottawa.seg3102.carhms.application.dtos.SkillLevel
import java.time.LocalDate

/** Personal information shared by registration and profile updates. */
data class HikerDetails(
    val name: String,
    val phoneNumber: String,
    val homeAddress: String,
    val dateOfBirth: LocalDate,
    val emergencyContact: EmergencyContact,
    val skillLevel: SkillLevel,
)
