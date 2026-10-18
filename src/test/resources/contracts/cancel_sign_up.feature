# language: fr
# Source : CAR-Req-01, sections 1.5, 2 et 3.2; livrable 1, section 2.
# Commande : CancelSignUp.cancelSignUp
# Requête : CancelSignUpRequest
@contrat_initial @cancelSignUp @inscriptions @randonnees @notifications
Fonctionnalité: Annuler une inscription
  Un randonneur annule sa propre inscription avant la date limite de la randonnée.

Scénario: Annuler une inscription confirmée sans liste d’attente
    Étant donné un randonneur authentifié inscrit avec confirmation à une randonnée complète
    Et la date limite est future et aucune inscription n’est en attente
    Quand il confirme l’annulation avec sa propre identité et l’identifiant de la randonnée
    Alors son inscription devient annulée
    Et une place est disponible et la randonnée redevient ouverte
    Et le randonneur est consigné comme acteur de cette réouverture

  Scénario: Promouvoir le premier randonneur en attente
    Étant donné un randonneur authentifié inscrit avec confirmation à une randonnée complète avant sa date limite
    Et « premier@example.test » puis « suivant@example.test » sont inscrits en attente dans cet ordre
    Quand il confirme l’annulation de son inscription
    Alors son inscription devient annulée
    Et l’inscription de « premier@example.test » devient confirmée
    Et celle de « suivant@example.test » reste en attente
    Et un courriel informe « premier@example.test » de sa promotion
    Et la randonnée reste complète car la place libérée est reprise

  Scénario: Annuler une inscription en attente
    Étant donné un randonneur authentifié en liste d’attente avant la date limite
    Quand il confirme l’annulation de son inscription
    Alors son inscription devient annulée
    Et les inscriptions confirmées restent inchangées
    Et aucune place confirmée n’est libérée par cette annulation

  Scénario: Refuser une annulation après la date limite
    Étant donné un randonneur authentifié avec une inscription confirmée dont la date limite est passée
    Quand il confirme l’annulation de cette inscription
    Alors l’annulation est refusée
    Et son inscription reste confirmée

  Scénario: Revérifier la date limite après la consultation des inscriptions
    Étant donné un randonneur ayant consulté une inscription alors indiquée comme annulable
    Et la date limite est passée depuis cette consultation
    Quand il confirme l’annulation de cette inscription
    Alors l’annulation est refusée
    Et l’inscription reste inchangée

  Scénario: Refuser l’annulation de l’inscription d’un autre randonneur
    Étant donné un utilisateur authentifié comme « lea@example.test »
    Quand il demande l’annulation de l’inscription de « autre@example.test » sans y être autorisé
    Alors l’annulation est refusée
    Et l’inscription de cet autre randonneur reste inchangée

  Scénario: Refuser l’annulation sans authentification
    Étant donné un visiteur non authentifié
    Quand il demande l’annulation d’une inscription
    Alors l’annulation est refusée
    Et les inscriptions restent inchangées
