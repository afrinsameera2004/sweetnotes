class RemoveUserFromSharedNotes < ActiveRecord::Migration[8.0]
  def change
    remove_reference :shared_notes, :user, null: false, foreign_key: true
  end
end
