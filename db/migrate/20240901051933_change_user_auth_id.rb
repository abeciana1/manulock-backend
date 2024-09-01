class ChangeUserAuthId < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :auth_id, :string
  end
end
