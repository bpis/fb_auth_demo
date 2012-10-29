OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '153507064794513', 'f7df488637f466807a2d7b85b3ffb61e', {:scope => 'email,offline_access,user_birthday,read_stream,user_about_me,user_hometown,user_location,user_relationships,user_relationship_details,publish_stream,user_status,read_friendlists', :display => 'popup'}
end

