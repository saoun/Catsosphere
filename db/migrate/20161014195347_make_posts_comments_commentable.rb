class MakePostsCommentsCommentable < ActiveRecord::Migration[5.0]
  def change
    remove_reference :comments, :post, foreign_key: true
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
  end
end
