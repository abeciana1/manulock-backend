class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :hosted_url
      t.references :owner, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
