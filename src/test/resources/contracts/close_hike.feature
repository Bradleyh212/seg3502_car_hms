# language: fr
# Source : CAR-Req-01, sections 1.5, 2 et 3.2; livrable 1, section 2.
# Commande : CloseHike.closeHike
# Requête : CloseHikeRequest
@contrat_initial @closeHike @randonnees @inscriptions
Fonctionnalité: Fermer une randonnée à la date limite
  La fermeture empêche ensuite les inscriptions et les annulations d’inscription.

@hypothese_documentee
  Scénario: Fermer automatiquement une randonnée ouverte après sa date limite
    Étant donné une randonnée ouverte dont la date limite est passée et qui n’a pas encore commencé
    Et une exécution interne autorisée selon l’hypothèse de fermeture automatique documentée
    Quand la commande de fermeture reçoit l’identifiant de cette randonnée
    Alors la randonnée devient fermée
    Et un acteur système est consigné pour cette transition selon cette hypothèse
    Et les inscriptions et annulations d’inscription ne sont plus acceptées

  @hypothese_documentee
  Scénario: Fermer une randonnée complète après sa date limite
    Étant donné une randonnée complète dont la date limite est passée
    Et une exécution interne autorisée
    Quand la commande de fermeture reçoit l’identifiant de cette randonnée
    Alors la randonnée devient fermée
    Et ses inscriptions confirmées et en attente sont conservées

  Scénario: Ne pas fermer avant la date limite
    Étant donné une randonnée ouverte dont la date limite est future
    Quand une exécution interne autorisée demande sa fermeture
    Alors la fermeture anticipée n’est pas effectuée
    Et la randonnée reste ouverte

  Scénario: Ne pas permettre à un visiteur de provoquer une fermeture
    Étant donné un visiteur sans authentification ni autorisation
    Quand il demande la fermeture d’une randonnée
    Alors l’accès à la commande est refusé
    Et la randonnée reste inchangée
