module ApplicationHelper
  def default_meta_tags
    {
      site: 'Gyotan',
      title: 'Gyotan-琵琶湖バス釣り釣果共有サイト-',
      reverse: true,
      charset: 'utf-8',
      separator: '|',
      description: '琵琶湖バス釣り釣果共有サイト!!あなたの釣果情報がみんなの魚探に、みんなの釣果情報があなたの魚探に変わる！？',
      keywords: '琵琶湖,バス釣り,滋賀県',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [                    #favicon、apple用アイコンを指定する
        { href: image_url('favicon.ico') },
        { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description, 
        type: 'website',
        url: request.original_url,
        image: ('top.jpg'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@finessestyle1',
        image: ('top.jpg')
      }
    }
  end
end
