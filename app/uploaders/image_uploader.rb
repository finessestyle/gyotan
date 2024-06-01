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
      require 'mini_magick'
      require 'exiftool'

      case file.extension.downcase
      when 'heic', 'heif'
        # Convert HEIC to JPEG
        image = MiniMagick::Image.open(file.path)
        jpeg_path = file.path.sub(/\.(heic|heif)$/i, '.jpg')
        image.format 'jpeg'
        image.write jpeg_path

        # Extract EXIF data from the converted JPEG
        exif = Exiftool.new(jpeg_path).to_hash
        File.delete(jpeg_path) if File.exist?(jpeg_path) # Delete the temporary JPEG file
      else
        # Extract EXIF data from the original JPEG
        exif = Exiftool.new(file.path).to_hash
      end

      # Assign extracted EXIF data to instance variables
      if exif
        @latitude = exif[:gpslatitude]
        @longitude = exif[:gpslongitude]
        @datetime = exif[:datetimeoriginal] || exif[:createdate]
      end
    rescue LoadError => e
      Rails.logger.error "Gemが見つかりません: #{e.message}"
    rescue StandardError => e
      Rails.logger.error "EXIF情報の取得中にエラーが発生しました: #{e.message}"
    end
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [700, 500]
  end

  def extension_allowlist
    %w(jpg jpeg gif png heic heif)
  end

  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

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
