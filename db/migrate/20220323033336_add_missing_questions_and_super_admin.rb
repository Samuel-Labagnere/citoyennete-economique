class AddMissingQuestionsAndSuperAdmin < ActiveRecord::Migration[7.0]
  def change
    add_column :evaluations, :pouvoir_strategique_implication_partage, :float, null: true
    add_column :evaluations, :pouvoir_gouvernance_taux_droits_vote_salaries, :float, null: true
    add_column :users, :is_super_admin, :boolean, default: false
  end
end
