module ApplicationHelper
  def default_meta_tags
    {
      site: 'Gyotan',
      title: 'Gyotan-琵琶湖バス釣り釣果共有サイト-',
      reverse: true,
      charset: 'utf-8',
      separator: '|',
      description: '琵琶湖バス釣り釣果共有サイト!!あなたの釣果情報がみんなの魚探に、みんなの釣果情報があなたの魚探に変わる！？',
      keywords: '琵琶湖,バス釣り,釣果情報,滋賀県',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
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
        site: '@',
        image: ('top.jpg')
      }
    }
  end
end
