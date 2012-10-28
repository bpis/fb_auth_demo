class User < ActiveRecord::Base
  attr_accessible :email, :oauth_expires_at, :oauth_token, :provider, :uid, :name, :sex, :about_me, :birthday, :hometown, :location, :relationships, :relationship_details, :publish_stream, :status_update, :photo_upload, :read_friendlists
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      
      user.sex = auth.info.gender
      user.about_me = auth.info.about_me
      user.birthday = auth.info.birthday
      user.hometown = auth.info.hometown
      user.location = auth.info.location
      user.relationships = auth.info.relationships
      user.relationship_details = auth.info.relationship_details
      user.publish_stream = auth.info.publish_stream
      user.status_update = auth.info.status_update
      user.photo_upload = auth.info.photo_upload
      user.read_friendlists = auth.info.read_friendlists
      
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
