module ApplicationHelper
  def default_meta_tags
    {
      site: 'Gyotan',
      title: content_for?(:title) ? content_for(:title) : "琵琶湖バス釣り釣果情報",
      reverse: true,
      charset: 'utf-8',
      separator: '|',
      description: content_for?(:description) ? content_for(:description) : '琵琶湖バス釣り釣果情報 Gyotan 。釣果情報を投稿・共有できます。',
      keywords: content_for?(:keywords) ? content_for(:keywords) : '琵琶湖,バス釣り,初心者,陸っぱり釣り場,釣果情報,北湖,南湖',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('icon.jpeg') },
        { href: image_url('icon.jpeg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'Gyotan',
        title: content_for?(:title) ? content_for(:title) : "琵琶湖バス釣り釣果情報",
        description: content_for?(:description) ? content_for(:description) : '琵琶湖バス釣り釣果情報 Gyotan 。釣果情報を投稿・共有できます。',
        type: 'website',
        url: request.original_url,
        image: ('5.jpeg'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@finessestyle1',
        image: ('5.jpeg')
      }
    }
  end

  def structured_data
    {
      "@context": "https://schema.org",
      "@type": "WebSite",
      "name": "Gyotan",
      "url": request.original_url,
      "potentialAction": {
        "@type": "SearchAction",
        "target": "#{url_for('/')}?q={search_term_string}",
        "query-input": "required name=search_term_string"
      }
    }.to_json.html_safe
  end
end
