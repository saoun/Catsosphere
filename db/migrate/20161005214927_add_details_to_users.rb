class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image, :string
    add_column :users, :fullname, :string
    add_column :users, :contact, :string
    add_column :users, :bio, :string
  end
end
