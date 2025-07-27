class AddUserIdToSharedNotes < ActiveRecord::Migration[8.0]
  def change
    add_reference :shared_notes, :user, foreign_key: true
  end
end
