# language: fr
# Source : CAR-Req-01, sections 1.5, 2 et 3.2; livrable 1, section 2.
# Commande : SignUpForHike.signUpForHike
# Requête : SignUpForHikeRequest
@contrat_initial @signUpForHike @inscriptions @admissibilite @randonnees @notifications
Fonctionnalité: S’inscrire à une randonnée
  La demande confirme une place disponible ou rejoint la liste d’attente de la randonnée complète.

Scénario: Confirmer une inscription lorsqu’une place est disponible
    Étant donné un randonneur authentifié avec une adhésion active et un niveau compatible
    Et une randonnée ouverte dont la date limite est future et qui possède deux places restantes
    Quand il confirme son inscription en fournissant sa propre identité et l’identifiant de cette randonnée
    Alors son inscription est confirmée et son heure est consignée
    Et le résultat indique une confirmation sans position dans la liste d’attente
    Et il reste une place et la randonnée reste ouverte
    Et un courriel de confirmation lui est envoyé

  Scénario: Prendre la dernière place disponible
    Étant donné un randonneur authentifié, actif et admissible
    Et une randonnée ouverte possédant une seule place avant sa date limite
    Quand il confirme son inscription à cette randonnée
    Alors son inscription est confirmée
    Et la randonnée devient complète
    Et le randonneur est consigné comme acteur du passage à l’état complet
    Et un courriel de confirmation lui est envoyé

  @hypothese_documentee
  Scénario: Rejoindre la liste d’attente d’une randonnée complète
    Étant donné un randonneur authentifié, actif et admissible
    Et une randonnée complète dont la date limite est future
    Et deux inscriptions sont déjà en attente dans leur ordre d’arrivée
    Quand il confirme son inscription à cette randonnée
    Alors son inscription est en liste d’attente avec son heure consignée
    Et les deux inscriptions précédentes conservent leur ordre devant la sienne
    Et le résultat et le courriel indiquent la position 3
    Et la randonnée reste complète

  @hypothese_documentee
  Plan du scénario: Accepter les niveaux compatibles selon l’hypothèse documentée
    Étant donné un randonneur intermédiaire authentifié dont l’adhésion est active
    Et une randonnée ouverte de difficulté <difficulté> avec une place avant sa date limite
    Quand il confirme son inscription à cette randonnée
    Alors son inscription est confirmée

    Exemples:
      | difficulté |
      | facile     |
      | modérée    |
      | difficile  |

  Plan du scénario: Refuser une adhésion inactive
    Étant donné un randonneur authentifié dont l’adhésion est <statut>
    Et une randonnée ouverte par ailleurs admissible avant sa date limite
    Quand il confirme son inscription à cette randonnée
    Alors l’inscription est refusée et aucune inscription n’est créée

    Exemples:
      | statut    |
      | expirée   |
      | suspendue |

  Scénario: Refuser une difficulté dépassant la limite d’habileté
    Étant donné un randonneur débutant authentifié avec une adhésion active
    Et une randonnée ouverte de difficulté très difficile avant sa date limite
    Quand il confirme son inscription à cette randonnée
    Alors l’inscription est refusée et aucune inscription n’est créée

  Plan du scénario: Refuser une randonnée qui n’accepte plus les inscriptions
    Étant donné un randonneur authentifié, actif et admissible
    Et une randonnée <situation>
    Quand il confirme son inscription à cette randonnée
    Alors l’inscription est refusée et aucune inscription n’est créée

    Exemples:
      | situation                    |
      | fermée                       |
      | annulée                      |
      | dont la date limite est passée |

  Scénario: Refuser l’inscription d’un visiteur
    Étant donné un visiteur non authentifié
    Quand il tente de confirmer une inscription en fournissant un courriel et un identifiant de randonnée
    Alors l’inscription est refusée et aucune inscription n’est créée
