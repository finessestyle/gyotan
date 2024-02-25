module ApplicationHelper
  def default_meta_tags
    {
      site: 'Gyotan',
      title: '琵琶湖バス釣り釣果情報',
      reverse: true,
      charset: 'utf-8',
      separator: '|',
      description: '琵琶湖バス釣り釣果情報 Gyotan 。釣果情報を投稿・共有や陸っぱり釣り場情報、バス釣りブログで初心者向けに釣り方も紹介しています。',
      keywords: '琵琶湖,バス釣り,初心者,陸っぱり釣り場,釣果情報,北湖,南湖,バス釣りブログ',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [                    #favicon、apple用アイコンを指定する
        { href: image_url('icon.jpeg') },
        { href: image_url('icon.jpeg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description, 
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
end
