class RemoveColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
    add_reference :posts, :user, foreign_key: true
    add_reference :comments, :user, foreign_key: true
  end
end
