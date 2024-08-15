class CreateBetaReaderInvites < ActiveRecord::Migration[7.1]
  def change
    create_table :beta_reader_invites do |t|
      t.references :inviter, foreign_key: { to_table: :users }
      t.references :invitee, foreign_key: { to_table: :users }, null: true
      t.string :email, null: false
      t.integer :status, default: 0
      t.references :document, foreign_key: true
      t.timestamps
    end
  end
end
