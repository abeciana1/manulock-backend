class AddAnnotationType < ActiveRecord::Migration[7.1]
  def change
    add_column :annotations, :annotation_type, :integer
  end
end
