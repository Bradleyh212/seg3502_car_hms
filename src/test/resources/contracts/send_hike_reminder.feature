# language: fr
# Source : CAR-Req-01, sections 1.5, 2 et 3.2; livrable 1, section 2.
# Commande : SendHikeReminder.sendHikeReminder
# Requête : SendHikeReminderRequest
@contrat_initial @sendHikeReminder @notifications
Fonctionnalité: Envoyer le rappel d’une randonnée
  Un jour avant la randonnée, les participants confirmés reçoivent les informations de départ et la météo disponible.

@hypothese_documentee
  Scénario: Envoyer le rappel aux seuls participants confirmés
    Étant donné une randonnée non annulée prévue le lendemain
    Et des inscriptions confirmées, en attente et annulées
    Et les prévisions au point de départ pour la date de la randonnée n’annoncent ni pluie ni neige
    Quand une exécution interne autorisée demande le rappel avec l’identifiant de la randonnée
    Alors chaque participant confirmé reçoit un courriel indiquant la date, l’heure, le sentier et le point de départ
    Et aucun inscrit en attente ou annulé ne reçoit ce rappel
    Et le rappel ne comporte pas d’avertissement de pluie ou de neige

  Plan du scénario: Ajouter un avertissement en cas de pluie ou de neige prévue
    Étant donné une randonnée prévue le lendemain avec des participants confirmés
    Et les prévisions pour son point de départ et sa date annoncent <précipitations>
    Quand une exécution interne autorisée demande le rappel pour cette randonnée
    Alors le rappel est envoyé à chaque participant confirmé
    Et il contient un avertissement correspondant aux précipitations prévues

    Exemples:
      | précipitations |
      | de la pluie    |
      | de la neige    |

  Scénario: Envoyer le rappel malgré l’indisponibilité de la météo
    Étant donné une randonnée prévue le lendemain avec des participants confirmés
    Et les prévisions météorologiques ne peuvent pas être obtenues
    Quand une exécution interne autorisée demande le rappel pour cette randonnée
    Alors chaque participant confirmé reçoit les informations de départ
    Et le courriel est envoyé sans avertissement météorologique

  Scénario: N’envoyer aucun rappel en l’absence de participant confirmé
    Étant donné une randonnée prévue le lendemain sans inscription confirmée
    Quand une exécution interne autorisée demande le rappel pour cette randonnée
    Alors aucun courriel de rappel n’est envoyé

  Scénario: Refuser une demande de rappel non autorisée
    Étant donné un visiteur sans authentification ni autorisation
    Quand il tente de demander le rappel d’une randonnée
    Alors l’accès à la commande est refusé
    Et aucun courriel n’est envoyé par cette demande
