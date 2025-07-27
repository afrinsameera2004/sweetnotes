class AddImportantToNotes < ActiveRecord::Migration[8.0]
  def change
    add_column :notes, :important, :boolean
  end
end
