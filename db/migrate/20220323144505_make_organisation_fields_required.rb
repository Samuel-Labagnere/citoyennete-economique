class MakeOrganisationFieldsRequired < ActiveRecord::Migration[7.0]
  def change
    change_column_null :organisations, :nom, false
    change_column_null :organisations, :statut_juridique, false
    change_column_null :organisations, :date_creation, false
    change_column_null :organisations, :secteur_activite, false
    change_column_null :organisations, :ape, false
    change_column_null :organisations, :siren, false
    change_column_null :organisations, :agrement_specifique, true
    change_column_null :organisations, :valeurs_entreprise, true
    change_column_null :organisations, :objectifs_extra_financiers, true
    change_column_null :organisations, :distinctions, true
  end
end
