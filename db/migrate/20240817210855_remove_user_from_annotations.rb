class RemoveUserFromAnnotations < ActiveRecord::Migration[7.1]
  def change
    remove_column :annotations, :user_id
  end
end
