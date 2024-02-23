class ImageUploader < CarrierWave::Uploader::Base
  attr_accessor :latitude, :longitude, :datetime
  include CarrierWave::MiniMagick
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
    %w(jpg jpeg gif png heic heif)
  end

  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  # def filename 
  #   if original_filename.present?
  #     time = Time.now
  #     name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
  #     name.downcase
  #   end
  # end

  def mimetype
    IO.popen(["file", "--brief", "--mime-type", path], in: :close, err: :close) { |io| io.read.chomp.sub(/image\//, "") }
  end

  def custom_optimize
    case mimetype
      when "png" then pngquant
      when "jpeg", "gif" then optimize(quality: 90)
    end
  end
end
