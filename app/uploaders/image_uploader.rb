class ImageUploader < CarrierWave::Uploader::Base
  attr_accessor :latitude, :longitude, :datetime
  include CarrierWave::MiniMagick
  process :convert_to_jpg
  process :get_exif_info

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def convert_to_jpg
    manipulate! do |img|
      img.format('jpg') do |c|
        c.background 'white'
        c.alpha 'remove'
      end
      img
    end
  end

  def get_exif_info
    begin
      require 'exifr'
      exif = EXIFR::JPEG.new(current_path)
      @latitude = exif&.gps&.latitude
      @longitude = exif&.gps&.longitude
      @datetime = exif&.date_time
    rescue => e
      Rails.logger.error "EXIF data extraction failed: #{e.message}"
    end
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

  version :webp do
    process convert_to_webp: [{ quality: 90 }]
  end

  def convert_to_webp(options = {})
    manipulate! do |img|
      img.format('webp') do |c|
        c.quality(options[:quality] || 85)
        c.alpha 'remove'
      end
      img
    end
  end

  def extension_allowlist
    %w[jpg jpeg gif png heic heif]
  end

  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  def mimetype
    IO.popen(['file', '--brief', '--mime-type', path], in: :close, err: :close) { |io| io.read.chomp.sub(/image\//, '') }
  end

  def custom_optimize
    case mimetype
    when 'png' then pngquant
    when 'jpeg', 'gif' then optimize(quality: 90)
    end
  end
end