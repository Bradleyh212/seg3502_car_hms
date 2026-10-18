# language: fr
# Source : CAR-Req-01, sections 1.5, 2.2 et 3.2; livrable 1, section 2.
# Commande : UpdateHiker.getHikerForUpdate
# Requête : GetHikerForUpdateRequest
# Réponse : HikerForUpdate
@contrat_initial @getHikerForUpdate @randonneurs
Fonctionnalité: Consulter les renseignements courants pour le formulaire de mise à jour
  Le randonneur consulte ses renseignements et un administrateur autorisé consulte ceux du randonneur choisi.
  La lecture ne modifie aucune donnée et ne confère aucun droit supplémentaire de modification.

  Scénario: Consulter ses propres renseignements pour remplir le formulaire
    Étant donné un randonneur authentifié sous « lea@example.test » avec un profil enregistré
    Et son profil contient son nom, son téléphone, son adresse, sa date de naissance et son niveau d’habileté
    Et son contact d’urgence possède un nom et un téléphone
    Et son statut d’adhésion est enregistré
    Quand il demande les renseignements courants avec « lea@example.test » comme acteur et comme randonneur cible
    Alors le résultat contient son courriel et tous ses renseignements personnels actuels
    Et il contient son contact d’urgence et son statut d’adhésion actuel
    Et aucune donnée du randonneur n’est modifiée

  Scénario: Permettre à un administrateur autorisé de consulter un randonneur
    Étant donné un administrateur authentifié sous « admin@example.test » et autorisé à mettre à jour les randonneurs
    Et le randonneur « lea@example.test » possède un profil, une adhésion et une certification enregistrés
    Quand l’administrateur demande les renseignements avec son identité comme acteur et « lea@example.test » comme cible
    Alors le résultat contient les renseignements courants de « lea@example.test » et son statut d’adhésion
    Et il contient le numéro du certificat, les dates de délivrance et d’expiration et le niveau d’organisateur enregistrés
    Et aucune donnée du randonneur n’est modifiée

  Scénario: Représenter l’absence de certification
    Étant donné un randonneur authentifié sans certification d’organisateur enregistrée
    Quand il demande ses propres renseignements courants
    Alors le résultat contient son profil et son statut d’adhésion
    Et la certification d’organisateur est absente du résultat

  Scénario: Conserver les valeurs d’une certification expirée dans le formulaire
    Étant donné un administrateur authentifié et autorisé à consulter le randonneur cible
    Et ce randonneur possède une certification enregistrée dont la date d’expiration est passée
    Quand l’administrateur demande les renseignements courants de ce randonneur
    Alors le résultat contient la certification enregistrée avec son numéro, ses dates et son niveau d’organisateur
    Et la certification n’est pas présentée comme absente du seul fait de son expiration
    Et aucune donnée du randonneur n’est modifiée

  Scénario: Refuser la consultation d’un autre randonneur sans autorisation
    Étant donné un randonneur authentifié sous « lea@example.test » sans rôle d’administrateur
    Quand il demande les renseignements de « autre@example.test » en utilisant sa propre identité comme acteur
    Alors la consultation est refusée
    Et aucun renseignement privé du randonneur cible n’est divulgué
    Et aucune donnée du randonneur cible n’est modifiée

  Scénario: Refuser la consultation par un visiteur non authentifié
    Étant donné un visiteur non authentifié
    Quand il demande les renseignements d’un randonneur en fournissant un courriel comme identité d’acteur
    Alors la consultation est refusée
    Et aucun renseignement privé du randonneur cible n’est divulgué

  Scénario: Refuser l’usurpation d’une identité d’administrateur dans la requête
    Étant donné un randonneur authentifié sous « lea@example.test » sans rôle d’administrateur
    Quand il demande les renseignements de « autre@example.test » en fournissant « admin@example.test » comme acteur
    Alors la consultation est refusée car le courriel fourni ne lui confère pas les droits d’un administrateur
    Et aucun renseignement privé du randonneur cible n’est divulgué
