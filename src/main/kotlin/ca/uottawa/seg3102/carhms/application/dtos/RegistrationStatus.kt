package ca.uottawa.seg3102.carhms.application.dtos

/** Registration lifecycle states defined by CAR-Req-01's glossary. */
enum class RegistrationStatus {
    CONFIRMED,
    WAITLISTED,
    CANCELLED,
}
