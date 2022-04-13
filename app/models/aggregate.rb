class Aggregate
  def indicateur_clean(symbol)
    I18n.t("activerecord.attributes.indicateurs_list." + symbol.to_s)
  end

  def initialize
    latest_years = []
    Organisation.all.each do |organisation|
      latest_years.push organisation.evaluations.active.pluck(:annee).max
    end
    latest_evaluations = Evaluation.active.where(annee: latest_years)
    @latest_indicateurs_lists = IndicateursList.where(evaluation_id: latest_evaluations)
  end

  def boolean_group(indic_lists, indic_symbols)
    group = {}

    indic_symbols.each do |indic_symbol|
      indic = single_boolean(indic_lists, indic_symbol)
      if not indic.nil?
        group[indic_symbol] = indic
      end
    end

    return group
  end

  def single_boolean(indic_lists, indic_symbol)
    result = nil

    true_count = indic_lists.where("#{indic_symbol.to_s} = ?", true).count
    false_count = indic_lists.where("#{indic_symbol.to_s} = ?", false).count
    sum = true_count + false_count

    if sum > 0
      result = {
        indicateur_clean(indic_symbol) => (true_count / sum * 100),
        ApplicationController.helpers.negative_indicateur(indic_symbol) => (false_count / sum * 100)
      }
    end

    return result
  end

  def pillar1
  {
    :pouvoir_gouvernance_taux => {
      indicateur_clean(:pouvoir_gouvernance_part_salaries_associes) => @latest_indicateurs_lists.median(:pouvoir_gouvernance_part_salaries_associes),
      indicateur_clean(:pouvoir_gouvernance_taux_societariat_femmes) => @latest_indicateurs_lists.median(:pouvoir_gouvernance_taux_societariat_femmes),
      indicateur_clean(:pouvoir_gouvernance_taux_droits_vote_salaries) => @latest_indicateurs_lists.median(:pouvoir_gouvernance_taux_droits_vote_salaries),
      indicateur_clean(:pouvoir_gouvernance_part_femmes_conseil) => @latest_indicateurs_lists.median(:pouvoir_gouvernance_part_femmes_conseil)
    },

    :pouvoir_gouvernance_part_salaries_conseil => @latest_indicateurs_lists.median(:pouvoir_gouvernance_part_salaries_conseil),

    :pouvoir_gouvernance_diversite_categories => {
      "Salariés" => @latest_indicateurs_lists.where("'Salariés' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Investisseurs" => @latest_indicateurs_lists.where("'Investisseurs' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Fournisseurs" => @latest_indicateurs_lists.where("'Fournisseurs' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Sous-traitants" => @latest_indicateurs_lists.where("'Sous-traitants' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Clients" => @latest_indicateurs_lists.where("'Clients' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Experts" => @latest_indicateurs_lists.where("'Experts' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Syndicats" => @latest_indicateurs_lists.where("'Syndicats' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Pouvoirs publics" => @latest_indicateurs_lists.where("'Pouvoirs publics' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Associations" => @latest_indicateurs_lists.where("'Associations' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Grand public" => @latest_indicateurs_lists.where("'Grand public' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Autres" => @latest_indicateurs_lists.where("'Autres' = ANY (pouvoir_gouvernance_diversite_categories)").count
    },

    :pouvoir_democratie_nombres => {
      indicateur_clean(:pouvoir_democratie_nombre_reunions) => @latest_indicateurs_lists.median(:pouvoir_democratie_nombre_reunions),
      indicateur_clean(:pouvoir_democratie_nombre_accords_signes) => @latest_indicateurs_lists.median(:pouvoir_democratie_nombre_accords_signes)
    },

    :pouvoir_democratie_taux_participation_formations => @latest_indicateurs_lists.median(:pouvoir_democratie_taux_participation_formations),

    :pouvoir_strategique_taux => {
      :pouvoir_strategique_taux_presence_assemblee => @latest_indicateurs_lists.median(:pouvoir_strategique_taux_presence_assemblee),
      :pouvoir_strategique_implication_partage => @latest_indicateurs_lists.median(:pouvoir_strategique_implication_partage),
      :pouvoir_strategique_actifs_total => @latest_indicateurs_lists.median(:pouvoir_strategique_actifs_total)
    },

    :pouvoir_democratie_nombres => {
      :pouvoir_democratie_nombre_reunions => @latest_indicateurs_lists.median(:pouvoir_democratie_nombre_reunions),
      :pouvoir_democratie_nombre_accords_signes => @latest_indicateurs_lists.median(:pouvoir_democratie_nombre_accords_signes)
    }
  }
  end

  def pillar2
    @valeur_perennite_booleens = boolean_group(@latest_indicateurs_lists, [
      :valeur_perennite_existence_reserve,
      :valeur_perennite_reserve_impartageable,
      :valeur_perennite_attention_questions_innovation
    ])

    @valeur_part_resultat = {
      indicateur_clean(:valeur_partage_part_resultat_net_actionnaires) => @latest_indicateurs_lists.median(:valeur_partage_part_resultat_net_actionnaires),
      indicateur_clean(:valeur_partage_part_resultat_salaries) => @latest_indicateurs_lists.median(:valeur_partage_part_resultat_salaries)
    }

    @valeur_partage_ecart_revenus_hauts_bas = @latest_indicateurs_lists.median(:valeur_partage_ecart_revenus_hauts_bas)
    @valeur_partage_index_egalite_homme_femme = @latest_indicateurs_lists.median(:valeur_partage_index_egalite_homme_femme)

    @valeur_partage_booleens = boolean_group(@latest_indicateurs_lists, [
      :valeur_partage_existence_accord,
      :valeur_partage_existence_epargne_salariale,
      :valeur_partage_existence_grille_salariale,
      :valeur_partage_publicite_grille
    ])
  end

  def pillar3
    @qualite_qvt_enquete_qvt = single_boolean(@latest_indicateurs_lists, :qualite_qvt_enquete_qvt)

    @qualite_qvt_taux_all = {
      indicateur_clean(:qualite_qvt_taux_qvt) => @latest_indicateurs_lists.median(:qualite_qvt_taux_qvt),
      indicateur_clean(:qualite_qvt_part_cdi) => @latest_indicateurs_lists.median(:qualite_qvt_part_cdi),
      indicateur_clean(:qualite_qvt_taux_turnover) => @latest_indicateurs_lists.median(:qualite_qvt_taux_turnover),
      indicateur_clean(:qualite_qvt_taux_absenteisme) => @latest_indicateurs_lists.median(:qualite_qvt_taux_absenteisme)
    }

    @qualite_qvt_moyenne_anciennete = @latest_indicateurs_lists.average(:qualite_qvt_moyenne_anciennete)
    @qualite_emancipation_moyenne_heures_formation = @latest_indicateurs_lists.average(:qualite_emancipation_moyenne_heures_formation)

    @qualite_emancipation_taux = {
      indicateur_clean(:qualite_emancipation_taux_budget_formation_masse_salariale) => @latest_indicateurs_lists.median(:qualite_emancipation_taux_budget_formation_masse_salariale),
      indicateur_clean(:qualite_emancipation_taux_direction_promotion_interne) => @latest_indicateurs_lists.median(:qualite_emancipation_taux_direction_promotion_interne)
    }
  end

  def pillar4
    @impact_environnement_booleens = boolean_group(@latest_indicateurs_lists, [
      :impact_environnement_audit_impact,
      :impact_environnement_demarche_ecologique,
      :impact_environnement_discussion_impact
    ])

    @impact_environnement_part_energies_renouvelables = @latest_indicateurs_lists.median(:impact_environnement_part_energies_renouvelables)
    @impact_environnement_part_salaries_mobilite = @latest_indicateurs_lists.median(:impact_environnement_part_salaries_mobilite)

    scope1 = @latest_indicateurs_lists.where(impact_environnement_bilan_carbone_scope_1: true).count
    scope2 = @latest_indicateurs_lists.where(impact_environnement_bilan_carbone_scope_2: true).count
    scope3 = @latest_indicateurs_lists.where(impact_environnement_bilan_carbone_scope_3: true).count

    @impact_environnement_scope_booleens = {
      indicateur_clean(:impact_environnement_bilan_carbone_scope_1) => (scope1.to_f / @latest_indicateurs_lists.count * 100),
      indicateur_clean(:impact_environnement_bilan_carbone_scope_2) => (scope2.to_f / @latest_indicateurs_lists.count * 100),
      indicateur_clean(:impact_environnement_bilan_carbone_scope_3) => (scope3.to_f / @latest_indicateurs_lists.count * 100),
      'Total' => ((scope1 + scope2 + scope3).to_f / @latest_indicateurs_lists.count * 100)
    }

    @impact_social_part_activite_structures_insertion = @latest_indicateurs_lists.median(:impact_social_part_activite_structures_insertion)
    @impact_social_alternance_apprentissage = @latest_indicateurs_lists.median(:impact_social_alternance_apprentissage)
    @impact_social_part_seniors = @latest_indicateurs_lists.median(:impact_social_part_seniors)
    @impact_social_part_handicap = @latest_indicateurs_lists.median(:impact_social_part_handicap)

    @impact_engagement = {
      indicateur_clean(:impact_engagement_part_resultat_missions_utiles) => @latest_indicateurs_lists.median(:impact_engagement_part_resultat_missions_utiles),
      indicateur_clean(:impact_engagement_part_placements_responsables) => @latest_indicateurs_lists.median(:impact_engagement_part_placements_responsables),
      indicateur_clean(:impact_engagement_part_impots_france) => @latest_indicateurs_lists.median(:impact_engagement_part_impots_france)
    }

    @impact_engagement_demarche_ethique_fournisseurs = single_boolean(@latest_indicateurs_lists, :impact_engagement_demarche_ethique_fournisseurs)
  end

end