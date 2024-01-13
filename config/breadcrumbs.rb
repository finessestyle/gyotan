crumb :top do
  link "トップページ", "/"
end

crumb :about do 
  link "Gyotanについて", about_path
  parent :top
end

crumb :term do
  link "利用規約", term_path
  parent :top
end

crumb :privacy do
  link "プライバシーポリシー", privacy_path
  parent :top
end

crumb :cookie do
  link "クッキーポリシー", cookie_path
  parent :top
end

crumb :rule do
  link "琵琶湖のルール", rule_path
  parent :top
end

crumb :profile do
  link "運営者情報", profile_path
  parent :top
end


crumb :contacts do
  link "お問い合わせ", contacts_new_path
  parent :top
end

crumb :singup do
  link "新規登録", signup_path
  parent :top
end

crumb :login do
  link "ログイン", login_path
  parent :top
end

crumb :posts do
  link "釣果一覧", posts_index_path
  parent :top
end

crumb :posts_show do
  link "釣果詳細", "/posts/:id"
  parent :posts
end

crumb :posts_create do
  link "釣果投稿", posts_create_path
  parent :posts
end

crumb :posts_edit do
  link "釣果編集", "/posts//:id/edit"
  parent :posts
end

crumb :users do
  link "ユーザー覧", users_index_path
  parent :top
end

crumb :users_show do
  link "ユーザー詳細", "/users/:id"
  parent :users
end

crumb :users_create do
  link "ユーザー投稿", users_create_path
  parent :users
end

crumb :users_edit do
  link "ユーザー編集", "/users/:id/edit"
  parent :users
end

crumb :followers do
  link "フォロワー一覧", user_followers_path
  parent :users
end

crumb :followings do
  link "フォロー一覧", user_followings_path
  parent :users
end

crumb :blogs do
  link "ブログ一覧", blogs_index_path
  parent :top
end

crumb :blogs_show do
  link "ブログ詳細", "/blogs/:id"
  parent :blogs
end

crumb :blogs_create do
  link "ブログ投稿", blogs_create_path
  parent :blogs
end

crumb :blogs_edit do
  link "ブログ編集", "/blogs/:id/edit"
  parent :blogs
end

crumb :maps do
  link "釣り場一覧", maps_index_path
  parent :top
end

crumb :maps_show do
  link "釣り場詳細", "/maps/:id"
  parent :maps
end

crumb :maps_create do
  link "釣果投稿", maps_create_path
  parent :maps
end

crumb :maps_edit do
  link "釣果編集", "/maps/:id/edit"
  parent :maps
end

