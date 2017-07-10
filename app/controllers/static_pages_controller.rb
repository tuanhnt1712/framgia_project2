class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      if current_user.admin?
        redirect_to admin_root_url
      else
        @feed_items = current_user.feed.select(:id, :title, :content, :user_id, :updated_at, :picture)
          .sort_by_updated.page(params[:page]).per Settings.post.page_post
        respond_to do |format|
          format.html
          format.js
        end
      end
    end
  end
end
