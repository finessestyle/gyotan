require_relative '../gyotan/config/environment'
require 'mini_magick'

User.all.each do |user|
  if user.image.present?
    image_path = user.image.path
    webp_path = image_path.sub(/(\.\w+)$/, '.webp')

    image = MiniMagick::Image.open(image_path)
    image.format 'webp'
    image.write webp_path

    # Update the user's image attribute to point to the new webp file
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

    # Update the image's attribute to point to the new webp file
    image.update(file: File.open(webp_path))
  end
end

# 修正点1：MapとBlogの各モデルで画像を更新するループを修正
Map.all.each do |map|
  if map.image.present?
    image_path = map.image.path
    webp_path = image_path.sub(/(\.\w+)$/, '.webp')

    img = MiniMagick::Image.open(image_path)
    img.format 'webp'
    img.write webp_path

    # Update the map's image attribute to point to the new webp file
    map.update(image: File.open(webp_path))
  end
end

Blog.all.each do |blog|
  if blog.image.present?
    image_path = blog.image.path
    webp_path = image_path.sub(/(\.\w+)$/, '.webp')

    img = MiniMagick::Image.open(image_path)
    img.format 'webp'
    img.write webp_path

    # Update the blog's image attribute to point to the new webp file
    blog.update(image: File.open(webp_path))
  end
end
