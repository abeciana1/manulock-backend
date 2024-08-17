class AddUserAssociationToAnnotations < ActiveRecord::Migration[7.1]
  def change
    add_reference :annotations, :user, index: true
  end
end
