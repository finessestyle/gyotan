# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.gyotan.jp"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
    add articles_path, :priority => 0.7, :changefreq => 'daily'
    add '/', :changefreq => 'daily', :priority => 0.7
    add '/posts/index', :changefreq => 'daily', :priority => 0.7
    add '/posts/new', :changefreq => 'daily', :priority => 0.7
    add '/posts/:id', :changefreq => 'daily', :priority => 0.7
    add '/posts/:id/edit', :changefreq => 'daily', :priority => 0.7
    add '/posts/:id/update', :changefreq => 'daily', :priority => 0.7
    add '/blogs', :changefreq => 'daily', :priority => 0.7
    add '/blogs/new', :changefreq => 'daily', :priority => 0.7
    add '/blogs/:id', :changefreq => 'daily', :priority => 0.7
    add '/blogs/:id/edit', :changefreq => 'daily', :priority => 0.7
    add '/blogs/:id/update', :changefreq => 'daily', :priority => 0.7
    add '/users/index', :changefreq => 'daily', :priority => 0.7
    add '/login', :changefreq => 'daily', :priority => 0.7
    add '/users/:id/update', :changefreq => 'daily', :priority => 0.7
    add '/users/:id/edit', :changefreq => 'daily', :priority => 0.7
    add '/signup', :changefreq => 'daily', :priority => 0.7
    add '/users/:id', :changefreq => 'daily', :priority => 0.7
    add '/seasonal', :changefreq => 'daily', :priority => 0.7
    add '/posts/', :changefreq => 'daily', :priority => 0.7
    
  #
  # Add all articles:
  #
    Article.find_each do |article|
      add article_path(article), :lastmod => article.updated_at
    end
    SitemapGenerator::Sitemap.ping_search_engines
end
