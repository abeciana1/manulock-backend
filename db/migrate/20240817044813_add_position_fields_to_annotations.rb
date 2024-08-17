class AddPositionFieldsToAnnotations < ActiveRecord::Migration[7.1]
  def change
    change_table :annotations do |t|
      t.float :bounding_x1
      t.float :bounding_y1
      t.float :bounding_x2
      t.float :bounding_y2
      t.float :bounding_width
      t.float :bounding_height
      t.jsonb :rects, default: []
    end  
  end
end
