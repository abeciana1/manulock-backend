class RemoveUnusedColumns < ActiveRecord::Migration[7.1]
  def change
    remove_column :annotations, :coordinates
  end
end
