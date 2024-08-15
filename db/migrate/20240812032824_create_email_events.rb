class CreateEmailEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :email_events do |t|
      t.integer :event_type
      t.integer :device_type
      t.integer :email_client
      t.string :geolocation
      t.jsonb :additional_data
      t.references :email, foreign_key: true
      t.timestamps
    end
  end
end
