class Aggregate
  def indicateur_clean(symbol)
    I18n.t("activerecord.attributes.state." + symbol.to_s)
  end

  def boolean_group(states, indic_symbols)
    group = {}

    indic_symbols.each do |indic_symbol|
      indic = single_boolean(states, indic_symbol)
      if not indic.nil?
        group[indic_symbol] = indic
      end
    end

    return group
  end

  def single_boolean(states, indic_symbol)
    result = nil

    true_count = states.where("#{indic_symbol.to_s} = ?", true).count
    false_count = states.where("#{indic_symbol.to_s} = ?", false).count
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
    indicateur_clean(:pouvoir_gouvernance_part_salaries_associes) => State.evaluations.up_to_date.median(:pouvoir_gouvernance_part_salaries_associes),
    indicateur_clean(:pouvoir_gouvernance_taux_societariat_femmes) => State.evaluations.up_to_date.median(:pouvoir_gouvernance_taux_societariat_femmes),
    indicateur_clean(:pouvoir_gouvernance_taux_droits_vote_salaries) => State.evaluations.up_to_date.median(:pouvoir_gouvernance_taux_droits_vote_salaries),
    indicateur_clean(:pouvoir_gouvernance_part_femmes_conseil) => State.evaluations.up_to_date.median(:pouvoir_gouvernance_part_femmes_conseil)
  }
  end

  # PILLAR 2

  def valeur_part_resultat
  {
    indicateur_clean(:valeur_partage_part_resultat_net_actionnaires) => State.evaluations.up_to_date.median(:valeur_partage_part_resultat_net_actionnaires),
    indicateur_clean(:valeur_partage_part_resultat_salaries) => State.evaluations.up_to_date.median(:valeur_partage_part_resultat_salaries)
  }
  end

  def valeur_perennite_booleens
    boolean_group(State.evaluations.up_to_date, [
      :valeur_perennite_existence_reserve,
      :valeur_perennite_reserve_impartageable,
      :valeur_perennite_attention_questions_innovation
    ])
  end

  def valeur_partage_booleens
    boolean_group(State.evaluations.up_to_date, [
      :valeur_partage_existence_accord,
      :valeur_partage_existence_epargne_salariale,
      :valeur_partage_existence_grille_salariale,
      :valeur_partage_publicite_grille
    ])
  end

  # PILLAR 3

  def qualite_qvt_enquete_qvt
    single_boolean(State.evaluations.up_to_date, :qualite_qvt_enquete_qvt)
  end

  def qualite_qvt_taux_all
  {
    indicateur_clean(:qualite_qvt_taux_qvt) => State.evaluations.up_to_date.median(:qualite_qvt_taux_qvt),
    indicateur_clean(:qualite_qvt_part_cdi) => State.evaluations.up_to_date.median(:qualite_qvt_part_cdi),
    indicateur_clean(:qualite_qvt_taux_turnover) => State.evaluations.up_to_date.median(:qualite_qvt_taux_turnover),
    indicateur_clean(:qualite_qvt_taux_absenteisme) => State.evaluations.up_to_date.median(:qualite_qvt_taux_absenteisme)
  }
  end

  def qualite_emancipation_taux
  {
    indicateur_clean(:qualite_emancipation_taux_budget_formation_masse_salariale) => State.evaluations.up_to_date.median(:qualite_emancipation_taux_budget_formation_masse_salariale),
    indicateur_clean(:qualite_emancipation_taux_direction_promotion_interne) => State.evaluations.up_to_date.median(:qualite_emancipation_taux_direction_promotion_interne)
  }
  end

  # PILLAR 4

  def impact_environnement_booleens
    boolean_group(State.evaluations.up_to_date, [
      :impact_environnement_audit_impact,
      :impact_environnement_demarche_ecologique,
      :impact_environnement_discussion_impact
    ])
  end

  def impact_environnement_scope_booleens
    scope1 = State.evaluations.up_to_date.where(impact_environnement_bilan_carbone_scope_1: true).count
    scope2 = State.evaluations.up_to_date.where(impact_environnement_bilan_carbone_scope_2: true).count
    scope3 = State.evaluations.up_to_date.where(impact_environnement_bilan_carbone_scope_3: true).count

    {
      indicateur_clean(:impact_environnement_bilan_carbone_scope_1) => (scope1.to_f / State.evaluations.up_to_date.count * 100),
      indicateur_clean(:impact_environnement_bilan_carbone_scope_2) => (scope2.to_f / State.evaluations.up_to_date.count * 100),
      indicateur_clean(:impact_environnement_bilan_carbone_scope_3) => (scope3.to_f / State.evaluations.up_to_date.count * 100),
      'Total' => ((scope1 + scope2 + scope3).to_f / State.evaluations.up_to_date.count * 100)
    }
  end

  def impact_engagement
  {
    indicateur_clean(:impact_engagement_part_resultat_missions_utiles) => State.evaluations.up_to_date.median(:impact_engagement_part_resultat_missions_utiles),
    indicateur_clean(:impact_engagement_part_placements_responsables) => State.evaluations.up_to_date.median(:impact_engagement_part_placements_responsables),
    indicateur_clean(:impact_engagement_part_impots_france) => State.evaluations.up_to_date.median(:impact_engagement_part_impots_france)
  }
  end

  def impact_engagement_demarche_ethique_fournisseurs
    single_boolean(State.evaluations.up_to_date, :impact_engagement_demarche_ethique_fournisseurs)
  end
end
