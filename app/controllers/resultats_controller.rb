class ResultatsController < ApplicationController
  def index
    @evaluation = Evaluation.find(params[:evaluation_id]) # À supprimer
    @previous_evaluation = Evaluation.where(annee: ..(@evaluation.annee-1)).order("annee DESC").first

    @state = Evaluation.find(params[:evaluation_id]).state
  end
end
