class User < ApplicationRecord

  has_many :posts, dependent: :destroy

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['nickname']
      user.image = auth['info']['image']
      user.fullname = ""
      user.contact = ""
      user.bio = ""
    end
  end
end
