class AddUserRefToReplies < ActiveRecord::Migration[6.1]
  def change
    add_reference :replies, :user, null: true, foreign_key: true
  end
end
