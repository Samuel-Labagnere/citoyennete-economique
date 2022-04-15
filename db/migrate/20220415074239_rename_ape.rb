class RenameApe < ActiveRecord::Migration[7.0]
  def change
    rename_column :organisations, :ape, :naf
  end
end
