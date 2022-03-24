class AddUniqueKeys < ActiveRecord::Migration[7.0]
  def change
    add_index :evaluations, :annee, unique: true
    add_index :organisations, :siren, unique: true
  end
end
