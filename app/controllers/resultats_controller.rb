class ResultatsController < ApplicationController
  def indicateurs_hash(evaluation, sym_list)
    hash = {}
    sym_list.each do |sym|
      if evaluation.state[sym].present?
        hash[helpers.state(sym)] = evaluation.state[sym]
      end
    end
    return hash
  end

  def index
    @evaluation = Evaluation.find(params[:evaluation_id])
    @previous_evaluation = Evaluation.where(annee: ..(@evaluation.annee-1)).order("annee DESC").first
  end
end
