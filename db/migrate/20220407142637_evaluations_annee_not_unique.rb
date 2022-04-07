class EvaluationsAnneeNotUnique < ActiveRecord::Migration[7.0]
  def change
    remove_index :evaluations, :annee
  end
end
