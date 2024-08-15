class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :annotation, foreign_key: true, null: false
      t.text :content
      t.timestamps
    end
  end
end
