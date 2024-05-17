class ImageUploader < CarrierWave::Uploader::Base
  attr_accessor :latitude, :longitude, :datetime
  include CarrierWave::MiniMagick
  process :convert => 'jpg'

  if Rails.env.production?
    storage :fog # 本番環境のみ
  else
    storage :file # 本番環境以外
  end

  def get_exif_info
    begin
      require 'exifr/jpeg'
      require 'exifr/heic'

      case file.extension.downcase
      when 'heic', 'heif'
        exif = EXIFR::HEIC::new(self.file.file)
      else
        exif = EXIFR::JPEG::new(self.file.file)
      end

      @latitude = exif.gps.latitude if exif&.gps
      @longitude = exif.gps.longitude if exif&.gps
      @datetime = exif.date_time if exif&.date_time
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
