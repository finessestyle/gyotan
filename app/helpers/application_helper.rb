module ApplicationHelper
  def default_meta_tags
    {
      site: 'Gyotan',
      title: 'Gyotan-琵琶湖バス釣り情報サイト-',
      reverse: true,
      charset: 'utf-8',
      separator: '|',
      description: '琵琶湖バス釣り情報サイト!!・琵琶湖バス釣り釣果情報・琵琶湖バス釣り場情報・バス釣り初心者向けブログ',
      keywords: '琵琶湖,バス釣り,滋賀県,初心者,biwako,bassfishing,ブラックバス,釣り,gyotan,フィネス,バスフィッシング,',
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
        image: ('3.jpg'),
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
