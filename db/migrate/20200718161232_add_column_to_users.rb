class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address, :string
    add_column :users, :postal_code, :integer
    add_column :users, :bio, :text
  end
end
