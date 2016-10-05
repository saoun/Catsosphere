class RemoveReference < ActiveRecord::Migration[5.0]
  def change
    remove_reference :posts, :users, foreign_key: true
  end
end
