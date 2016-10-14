class AddImageToPosts < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :posts, :image_upload
  end

  def self.down
    remove_attachment :posts, :image_upload
  end
end
