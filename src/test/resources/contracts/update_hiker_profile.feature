# language: fr
# Source : CAR-Req-01, sections 1.5, 2 et 3.2; livrable 1, section 2.
# Commande : UpdateHiker.updateHikerProfile
# Requête : UpdateHikerProfileRequest
@contrat_initial @updateHikerProfile @randonneurs
Fonctionnalité: Mettre à jour ses renseignements personnels
  Le randonneur authentifié soumet ses renseignements personnels actuels modifiés.

Scénario: Remplacer les renseignements personnels par des valeurs valides
    Étant donné un randonneur authentifié sous « lea@example.test »
    Et son adhésion et sa certification éventuelle sont déjà enregistrées
    Quand il soumet pour lui-même un nom, un téléphone, une adresse et une date de naissance valides
    Et un contact d’urgence complet et un niveau d’habileté valides
    Alors ces renseignements personnels sont mis à jour
    Et son statut d’adhésion et sa certification éventuelle restent inchangés

  Scénario: Mettre à jour uniquement les valeurs modifiées dans le formulaire complet
    Étant donné un randonneur authentifié ayant changé de téléphone
    Quand il soumet tous ses renseignements valides avec le nouveau téléphone et les autres valeurs conservées
    Alors le nouveau téléphone est enregistré et les autres valeurs personnelles sont conservées

  Scénario: Refuser des renseignements incomplets
    Étant donné un randonneur authentifié possédant un profil complet
    Quand il soumet son profil sans nom ni téléphone pour son contact d’urgence
    Alors la mise à jour est refusée
    Et son profil reste inchangé

  Scénario: Refuser la modification du profil d’un autre randonneur
    Étant donné un randonneur authentifié comme « lea@example.test »
    Quand il soumet des renseignements pour « autre@example.test » sans y être autorisé
    Alors la mise à jour est refusée
    Et le profil de cet autre randonneur reste inchangé

  Scénario: Refuser la modification sans authentification
    Étant donné un visiteur non authentifié
    Quand il demande la modification d’un profil
    Alors la mise à jour est refusée
    Et le profil reste inchangé
