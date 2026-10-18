# language: fr
# Source : CAR-Req-01, sections 1.5, 2 et 3.2; livrable 1, section 2.
# Commande : CreateHike.createHike
# Requête : CreateHikeRequest
@contrat_initial @createHike @randonnees @randonneurs @sentiers
Fonctionnalité: Créer une randonnée
  Un organisateur qualifié planifie une randonnée sur un sentier réel de la CCN où la randonnée est permise.

Scénario: Créer une randonnée avec des informations valides
    Étant donné un organisateur authentifié dont la certification est valide à la date prévue
    Et son niveau permet de diriger un sentier CCN de difficulté modérée
    Et le sentier « CCN-A » est réel, situé dans la région de la capitale nationale et autorise la randonnée
    Et ce sentier est ouvert le 10 juin 2027
    Quand l’organisateur soumet sa propre identité et les informations suivantes
      | champ            | valeur                    |
      | title            | Sortie du club            |
      | description      | Randonnée sur le sentier A |
      | trailId          | CCN-A                     |
      | startsAt         | 2027-06-10T09:00:00-04:00 |
      | expectedDuration | PT2H                      |
      | registrationDeadline | 2027-06-09T18:00:00-04:00 |
      | capacity         | 10                        |
    Alors une randonnée est enregistrée avec les informations soumises et un nouvel identifiant unique
    Et cet identifiant est retourné
    Et sa difficulté est celle du sentier et son point de rassemblement est le départ du sentier
    Et la randonnée est ouverte et l’organisateur est consigné comme acteur de sa création

  Scénario: Accepter un certificat expirant le jour de la randonnée
    Étant donné un organisateur authentifié et qualifié dont le certificat expire le 10 juin 2027
    Et une demande par ailleurs valide pour une randonnée le 10 juin 2027
    Quand il soumet cette demande de création
    Alors la randonnée est créée ouverte

  Scénario: Accepter une date limite exactement deux semaines avant la randonnée
    Étant donné un organisateur authentifié et qualifié
    Et une demande par ailleurs valide commençant le 15 juin 2027 à 09 heures à Ottawa
    Et sa date limite est le 1 juin 2027 à 09 heures à Ottawa
    Quand il soumet cette demande de création
    Alors la randonnée est créée ouverte

  Plan du scénario: Refuser une création incompatible avec les exigences
    Étant donné un organisateur authentifié et une demande de création par ailleurs valide
    Et <condition>
    Quand il soumet cette demande de création
    Alors la création est refusée et aucune randonnée n’est créée

    Exemples:
      | condition |
      | le certificat expire avant la date de la randonnée |
      | le certificat n’est pas encore valide à la date de la randonnée |
      | le niveau d’organisateur est inférieur à la difficulté du sentier |
      | la date est hors de la saison d’ouverture du sentier |
      | la date limite précède de plus de deux semaines le début |
      | le sentier n’existe pas dans les données CCN |
      | le sentier est hors de la région de la capitale nationale |
      | la randonnée est interdite sur le sentier |
      | le titre obligatoire est vide |

  @hypothese_documentee
  Scénario: Refuser une date limite postérieure au début de la randonnée
    Étant donné un organisateur authentifié avec une demande par ailleurs valide
    Et la date limite est postérieure au début prévu de la randonnée
    Quand il soumet cette demande de création
    Alors la création est refusée et aucune randonnée n’est créée

  Scénario: Refuser la création par un randonneur non organisateur
    Étant donné un randonneur authentifié sans approbation comme organisateur
    Quand il soumet une demande de création de randonnée
    Alors la création est refusée et aucune randonnée n’est créée

  Scénario: Refuser la création sans authentification
    Étant donné un visiteur non authentifié
    Quand il soumet une demande en fournissant le courriel d’un organisateur
    Alors la création est refusée et aucune randonnée n’est créée
