class CreateInvitationCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :invitation_codes do |t|
      t.string :code
      t.belongs_to :organisation, null: false, foreign_key: true
      t.datetime :expires_at

      t.timestamps
    end
  end
end
