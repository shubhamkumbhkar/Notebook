class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.references :note, null: false, foreign_key: true

      t.timestamps
    end
  end
end
