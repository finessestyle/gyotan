class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  require 'exifr/jpeg'
  require 'mini_magick'

  def top
    @top_catches = Post.order(length: :desc).limit(9)
    @monthly_top_catches = {}
    # 今月の期間を取得
    month_start = Time.now.beginning_of_month
    month_end = Time.now.end_of_month
    # 今月のトップキャッチを取得
    top_catches = Post.where(created_at: month_start..month_end).order(length: :desc).limit(9)
    @monthly_top_catches[month_start.strftime("%Y年%m月ランキング")] = top_catches
  end
end
