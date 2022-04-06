class ResultatsController < ApplicationController
  def index
    @evaluation = Evaluation.find(params[:evaluation_id])
    @previous_evaluation = Evaluation.find_by(annee: @evaluation.annee - 1)
  end
end
