package ca.uottawa.seg3102.carhms.application.usecases

import ca.uottawa.seg3102.carhms.application.dtos.queries.SendHikeReminderRequest

/** Application boundary for the SendHikeReminder use case (CAR-Req-01, section 3.2). */
interface SendHikeReminder {
    /**
     * One day before the hike, emails confirmed hikers its date, time, trail and meeting point.
     * Adds a warning if rain or snow is forecast; sends without a warning if weather is unavailable.
     */
    fun sendHikeReminder(request: SendHikeReminderRequest)
}
