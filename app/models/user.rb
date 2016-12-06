class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(uid: auth['uid']).first_or_create do |user|
      user.uid      = auth['uid']
      user.username = auth['info']['nickname']
      user.name     = auth['info']['name']
      user.token    = auth['credentials']['token']
      user.location = auth['extra']['raw_info']['location']
      user.joined   = auth['extra']['raw_info']['created_at']
      user.save
    end
  end
end
