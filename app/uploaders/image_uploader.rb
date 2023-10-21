class ImageUploader < CarrierWave::Uploader::Base
  attr_accessor :latitude, :longitude, :datetime
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  process resize_to_fit: [1000, 1000]
  process :convert => 'jpg'
  
  if Rails.env.production?
    storage :fog # 本番環境のみ
  else
    storage :file # 本番環境以外
  end

  process :get_exif_info
  def get_exif_info
    begin
    require 'exifr/jpeg'
      exif = EXIFR::JPEG::new(self.file.file)
      @latitude = exif.gps.latitude
      @longitude = exif.gps.longitude
      @datetime = exif.datetime
    rescue
    end
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:

  def extension_allowlist
    %w(jpg jpeg gif png heic heif HEIC HEIF)
  end

  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  
  # def filename
  #   "something.jpg" if original_filename
  # end
end
