class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  require 'exifr/jpeg'
  require 'mini_magick'

  def top
    @monthly_top_catches = {}
    # Catchの最初のデータから現在までの期間を取得
    start_date = Post.minimum(:created_at).beginning_of_month
    end_date = Time.now.end_of_month
    current_date = start_date
    while current_date <= end_date
      month_start = current_date.beginning_of_month
      month_end = current_date.end_of_month
      top_catches = Post.where(created_at: month_start..month_end).order(length: :desc).limit(9)
      @monthly_top_catches[month_start.strftime("%Y年%m月ランキング")] = top_catches
      current_date = current_date.next_month
    end
  end
end
