# Contrats initiaux CAR-HMS

Ces fonctionnalités décrivent les préconditions, les actions et les résultats
attendus; elles ne constituent pas une implémentation. Sources :
`SEG3102_Livrable1_FR.pdf`, section 2; `Exigences Initiales-CAR-HMS_exigences_initiales_FR.pdf`
(CAR-Req-01), sections 1.5, 2 et 3.2, pages 2, 3, 7 et 8.

Chaque fichier utilise le dialecte français et indique dans ses commentaires la
fonction Kotlin et le DTO de requête correspondants. Les étiquettes de sous-domaines
renvoient aux huit sous-paquetages existants; elles n’ajoutent aucune fonctionnalité.
Les identifiants techniques des DTO et des énumérations restent ceux du Kotlin.
Les refus sont exprimés sans imposer un code HTTP, une exception ou un type d’erreur.
Les données d’exemple utilisent des courriels fictifs et des dates déterministes.

## Correspondance des contrats

| Fichier | Fonction couverte |
| --- | --- |
| `browse_hikes.feature` | `BrowseHikes.browseHikes` |
| `register_hiker.feature` | `RegisterHiker.registerHiker` |
| `sign_up_for_hike.feature` | `SignUpForHike.signUpForHike` |
| `list_my_registrations.feature` | `CancelSignUp.listMyRegistrations` |
| `cancel_sign_up.feature` | `CancelSignUp.cancelSignUp` |
| `get_hiker_for_update.feature` | `UpdateHiker.getHikerForUpdate` |
| `update_hiker_profile.feature` | `UpdateHiker.updateHikerProfile` |
| `update_membership_status.feature` | `UpdateHiker.updateMembershipStatus` |
| `register_organizer_certification.feature` | `UpdateHiker.registerOrganizerCertification` |
| `close_hike.feature` | `CloseHike.closeHike` |
| `send_hike_reminder.feature` | `SendHikeReminder.sendHikeReminder` |
| `create_hike.feature` | `CreateHike.createHike` |
| `cancel_hike.feature` | `CancelHike.cancelHike` |

## Couverture des interfaces

Les neuf interfaces déclarent treize fonctions, chacune couverte par un fichier
`.feature` distinct. `UpdateHiker.getHikerForUpdate` fournit les renseignements
courants du formulaire avec les DTO existants `GetHikerForUpdateRequest` et
`HikerForUpdate`. Son contrat couvre la lecture par le randonneur lui-même ou un
administrateur autorisé, les certifications absentes ou expirées et les refus
d’accès sans authentification, sans autorisation ou sous une identité usurpée.
Aucun droit de modification supplémentaire n’est accordé par cette lecture.

## Hypothèses documentées reprises

Les scénarios marqués `@hypothese_documentee` appliquent les choix déjà inscrits
dans le README d’`application.usecases`, sans prétendre que le document client les
impose : filtres combinés, correspondance des quatre niveaux, randonnées plus faciles
admissibles, inscription en attente sur une randonnée complète, positions à partir
de un, fermeture automatique attribuée à un acteur système et rappels déclenchés
par une exécution interne autorisée. Le choix de ne pas accepter une date limite
postérieure au début provient également de ce README. Les lectures réutilisent les
DTO existants; les inscriptions annulées sont visibles mais non annulables.

Le contexte authentifié est distinct du simple courriel présent dans une requête.
La date limite et l’autorisation sont revérifiées lors d’une annulation, même si une
lecture antérieure indiquait qu’elle était possible. Les états, dates et permissions
sont des préconditions ou des effets attendus, pas de nouveaux champs de requête.
Les heures d’inscription et les acteurs des changements sont consignés par le système.

## Contradictions et décisions encore nécessaires

- **Admissibilité** : le glossaire limite l’inscription au même niveau ou au niveau
  immédiatement supérieur; le résumé d’inscription permet une difficulté au plus
  d’un niveau supérieure. Le choix documenté autorise les randonnées plus faciles.
  La correspondance ordinale entre habileté et difficulté doit être confirmée par
  l’équipe; les scénarios concernés sont explicitement étiquetés.
- **Accès aux randonnées complètes** : la consultation ne retourne que les randonnées
  ouvertes, mais l’inscription prévoit une liste d’attente sur une randonnée complète.
  Le contrat d’inscription utilise une randonnée déjà identifiée sans inventer un
  nouveau mode de recherche. Le parcours permettant de la sélectionner reste indéfini.
- **Enregistrement et authentification** : le glossaire et le cas d’utilisation
  permettent l’enregistrement d’un visiteur membre du club, tandis que la section
  2.2 impose l’authentification hors consultation publique. Le contrat décrit les
  données de l’enregistrement sans trancher le mécanisme d’accès. La création ou
  l’association des identifiants de connexion n’est pas définie non plus.
- **Déclencheurs automatiques** : le diagramme associe fermeture et rappel au
  randonneur; les résumés décrivent des déclencheurs temporels. Le choix déjà documenté
  d’une exécution interne est signalé; son lien avec l’exigence de consigner un
  utilisateur pour chaque transition doit être confirmé.
- **Instants limites** : « atteinte » et « passée » ne définissent pas uniformément
  l’égalité à la date limite. Les scénarios de fermeture et d’annulation utilisent
  des instants strictement antérieurs ou postérieurs. L’égalité avec le début de la
  randonnée, le calcul calendaire des deux semaines et les changements d’heure ne
  sont pas précisés. L’exemple de deux semaines évite un changement d’heure.
- **Données privées** : `OrganizerSummary` expose un courriel dans une consultation
  publique; le périmètre des informations publiques de l’organisateur doit être
  confirmé. Aucun scénario ne déclare ce courriel public par principe.
- **Profil et historique** : l’immutabilité du courriel est un choix documenté,
  pas une interdiction explicite du client. La réinscription après annulation, les
  doublons, les répétitions de commandes et la durée de conservation de l’historique
  ne sont pas définis; aucun comportement supplémentaire n’est imposé ici.
- **Indisponibilité externe** : le rappel sans météo est défini et couvert. Le
  comportement exact en cas d’indisponibilité de la CCN ou de l’envoi de courriels
  n’est pas décrit. Aucun cache, nouvelle tentative, annulation de transaction ou
  garantie de livraison n’est inventé.
- **Autres validations** : les règles précises de format des coordonnées, les bornes
  de durée et de capacité, les dates incohérentes d’un certificat et la production
  d’erreurs techniques ne sont pas détaillées. Les contrats se limitent aux champs
  obligatoires et aux contraintes explicitement décrites.

## Vérification et portée

Les fichiers sont destinés à être analysés par le parseur Gherkin officiel.
Sans définitions d’étapes ni moteur Cucumber configuré, `./gradlew build` vérifie
la compilation et l’intégration des ressources, pas l’exécution de ces comportements.
Aucune dépendance Cucumber, définition d’étape ou logique métier n’est ajoutée.
Sign In, Sign Out et Generate Trail Usage Report restent exclus conformément au livrable.
