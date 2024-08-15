class CreateEmails < ActiveRecord::Migration[7.1]
  def change
    create_table :emails do |t|
      t.string :name
      t.string :preview_link, :default => ""
      t.string :subject
      t.string :body
      t.datetime :sent_at
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
