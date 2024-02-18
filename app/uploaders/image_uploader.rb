class ImageUploader < CarrierWave::Uploader::Base
  attr_accessor :latitude, :longitude, :datetime
  include CarrierWave::MiniMagick
  
  if Rails.env.production?
    storage :fog 
  else
    storage :file
  end

  process :get_exif_info

  def get_exif_info
    begin
      require 'exifr/jpeg'
      exif = EXIFR::JPEG.new(self.file.file)
      @latitude = exif&.gps&.latitude
      @longitude = exif&.gps&.longitude
      @datetime = exif&.datetime
    rescue => e
      Rails.logger.error("Failed to extract EXIF data: #{e.message}")
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [800, 600]
  end

  version :medium_thumb, from_version: :thumb do
    process resize_to_fit: [500, 500]
  end

  version :small_thumb, from_version: :medium_thumb do
    process resize_to_fit: [300, 300]
  end

  def extension_allowlist
    %w(jpg jpeg gif png heic webp)
  end

  def mimetype
    # Use MiniMagick to get MIME type
    image = MiniMagick::Image.open(file.path)
    image.mime_type.split('/').last
  end

  def custom_optimize
    case mimetype
    when "png"
      manipulate! do |img|
        img.format 'png'
        img = yield(img) if block_given?
        img.strip
        img.alpha 'Remove'
        img.quality '90'
        img
      end
    when "jpeg", "gif"
      manipulate! do |img|
        img = yield(img) if block_given?
        img.strip
        img.quality '90'
        img
      end
    end
  end

  process :convert_to_webp

  def convert_to_webp
    manipulate! do |img|
      img.format 'webp'
      img
    end
  end

end
