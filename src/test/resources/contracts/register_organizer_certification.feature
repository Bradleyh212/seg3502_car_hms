# language: fr
# Source : CAR-Req-01, sections 1.5, 2 et 3.2; livrable 1, section 2.
# Commande : UpdateHiker.registerOrganizerCertification
# Requête : RegisterOrganizerCertificationRequest
@contrat_initial @registerOrganizerCertification @randonneurs
Fonctionnalité: Enregistrer une certification d’organisateur
  L’administrateur approuve un randonneur comme organisateur en enregistrant sa certification et son niveau.

Scénario: Approuver un organisateur avec une certification complète
    Étant donné un administrateur authentifié autorisé à mettre à jour les randonneurs
    Et un randonneur existant sans certification enregistrée
    Quand l’administrateur soumet son identité et celle du randonneur
    Et le certificat « CERT-2027-01 » délivré le 1 janvier 2027 et expirant le 31 décembre 2027
    Et le niveau d’organisateur correspondant à la difficulté difficile
    Alors le numéro, les dates et le niveau d’organisateur sont enregistrés pour ce randonneur
    Et le randonneur est approuvé comme organisateur
    Et ses renseignements personnels et son statut d’adhésion restent inchangés

  Plan du scénario: Enregistrer les niveaux d’organisateur prévus par le modèle existant
    Étant donné un administrateur authentifié et autorisé avec une certification complète pour un randonneur
    Quand il enregistre le niveau maximal <niveau> pour cet organisateur
    Alors le niveau maximal enregistré est <niveau>

    Exemples:
      | niveau         |
      | facile         |
      | modéré         |
      | difficile      |
      | très difficile |

  Scénario: Refuser une certification sans numéro de certificat
    Étant donné un administrateur authentifié et autorisé
    Et un randonneur existant
    Quand l’administrateur soumet une certification avec un numéro vide
    Alors l’enregistrement de la certification est refusé
    Et les qualifications du randonneur restent inchangées

  Scénario: Refuser une approbation par un randonneur non administrateur
    Étant donné un randonneur authentifié sans rôle d’administrateur
    Quand il tente d’enregistrer une certification d’organisateur
    Alors l’enregistrement est refusé
    Et les qualifications restent inchangées

  Scénario: Refuser une approbation sans authentification
    Étant donné un visiteur non authentifié
    Quand il tente d’enregistrer une certification en fournissant un courriel d’administrateur
    Alors l’enregistrement est refusé
    Et les qualifications restent inchangées
