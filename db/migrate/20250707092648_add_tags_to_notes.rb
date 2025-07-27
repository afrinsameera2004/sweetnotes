class AddTagsToNotes < ActiveRecord::Migration[8.0]
  def change
    add_column :notes, :tags, :string
  end
end
