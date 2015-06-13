CarrierWave.configure do |config|
  config.root=Rails.root
  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false
  config.permissions = 0660
end
