class AddNoteImageToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :note_image_id, :string
  end
end
