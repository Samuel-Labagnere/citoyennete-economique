class StatistiquesController < ApplicationController
  def pillar1
    aggregate = Aggregate.new
    pillar1 = aggregate.pillar1

    @pouvoir_gouvernance_taux = pillar1[:pouvoir_gouvernance_taux]
    @pouvoir_democratie_nombres = pillar1[:pouvoir_democratie_nombres]
    @pouvoir_democratie_taux_participation_formations = pillar1[:pouvoir_democratie_taux_participation_formations]
    @pouvoir_strategique_taux = pillar1[:pouvoir_strategique_taux]
    @pouvoir_democratie_nombres = pillar1[:pouvoir_democratie_nombres]
  end

  def pillar2
    @valeur_perennite_booleens = boolean_group($latest_indicateurs_lists, [
      :valeur_perennite_existence_reserve,
      :valeur_perennite_reserve_impartageable,
      :valeur_perennite_attention_questions_innovation
    ])

    @valeur_part_resultat = {
      helpers.indicateur_clean(:valeur_partage_part_resultat_net_actionnaires) => $latest_indicateurs_lists.median(:valeur_partage_part_resultat_net_actionnaires),
      helpers.indicateur_clean(:valeur_partage_part_resultat_salaries) => $latest_indicateurs_lists.median(:valeur_partage_part_resultat_salaries)
    }

    @valeur_partage_ecart_revenus_hauts_bas = $latest_indicateurs_lists.median(:valeur_partage_ecart_revenus_hauts_bas)
    @valeur_partage_index_egalite_homme_femme = $latest_indicateurs_lists.median(:valeur_partage_index_egalite_homme_femme)

    @valeur_partage_booleens = boolean_group($latest_indicateurs_lists, [
      :valeur_partage_existence_accord,
      :valeur_partage_existence_epargne_salariale,
      :valeur_partage_existence_grille_salariale,
      :valeur_partage_publicite_grille
    ])
  end

  def pillar3
    @qualite_qvt_enquete_qvt = single_boolean($latest_indicateurs_lists, :qualite_qvt_enquete_qvt)

    @qualite_qvt_taux_all = {
      helpers.indicateur_clean(:qualite_qvt_taux_qvt) => $latest_indicateurs_lists.median(:qualite_qvt_taux_qvt),
      helpers.indicateur_clean(:qualite_qvt_part_cdi) => $latest_indicateurs_lists.median(:qualite_qvt_part_cdi),
      helpers.indicateur_clean(:qualite_qvt_taux_turnover) => $latest_indicateurs_lists.median(:qualite_qvt_taux_turnover),
      helpers.indicateur_clean(:qualite_qvt_taux_absenteisme) => $latest_indicateurs_lists.median(:qualite_qvt_taux_absenteisme)
    }

    @qualite_qvt_moyenne_anciennete = $latest_indicateurs_lists.average(:qualite_qvt_moyenne_anciennete)
    @qualite_emancipation_moyenne_heures_formation = $latest_indicateurs_lists.average(:qualite_emancipation_moyenne_heures_formation)

    @qualite_emancipation_taux = {
      helpers.indicateur_clean(:qualite_emancipation_taux_budget_formation_masse_salariale) => $latest_indicateurs_lists.median(:qualite_emancipation_taux_budget_formation_masse_salariale),
      helpers.indicateur_clean(:qualite_emancipation_taux_direction_promotion_interne) => $latest_indicateurs_lists.median(:qualite_emancipation_taux_direction_promotion_interne)
    }
  end

  def pillar4
    @impact_environnement_booleens = boolean_group($latest_indicateurs_lists, [
      :impact_environnement_audit_impact,
      :impact_environnement_demarche_ecologique,
      :impact_environnement_discussion_impact
    ])

    @impact_environnement_part_energies_renouvelables = $latest_indicateurs_lists.median(:impact_environnement_part_energies_renouvelables)
    @impact_environnement_part_salaries_mobilite = $latest_indicateurs_lists.median(:impact_environnement_part_salaries_mobilite)

    scope1 = $latest_indicateurs_lists.where(impact_environnement_bilan_carbone_scope_1: true).count
    scope2 = $latest_indicateurs_lists.where(impact_environnement_bilan_carbone_scope_2: true).count
    scope3 = $latest_indicateurs_lists.where(impact_environnement_bilan_carbone_scope_3: true).count

    @impact_environnement_scope_booleens = {
      helpers.indicateur_clean(:impact_environnement_bilan_carbone_scope_1) => (scope1.to_f / $latest_indicateurs_lists.count * 100),
      helpers.indicateur_clean(:impact_environnement_bilan_carbone_scope_2) => (scope2.to_f / $latest_indicateurs_lists.count * 100),
      helpers.indicateur_clean(:impact_environnement_bilan_carbone_scope_3) => (scope3.to_f / $latest_indicateurs_lists.count * 100),
      'Total' => ((scope1 + scope2 + scope3).to_f / $latest_indicateurs_lists.count * 100)
    }

    @impact_social_part_activite_structures_insertion = $latest_indicateurs_lists.median(:impact_social_part_activite_structures_insertion)
    @impact_social_alternance_apprentissage = $latest_indicateurs_lists.median(:impact_social_alternance_apprentissage)
    @impact_social_part_seniors = $latest_indicateurs_lists.median(:impact_social_part_seniors)
    @impact_social_part_handicap = $latest_indicateurs_lists.median(:impact_social_part_handicap)

    @impact_engagement = {
      helpers.indicateur_clean(:impact_engagement_part_resultat_missions_utiles) => $latest_indicateurs_lists.median(:impact_engagement_part_resultat_missions_utiles),
      helpers.indicateur_clean(:impact_engagement_part_placements_responsables) => $latest_indicateurs_lists.median(:impact_engagement_part_placements_responsables),
      helpers.indicateur_clean(:impact_engagement_part_impots_france) => $latest_indicateurs_lists.median(:impact_engagement_part_impots_france)
    }

    @impact_engagement_demarche_ethique_fournisseurs = single_boolean($latest_indicateurs_lists, :impact_engagement_demarche_ethique_fournisseurs)
  end
end
