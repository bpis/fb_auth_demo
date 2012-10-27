OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '153507064794513', 'f7df488637f466807a2d7b85b3ffb61e', :scope => 'name,email,user_birthday,read_stream', :display => 'popup'
end