class Aggregate
  def indicateur_clean(symbol)
    I18n.t("activerecord.attributes.state." + symbol.to_s)
  end

  def initialize
    latest_years = []
    Organisation.all.each do |organisation|
      latest_years.push organisation.evaluations.active.pluck(:annee).max
    end
    latest_evaluations = Evaluation.active.where(annee: latest_years)
    @latest_states = State.where(evaluation_id: latest_evaluations)
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

  # PILLAR 1

  def pouvoir_gouvernance_taux
  {
    indicateur_clean(:pouvoir_gouvernance_part_salaries_associes) => @latest_states.median(:pouvoir_gouvernance_part_salaries_associes),
    indicateur_clean(:pouvoir_gouvernance_taux_societariat_femmes) => @latest_states.median(:pouvoir_gouvernance_taux_societariat_femmes),
    indicateur_clean(:pouvoir_gouvernance_taux_droits_vote_salaries) => @latest_states.median(:pouvoir_gouvernance_taux_droits_vote_salaries),
    indicateur_clean(:pouvoir_gouvernance_part_femmes_conseil) => @latest_states.median(:pouvoir_gouvernance_part_femmes_conseil)
  }
  end

  # PILLAR 2

  def valeur_part_resultat
  {
    indicateur_clean(:valeur_partage_part_resultat_net_actionnaires) => @latest_states.median(:valeur_partage_part_resultat_net_actionnaires),
    indicateur_clean(:valeur_partage_part_resultat_salaries) => @latest_states.median(:valeur_partage_part_resultat_salaries)
  }
  end

  def valeur_perennite_booleens
    boolean_group(@latest_states, [
      :valeur_perennite_existence_reserve,
      :valeur_perennite_reserve_impartageable,
      :valeur_perennite_attention_questions_innovation
    ])
  end

  def valeur_partage_booleens
    boolean_group(@latest_states, [
      :valeur_partage_existence_accord,
      :valeur_partage_existence_epargne_salariale,
      :valeur_partage_existence_grille_salariale,
      :valeur_partage_publicite_grille
    ])
  end

  # PILLAR 3

  def qualite_qvt_enquete_qvt
    single_boolean(@latest_states, :qualite_qvt_enquete_qvt)
  end

  def qualite_qvt_taux_all
  {
    indicateur_clean(:qualite_qvt_taux_qvt) => @latest_states.median(:qualite_qvt_taux_qvt),
    indicateur_clean(:qualite_qvt_part_cdi) => @latest_states.median(:qualite_qvt_part_cdi),
    indicateur_clean(:qualite_qvt_taux_turnover) => @latest_states.median(:qualite_qvt_taux_turnover),
    indicateur_clean(:qualite_qvt_taux_absenteisme) => @latest_states.median(:qualite_qvt_taux_absenteisme)
  }
  end

  def qualite_emancipation_taux
  {
    indicateur_clean(:qualite_emancipation_taux_budget_formation_masse_salariale) => @latest_states.median(:qualite_emancipation_taux_budget_formation_masse_salariale),
    indicateur_clean(:qualite_emancipation_taux_direction_promotion_interne) => @latest_states.median(:qualite_emancipation_taux_direction_promotion_interne)
  }
  end

  # PILLAR 4

  def impact_environnement_booleens
    boolean_group(@latest_states, [
      :impact_environnement_audit_impact,
      :impact_environnement_demarche_ecologique,
      :impact_environnement_discussion_impact
    ])
  end

  def impact_environnement_scope_booleens
    scope1 = @latest_states.where(impact_environnement_bilan_carbone_scope_1: true).count
    scope2 = @latest_states.where(impact_environnement_bilan_carbone_scope_2: true).count
    scope3 = @latest_states.where(impact_environnement_bilan_carbone_scope_3: true).count

    {
      indicateur_clean(:impact_environnement_bilan_carbone_scope_1) => (scope1.to_f / @latest_states.count * 100),
      indicateur_clean(:impact_environnement_bilan_carbone_scope_2) => (scope2.to_f / @latest_states.count * 100),
      indicateur_clean(:impact_environnement_bilan_carbone_scope_3) => (scope3.to_f / @latest_states.count * 100),
      'Total' => ((scope1 + scope2 + scope3).to_f / @latest_states.count * 100)
    }
  end

  def impact_engagement
  {
    indicateur_clean(:impact_engagement_part_resultat_missions_utiles) => @latest_states.median(:impact_engagement_part_resultat_missions_utiles),
    indicateur_clean(:impact_engagement_part_placements_responsables) => @latest_states.median(:impact_engagement_part_placements_responsables),
    indicateur_clean(:impact_engagement_part_impots_france) => @latest_states.median(:impact_engagement_part_impots_france)
  }
  end

  def impact_engagement_demarche_ethique_fournisseurs
    single_boolean(@latest_states, :impact_engagement_demarche_ethique_fournisseurs)
  end
end
