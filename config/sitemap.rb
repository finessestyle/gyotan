# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.gyotan.jp"

SitemapGenerator::Sitemap.create do
    add '/', :changefreq => 'daily', :priority => 0.7
    add '/posts/index', :changefreq => 'daily', :priority => 0.7
    add '/posts/:id', :changefreq => 'daily', :priority => 0.7
    add '/maps/index', :changefreq => 'daily', :priority => 0.7
    add '/maps/:id', :changefreq => 'daily', :priority => 0.7
    add '/login', :changefreq => 'daily', :priority => 0.7
    add '/signup', :changefreq => 'daily', :priority => 0.7
    add '/term', :changefreq => 'daily', :priority => 0.7
    add '/privacy', :changefreq => 'daily', :priority => 0.7
    add '/cookie', :changefreq => 'daily', :priority => 0.7
    add '/profile', :changefreq => 'daily', :priority => 0.7
    add '/rule', :changefreq => 'daily', :priority => 0.7
    add '/contacts/new', :changefreq => 'daily', :priority => 0.7
end

SitemapGenerator::Sitemap.ping_search_engines
