class EvaluationStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :evaluations, :status, :string, default: 'active'
    change_column_default :evaluations, :status, 'blank'
  end
end
