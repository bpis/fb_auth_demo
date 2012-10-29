class User < ActiveRecord::Base
  attr_accessible :email, :oauth_expires_at, :oauth_token, :provider, :uid, :name, :sex, :about_me, :birthday, :hometown, :location, :relationships, :relationship_details, :publish_stream, :status_update, :photo_upload, :read_friendlists
  def self.from_omniauth(auth)
  
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      
      user.sex = auth.extra.raw_info.gender
      user.about_me = auth.info.about_me
      user.birthday = auth.extra.raw_info.birthday
      user.hometown = auth.extra.raw_info.hometown.name
      user.location = auth.extra.raw_info.location.name
      user.relationships = auth.extra.raw_info.relationships
      user.relationship_details = auth.extra.raw_info.relationship_status
      user.publish_stream = auth.extra.raw_info.publish_stream
      user.status_update = auth.extra.raw_info.status_update
      user.image = auth.info.image
      user.read_friendlists = auth.extra.raw_info.read_friendlists
      
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
