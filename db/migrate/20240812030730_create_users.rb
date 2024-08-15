class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :auth_id
      t.integer :role, default: 0
      t.references :invited_by, foreign_key: { to_table: :users }, optional: true
      t.timestamps
    end
  end
end
