OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '352406998517820', '4568f9132fe6feca887425a21d0ad03b', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end