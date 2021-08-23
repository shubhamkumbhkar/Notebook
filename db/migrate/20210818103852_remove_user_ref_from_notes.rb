class RemoveUserRefFromNotes < ActiveRecord::Migration[6.1]
  def change
    remove_column :notes, :user_id, :integer
  end
end
