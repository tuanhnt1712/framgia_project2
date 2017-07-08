class StaticPagesController < ApplicationController
  def home
    @feed_items = current_user.feed.select(:id, :title, :content, :user_id, :updated_at, :picture)
      .sort_by_updated.page(params[:page]).per Settings.post.page_post
    respond_to do |format|
      format.html
      format.js
    end
  end
end
