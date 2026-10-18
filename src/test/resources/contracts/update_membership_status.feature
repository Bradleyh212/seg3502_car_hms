# language: fr
# Source : CAR-Req-01, sections 1.5, 2 et 3.2; livrable 1, section 2.
# Commande : UpdateHiker.updateMembershipStatus
# Requête : UpdateMembershipStatusRequest
@contrat_initial @updateMembershipStatus @randonneurs @admissibilite
Fonctionnalité: Mettre à jour le statut d’adhésion
  Un administrateur autorisé enregistre le statut d’adhésion d’un randonneur existant.

Scénario: Suspendre une adhésion active
    Étant donné un administrateur authentifié autorisé à mettre à jour les randonneurs
    Et un randonneur dont l’adhésion est active
    Quand l’administrateur soumet son identité, celle du randonneur et le statut suspendu
    Alors le statut d’adhésion du randonneur devient suspendu
    Et ses renseignements personnels et sa certification éventuelle restent inchangés

  Plan du scénario: Enregistrer un autre statut prévu
    Étant donné un administrateur authentifié autorisé à mettre à jour les randonneurs
    Et un randonneur existant
    Quand l’administrateur enregistre pour ce randonneur le statut <statut>
    Alors le statut d’adhésion enregistré est <statut>

    Exemples:
      | statut |
      | actif  |
      | expiré |

  Scénario: Refuser qu’un randonneur modifie lui-même son statut
    Étant donné un randonneur authentifié sans rôle d’administrateur
    Quand il tente de modifier son statut d’adhésion
    Alors la modification est refusée
    Et le statut d’adhésion reste inchangé

  Scénario: Refuser une modification sans authentification
    Étant donné un visiteur non authentifié
    Quand il soumet une modification de statut en fournissant un courriel d’administrateur
    Alors la modification est refusée
    Et le statut d’adhésion reste inchangé
