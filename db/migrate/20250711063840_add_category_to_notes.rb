class AddCategoryToNotes < ActiveRecord::Migration[8.0]
  def change
    add_column :notes, :category, :string
  end
end
