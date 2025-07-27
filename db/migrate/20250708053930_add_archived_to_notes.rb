
# db/migrate/xxxxxx_add_archived_to_notes.rb
class AddArchivedToNotes < ActiveRecord::Migration[8.0]
  def change
    add_column :notes, :archived, :boolean, default: false
  end
end
