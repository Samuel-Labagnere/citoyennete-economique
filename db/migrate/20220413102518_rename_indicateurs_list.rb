class RenameIndicateursList < ActiveRecord::Migration[7.0]
  def change
    rename_table :states, :states
  end
end
