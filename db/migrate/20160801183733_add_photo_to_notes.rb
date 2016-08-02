class AddPhotoToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :photo_id, :string
  end
end
