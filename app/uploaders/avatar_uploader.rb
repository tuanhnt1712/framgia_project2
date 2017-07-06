class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    url = "fallback/" << [version_name, Settings.avatar_default].compact.join("_")
    ActionController::Base.helpers.asset_path url
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
