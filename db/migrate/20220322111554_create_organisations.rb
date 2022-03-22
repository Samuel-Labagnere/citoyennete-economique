class CreateOrganisations < ActiveRecord::Migration[7.0]
  def change
    create_table :organisations do |t|
      t.string :nom
      t.integer :statut_juridique
      t.integer :date_crea
      t.string :secteur_activite
      t.string :ape
      t.string :siren
      t.integer :nombre_salaries
      t.float :nombre_salaries_etp
      t.float :chiffre_affaires
      t.string :agrement_specifique
      t.boolean :objectifs_extra_fianciers
      t.text :distinctions, null: true
      t.string :valeurs_entreprise
      t.boolean :validation_admin, default: false

      t.timestamps
    end
  end
end
