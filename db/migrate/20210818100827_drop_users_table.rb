class DropUsersTable < ActiveRecord::Migration[6.1]
  def change
    def up
      drop_table :users
    end
  
    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
