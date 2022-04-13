class StatistiquesController < ApplicationController
  def pillar1
    aggregate = Aggregate.new
    @pouvoir_gouvernance_taux = aggregate.pouvoir_gouvernance_taux
  end

  def pillar2
    aggregate = Aggregate.new

    @valeur_perennite_booleens = aggregate.valeur_perennite_booleens
    @valeur_part_resultat = aggregate.valeur_part_resultat
    @valeur_partage_booleens = aggregate.valeur_partage_booleens
  end

  def pillar3
    aggregate = Aggregate.new

    @qualite_qvt_enquete_qvt = aggregate.qualite_qvt_enquete_qvt
    @qualite_qvt_taux_all = aggregate.qualite_qvt_taux_all
    @qualite_emancipation_taux = aggregate.qualite_emancipation_taux
  end

  def pillar4
    @impact_environnement_booleens = boolean_group(@latest_states, [
      :impact_environnement_audit_impact,
      :impact_environnement_demarche_ecologique,
      :impact_environnement_discussion_impact
    ])

    @impact_environnement_part_energies_renouvelables = @latest_states.median(:impact_environnement_part_energies_renouvelables)
    @impact_environnement_part_salaries_mobilite = @latest_states.median(:impact_environnement_part_salaries_mobilite)

    scope1 = @latest_states.where(impact_environnement_bilan_carbone_scope_1: true).count
    scope2 = @latest_states.where(impact_environnement_bilan_carbone_scope_2: true).count
    scope3 = @latest_states.where(impact_environnement_bilan_carbone_scope_3: true).count

    @impact_environnement_scope_booleens = {
      helpers.indicateur_clean(:impact_environnement_bilan_carbone_scope_1) => (scope1.to_f / @latest_states.count * 100),
      helpers.indicateur_clean(:impact_environnement_bilan_carbone_scope_2) => (scope2.to_f / @latest_states.count * 100),
      helpers.indicateur_clean(:impact_environnement_bilan_carbone_scope_3) => (scope3.to_f / @latest_states.count * 100),
      'Total' => ((scope1 + scope2 + scope3).to_f / @latest_states.count * 100)
    }

    @impact_social_part_activite_structures_insertion = @latest_states.median(:impact_social_part_activite_structures_insertion)
    @impact_social_alternance_apprentissage = @latest_states.median(:impact_social_alternance_apprentissage)
    @impact_social_part_seniors = @latest_states.median(:impact_social_part_seniors)
    @impact_social_part_handicap = @latest_states.median(:impact_social_part_handicap)

    @impact_engagement = {
      helpers.indicateur_clean(:impact_engagement_part_resultat_missions_utiles) => @latest_states.median(:impact_engagement_part_resultat_missions_utiles),
      helpers.indicateur_clean(:impact_engagement_part_placements_responsables) => @latest_states.median(:impact_engagement_part_placements_responsables),
      helpers.indicateur_clean(:impact_engagement_part_impots_france) => @latest_states.median(:impact_engagement_part_impots_france)
    }

    @impact_engagement_demarche_ethique_fournisseurs = single_boolean(@latest_states, :impact_engagement_demarche_ethique_fournisseurs)
  end
end
