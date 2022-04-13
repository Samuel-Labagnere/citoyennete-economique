class AddUpToDateToStates < ActiveRecord::Migration[7.0]
  def change
    add_column :states, :up_to_date, :boolean, default: false
  end
end
