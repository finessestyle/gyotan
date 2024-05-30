# convert_existing_images_to_webp.rb
require 'mini_magick'

User.all.each do |user|
  if user.image.present?
    image_path = user.image.path
    webp_path = image_path.sub(/(\.\w+)$/, '.webp')

    image = MiniMagick::Image.open(image_path)
    image.format 'webp'
    image.write webp_path

    # Update the user's image to point to the new webp file
    user.update(image: File.open(webp_path))
  end
end

Post.all.each do |post|
  post.images.each do |image|
    image_path = image.path
    webp_path = image_path.sub(/(\.\w+)$/, '.webp')

    img = MiniMagick::Image.open(image_path)
    img.format 'webp'
    img.write webp_path

    # Update the post's image to point to the new webp file
    image.update(file: File.open(webp_path))
  end
end

Map.all.each do |map|
  post.images.each do |image|
    image_path = image.path
    webp_path = image_path.sub(/(\.\w+)$/, '.webp')

    img = MiniMagick::Image.open(image_path)
    img.format 'webp'
    img.write webp_path

    # Update the post's image to point to the new webp file
    image.update(file: File.open(webp_path))
  end
end

Blog.all.each do |blog|
  post.images.each do |image|
    image_path = image.path
    webp_path = image_path.sub(/(\.\w+)$/, '.webp')

    img = MiniMagick::Image.open(image_path)
    img.format 'webp'
    img.write webp_path

    # Update the post's image to point to the new webp file
    image.update(file: File.open(webp_path))
  end
end
