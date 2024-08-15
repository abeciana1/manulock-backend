class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :plan, null: false, default: 0
      t.integer :documents_remaining, default: 0
      t.integer :invites_remaining, default: 0
      t.string :stripe_id
      t.timestamps
    end
  end
end
