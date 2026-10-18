# language: fr
# Source : CAR-Req-01, sections 1.5, 2 et 3.2; livrable 1, section 2.
# Commande : BrowseHikes.browseHikes
# Requête : BrowseHikesRequest
@contrat_initial @browseHikes @randonnees @admissibilite
Fonctionnalité: Consulter les randonnées ouvertes
  La consultation publique permet de rechercher les randonnées et de les afficher par date.

Scénario: Lister les randonnées ouvertes sans authentification
    Étant donné une randonnée ouverte le 12 juin 2027 et une autre ouverte le 10 juin 2027
    Et des randonnées complète, fermée et annulée
    Quand un visiteur consulte les randonnées sans filtre ni identité de randonneur
    Alors seules les deux randonnées ouvertes sont retournées dans l’ordre du 10 puis du 12 juin
    Et chaque résultat contient son identifiant, son titre, sa description, son sentier et son organisateur
    Et chaque résultat contient son début, sa durée, sa date limite, sa capacité et ses places restantes
    Et le sentier indique sa difficulté et son point de départ
    Et la correspondance au niveau du randonneur est absente pour ce visiteur

  Plan du scénario: Rechercher avec chacun des critères prévus
    Étant donné deux randonnées ouvertes dont une seule correspond au critère <critère> de valeur <valeur>
    Quand un visiteur recherche les randonnées avec ce seul critère
    Alors seule la randonnée correspondante est retournée

    Exemples:
      | critère        | valeur        |
      | nom du sentier | Sentier A     |
      | date           | 2027-06-10    |
      | difficulté     | facile        |

  @hypothese_documentee
  Scénario: Combiner les filtres fournis
    Étant donné plusieurs randonnées ouvertes
    Quand un visiteur recherche le sentier « Sentier A », le 10 juin 2027, de difficulté facile
    Alors chaque résultat satisfait simultanément ces trois critères

  Scénario: Ne trouver aucune randonnée correspondante
    Étant donné qu’aucune randonnée ouverte ne correspond à la recherche
    Quand un visiteur consulte les randonnées avec ces critères
    Alors une liste vide est retournée

  @hypothese_documentee
  Scénario: Identifier les correspondances pour un randonneur connecté
    Étant donné un randonneur débutant authentifié
    Et trois randonnées ouvertes de difficultés facile, modérée et très difficile
    Quand il consulte sans filtre les randonnées avec sa propre identité
    Alors les trois randonnées sont retournées
    Et les randonnées facile et modérée sont marquées comme correspondant à son niveau
    Et la randonnée très difficile est marquée comme ne correspondant pas à son niveau

  Scénario: Refuser une personnalisation sous l’identité d’un autre randonneur
    Étant donné un utilisateur authentifié comme « lea@example.test »
    Quand il demande une consultation personnalisée sous l’identité « autre@example.test » sans y être autorisé
    Alors la personnalisation sous cette autre identité est refusée
    Et aucune information privée de cet autre randonneur n’est divulguée
