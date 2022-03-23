class MoveSomeOrganisationFieldsToEvaluation < ActiveRecord::Migration[7.0]
  def change
    remove_column :organisations, :chiffre_affaires
    add_column :evaluations, :chiffre_affaires, :float
    add_column :evaluations, :resultat_net, :float
    remove_column :organisations, :nombre_salaries
    remove_column :organisations, :nombre_salaries_etp
    add_column :evaluations, :nombre_salaries, :integer
    add_column :evaluations, :nombre_salaries_etp, :integer
  end
end
