class CreateAnnotations < ActiveRecord::Migration[7.1]
  def change
    create_table :annotations do |t|
      t.references :document, foreign_key: true, null: false
      t.integer :page_number, null: false
      t.text :selected_text, :default => ""
      t.string :coordinates
      t.timestamps
    end
  end
end
