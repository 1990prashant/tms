class AddFieldsInUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, default: "" unless column_exists? :users, :first_name
    add_column :users, :last_name, :string, default: "" unless column_exists? :users, :last_name
  end
end
