# language: fr
# Source : CAR-Req-01, sections 1.5, 2 et 3.2; livrable 1, section 2.
# Commande : CancelHike.cancelHike
# Requête : CancelHikeRequest
@contrat_initial @cancelHike @randonnees @inscriptions @notifications
Fonctionnalité: Annuler une randonnée
  Son organisateur ou un administrateur peut annuler une randonnée avant son début en précisant un motif.

Scénario: Annuler sa randonnée et avertir tous les inscrits concernés
    Étant donné un organisateur authentifié responsable d’une randonnée qui n’a pas commencé
    Et cette randonnée possède des inscriptions confirmées, en attente et déjà annulées
    Quand il soumet son identité, l’identifiant de la randonnée et le motif « Sentier impraticable »
    Alors la randonnée devient annulée et le motif est enregistré
    Et toutes ses inscriptions confirmées et en attente deviennent annulées
    Et un courriel contenant ce motif est envoyé à chacun des randonneurs de ces inscriptions
    Et les inscriptions déjà annulées conservent leur statut
    Et l’organisateur est consigné comme acteur de l’annulation

  Scénario: Permettre l’annulation par un administrateur
    Étant donné un administrateur authentifié et autorisé
    Et une randonnée qui n’a pas commencé
    Quand il demande son annulation avec un motif
    Alors la randonnée devient annulée
    Et l’administrateur est consigné comme acteur de l’annulation

  Scénario: Annuler une randonnée fermée avant son début
    Étant donné l’organisateur authentifié d’une randonnée fermée dont le début est futur
    Quand il demande son annulation avec un motif
    Alors la randonnée devient annulée
    Et la fermeture des inscriptions n’empêche pas l’annulation de la randonnée

  Scénario: Refuser une annulation après le début
    Étant donné l’organisateur authentifié d’une randonnée qui a déjà commencé
    Quand il demande son annulation avec un motif
    Alors l’annulation est refusée
    Et la randonnée et ses inscriptions restent inchangées

  Scénario: Refuser une annulation sans motif
    Étant donné l’organisateur authentifié d’une randonnée avant son début
    Quand il demande son annulation avec un motif vide
    Alors l’annulation est refusée
    Et la randonnée et ses inscriptions restent inchangées

  Scénario: Refuser l’annulation par un autre organisateur non administrateur
    Étant donné un organisateur authentifié qui n’est ni responsable de la randonnée ni administrateur
    Quand il demande l’annulation de cette randonnée avec un motif
    Alors l’annulation est refusée
    Et la randonnée et ses inscriptions restent inchangées

  Scénario: Refuser l’annulation sans authentification
    Étant donné un visiteur non authentifié
    Quand il demande l’annulation d’une randonnée en fournissant un courriel autorisé
    Alors l’annulation est refusée
    Et la randonnée et ses inscriptions restent inchangées
