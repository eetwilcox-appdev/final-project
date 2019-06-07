class RemoveFieldnameFromUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    remove_column :users, :fieldname
  end
end
