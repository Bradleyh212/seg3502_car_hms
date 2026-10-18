# language: fr
# Source : CAR-Req-01, sections 1.5, 2 et 3.2; livrable 1, section 2.
# Commande : CancelSignUp.listMyRegistrations
# Requête : ListMyRegistrationsRequest
@contrat_initial @listMyRegistrations @inscriptions
Fonctionnalité: Consulter ses inscriptions avant une annulation
  La lecture fournit au randonneur authentifié les inscriptions à partir desquelles il peut choisir.

Scénario: Consulter ses inscriptions et les informations utiles à la sélection
    Étant donné un randonneur authentifié avec une inscription confirmée et une inscription en attente
    Et les randonnées correspondantes acceptent encore les annulations avant leur date limite
    Et un autre randonneur possède ses propres inscriptions
    Quand il demande ses inscriptions avec sa propre identité
    Alors seules ses inscriptions sont retournées
    Et chaque résultat contient l’identifiant et le titre de la randonnée, le nom du sentier et le début
    Et chaque résultat contient la date limite, l’heure d’inscription, le statut et la possibilité d’annuler
    Et ses deux inscriptions sont indiquées comme annulables

  Scénario: Retourner une liste vide lorsqu’il n’existe aucune inscription
    Étant donné un randonneur authentifié sans inscription
    Quand il demande ses inscriptions avec sa propre identité
    Alors une liste vide est retournée

  @hypothese_documentee
  Scénario: Afficher une inscription annulée sans permettre une nouvelle annulation
    Étant donné un randonneur authentifié possédant une inscription annulée
    Quand il demande ses inscriptions avec sa propre identité
    Alors cette inscription est retournée avec le statut annulé
    Et elle est indiquée comme non annulable

  Scénario: Indiquer qu’une inscription après la date limite n’est plus annulable
    Étant donné un randonneur authentifié inscrit à une randonnée dont la date limite est passée
    Quand il demande ses inscriptions avec sa propre identité
    Alors son inscription est indiquée comme non annulable

  Scénario: Refuser la consultation des inscriptions d’un autre randonneur
    Étant donné un randonneur authentifié comme « lea@example.test »
    Quand il demande les inscriptions de « autre@example.test » sans y être autorisé
    Alors la consultation est refusée
    Et aucune inscription de cet autre randonneur n’est divulguée

  Scénario: Refuser la consultation sans authentification
    Étant donné un visiteur non authentifié
    Quand il demande les inscriptions d’un randonneur
    Alors la consultation est refusée
    Et aucune inscription privée n’est divulguée
