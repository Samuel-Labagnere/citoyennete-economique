class ResultatsController < ApplicationController
  def indicateurs_hash(evaluation, sym_list)
    hash = {}
    sym_list.each do |sym|
      if evaluation.indicateurs_list[sym].present?
        hash[indicateur_clean(sym)] = evaluation.indicateurs_list[sym]
      end
    end
    return hash
  end

  def index
    @evaluation = Evaluation.find(params[:evaluation_id])
    @previous_evaluation = Evaluation.where(annee: ..(@evaluation.annee-1)).order("annee DESC").first

    @pouvoir_gouvernance_taux = indicateurs_hash(@evaluation, [
      :pouvoir_gouvernance_part_salaries_associes,
      :pouvoir_gouvernance_taux_societariat_femmes,
      :pouvoir_gouvernance_taux_droits_vote_salaries,
      :pouvoir_gouvernance_part_salaries_conseil,
      :pouvoir_gouvernance_part_femmes_conseil
    ])

    @pouvoir_democratie_nombres = indicateurs_hash(@evaluation, [
      :pouvoir_democratie_nombre_reunions,
      :pouvoir_democratie_nombre_accords_signes,
    ])
  end
end
