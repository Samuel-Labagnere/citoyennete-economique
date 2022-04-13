class SetUpToDate < ActiveRecord::Migration[7.0]
  def change
    latest_years = []
    Organisation.all.each do |organisation|
      latest_years.push organisation.evaluations.active.pluck(:annee).max
    end
    latest_evaluations = Evaluation.active.where(annee: latest_years)
    latest_states = State.where(evaluation_id: latest_evaluations)
    latest_states.update(up_to_date: true)
  end
end
