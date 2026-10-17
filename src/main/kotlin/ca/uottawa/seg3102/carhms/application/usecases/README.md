# CAR-HMS application use cases

These declarations cover Deliverable 1's nine included use cases, based on
SEG3102_Livrable1_FR.pdf section 2 and CAR-Req-01 section 3.2 and glossary.
They specify application boundaries only; KDoc describes future behavior and
does not enforce validation, authorization, persistence, scheduling, or email delivery.
Sign In, Sign Out and Generate Trail Usage Report are intentionally excluded.

| Interface | Application commands |
| --- | --- |
| BrowseHikes | browseHikes |
| RegisterHiker | registerHiker |
| SignUpForHike | signUpForHike |
| CancelSignUp | listMyRegistrations, cancelSignUp |
| UpdateHiker | getHikerForUpdate, updateHikerProfile, updateMembershipStatus, registerOrganizerCertification |
| CloseHike | closeHike |
| SendHikeReminder | sendHikeReminder |
| CreateHike | createHike |
| CancelHike | cancelHike |

Input DTOs reside in `application.dtos.queries`, as required by Deliverable 1.
Read/result DTOs reside in `application.dtos.results`; shared enums are in
`application.dtos`. No domain entities are exposed or implemented.

## Supporting reads

CAR-Req-01 section 3.2 describes choosing an existing registration before cancellation
and displaying current hiker information before an update. These interactions have
explicit read operations alongside the existing commands:

- `CancelSignUp.listMyRegistrations` accepts the authenticated hiker's email and
  returns their registrations with hike identity/title/trail/start/deadline,
  registration time, lifecycle status and current cancellation eligibility.
  `RegistrationStatus` includes confirmed, waitlisted and cancelled records; only
  eligible confirmed/waitlisted records can be selected for cancellation. Including
  cancelled records is a presentation choice, not a new cancellation capability.
  `canCancel` is a read-time snapshot and must be rechecked by the cancellation command.
- `UpdateHiker.getHikerForUpdate` accepts the trusted actor identity and target hiker
  email. It returns existing personal details, email, membership status and optional
  organizer certification (number, issue/expiry dates and organizer level).
  This supports both the hiker's personal form and the administrator's membership
  and certification form. Authorization must restrict access to self or an authorized
  administrator; returned values do not expand the existing write permissions.
- `HikerForUpdate` reuses the existing immutable `HikerDetails` DTO for the shared
  profile fields. Missing certification is represented by null; an expired recorded
  certification is still returned with its dates. No credentials or invitation
  codes are included in either response.

These are declarations and data only. No retrieval, authorization, eligibility
calculation or command behavior is implemented.

## Signature and interpretation assumptions

- Hikers are identified by their unique email; this initial API treats that identity
  as immutable during personal-profile updates. Hike identifiers are UUIDs; trail
  identifiers are opaque NCC strings. A registration is identified by hike and hiker.
- Actor emails must be derived from a trusted authenticated context by a future
  adapter. Passing an email is not authentication or authorization. Registration
  accepts an invitation and waiver; credentials belong to the excluded sign-in flow.
- Profile updates replace all personal details. Administrative membership changes
  and certification approval are separate commands under UpdateHiker because their
  inputs and permissions differ. No external membership-management process is added.
- Browse filters are optional and combine when supplied. Results are sorted by
  start time ascending. A null hiker identity denotes a visitor. For authenticated
  hikers, matchesHikerSkillLevel marks suitable hikes; it is null for visitors.
  This preserves public browsing while adding the personalized matches described
  in section 3.2. The four hiker levels correspond in order
  to the four trail difficulties; eligibility is no more than one level above the
  hiker's level, allowing easier hikes (section 3.2 resolves the narrower glossary).
- A full hike accepts waitlist registrations until its deadline, as stated in the
  sign-up use case despite the reference to open hikes. Waitlist positions are
  one-based; confirmed results have no waitlist position.
- Hike timestamps use OffsetDateTime to retain their UTC offset; expected duration
  uses Duration and birth/certificate dates use LocalDate. The future implementation
  interprets date-only searches and calendar rules in the club's Ottawa time zone
  (America/Toronto). A deadline must be before the hike and no more than two weeks
  earlier; this reconciles the explicit maximum gap with registration before a hike.
- CloseHike and SendHikeReminder operate on one hike per call. A future scheduler
  selects due hikes; automatic closure is attributed to a system actor. Requests
  do not accept a client-supplied clock or fabricate a human actor for scheduled work.
- Opening a hike, filling it, reopening it and cancelling it carry the responsible
  actor in their requests. Waitlist promotion and email notifications are effects
  of their parent commands, not additional commands or implemented services.
- Name, address and the trail start location are initially free-form text. Organizer
  level uses the trail-difficulty scale because it denotes maximum leadable difficulty.
  Browse returns public hike/trail/organizer information, never private hiker details.
- CreateHike returns its generated identifier; SignUpForHike returns confirmation
  or waitlist status; browsing returns hike summaries. Other commands return Unit
  on success. Error types and failure transport are deferred; Unit does not encode
  failure. These DTOs intentionally contain no validation or business logic.
