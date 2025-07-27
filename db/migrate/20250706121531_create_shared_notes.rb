class CreateSharedNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :shared_notes do |t|
      t.references :note, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :shared_with_email
      t.boolean :can_edit

      t.timestamps
    end
  end
end
