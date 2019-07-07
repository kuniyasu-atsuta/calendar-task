class ChangeDescriptionToLessons < ActiveRecord::Migration[5.2]
  def change
    rename_column :lessons, :description, :description1
    add_column :lessons, :description2, :text
  end
end
