class AddNameToUsers < ActiveRecord::Migration[5.1]
  def down
    remove_column :users, :fieldname
  end
  def up
    add_column :users, :name, :string
  end
end