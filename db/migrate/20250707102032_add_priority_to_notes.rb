class AddPriorityToNotes < ActiveRecord::Migration[8.0]
  def change
    add_column :notes, :priority, :string
  end
end
