class ResultatsController < ApplicationController
  def indicateurs_hash(evaluation, sym_list)
    hash = {}
    sym_list.each do |sym|
      if evaluation.indicateurs_list[sym].present?
        hash[helpers.indicateur_clean(sym)] = evaluation.indicateurs_list[sym]
      end
    end
    return hash
  end

  def index
    @evaluation = Evaluation.find(params[:evaluation_id])
    @previous_evaluation = Evaluation.where(annee: ..(@evaluation.annee-1)).order("annee DESC").first

    # Pilier 1

    @pouvoir_gouvernance_taux = [
      :pouvoir_gouvernance_part_salaries_associes,
      :pouvoir_gouvernance_taux_societariat_femmes,
      :pouvoir_gouvernance_taux_droits_vote_salaries,
      :pouvoir_gouvernance_part_salaries_conseil,
      :pouvoir_gouvernance_part_femmes_conseil
    ]

    @pouvoir_strategique_taux = [
      :pouvoir_strategique_taux_presence_assemblee,
      :pouvoir_strategique_implication_partage,
      :pouvoir_strategique_actifs_total
    ]

    # Pilier 2

    @valeur_perennite_taux = [
      :valeur_perennite_part_capital_salaries,
      :valeur_perennite_part_resultat_reserve,
      :valeur_perennite_ebe_caht,
      :valeur_perennite_part_endettement
    ]

  end
end
