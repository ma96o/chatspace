require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'


CarrierWave.configure do |config|
  case Rails.env
  when 'production', 'development'
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
      region: 'us-east-1'
    }
    config.fog_directory = 'chat-space-images-k'
    config.asset_host = 'https://s3.amazonaws.com/chat-space-images-k'
  when 'test'
    config.storage = :file
  end
end
