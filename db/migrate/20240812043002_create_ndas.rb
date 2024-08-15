class CreateNdas < ActiveRecord::Migration[7.1]
  def change
    create_table :ndas do |t|
      t.references :user, foreign_key: true
      t.references :document, foreign_key: true
      t.datetime :signed_at
      t.integer :signed, default: 0
      t.string :pdf_url
      t.timestamps
    end
  end
end
