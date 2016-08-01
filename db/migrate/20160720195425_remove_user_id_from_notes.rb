class RemoveUserIdFromNotes < ActiveRecord::Migration[5.0]
  def change
    remove_column :notes, :user_id
  end
end
