class RenameColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :organisations, :objectifs_extra_fianciers, :objectifs_extra_financiers
    rename_column :organisations, :date_crea, :date_creation
  end
end
