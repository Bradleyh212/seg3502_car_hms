# language: fr
# Source : CAR-Req-01, sections 1.5, 2 et 3.2; livrable 1, section 2.
# Commande : RegisterHiker.registerHiker
# Requête : RegisterHikerRequest
@contrat_initial @registerHiker @randonneurs
Fonctionnalité: Enregistrer un randonneur
  Un membre du club présente son invitation, ses renseignements et une décharge acceptée.

Scénario: Enregistrer un membre majeur avec des informations valides
    Étant donné un membre du club âgé de 25 ans disposant d’un code d’invitation valide
    Et le courriel unique « lea@example.test » qui n’est pas déjà enregistré
    Quand il soumet son courriel, son code et l’acceptation de la décharge
    Et ses renseignements comprennent son nom, son téléphone, son adresse et sa date de naissance
    Et ses renseignements comprennent le nom et le téléphone du contact d’urgence et son niveau d’habileté
    Alors le randonneur est enregistré avec ces renseignements
    Et son adhésion est active

  Scénario: Enregistrer un mineur dont le tuteur accepte la décharge
    Étant donné un membre du club âgé de 16 ans avec une invitation valide et un courriel non enregistré
    Et son tuteur légal « Camille Martin » accepte la décharge
    Quand l’inscription est soumise avec tous les renseignements valides et le nom du tuteur
    Alors le randonneur est enregistré avec une adhésion active
    Et le nom « Camille Martin » est consigné comme tuteur ayant accepté la décharge

  Scénario: Refuser un code d’invitation invalide
    Étant donné une demande contenant tous les renseignements valides et une décharge acceptée
    Quand l’enregistrement est soumis avec un code d’invitation invalide
    Alors l’enregistrement est refusé
    Et aucun randonneur n’est créé par cette demande

  Scénario: Refuser un courriel déjà enregistré
    Étant donné un randonneur enregistré sous « lea@example.test »
    Quand un autre enregistrement valide est soumis avec ce même courriel
    Alors l’enregistrement est refusé
    Et le randonneur existant reste inchangé

  Scénario: Refuser une décharge non acceptée
    Étant donné une demande d’enregistrement par ailleurs valide
    Quand elle est soumise avec la décharge non acceptée
    Alors l’enregistrement est refusé
    Et aucun randonneur n’est créé par cette demande

  Scénario: Refuser l’enregistrement d’un mineur sans nom du tuteur
    Étant donné une demande d’enregistrement d’un membre âgé de 16 ans
    Quand elle est soumise sans nom de tuteur légal
    Alors l’enregistrement est refusé
    Et aucun randonneur n’est créé par cette demande

  Scénario: Refuser des renseignements personnels incomplets
    Étant donné un membre avec un courriel unique, une invitation valide et une décharge acceptée
    Quand il soumet une demande sans nom ni téléphone pour son contact d’urgence
    Alors l’enregistrement est refusé
    Et aucun randonneur n’est créé par cette demande
