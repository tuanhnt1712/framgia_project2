class Admin::PostsController < ApplicationController
  load_and_authorize_resource
  layout "admin"

  def index
    @posts = Post.search(params[:search]).page(params[:page])
      .per Settings.post.page_post
    respond_to do |format|
      format.html
      format.csv {send_data @posts.to_csv}
      format.xls {send_data @posts.to_csv(col_sep: "\t")}
    end
  end

  def destroy
    if @post.destroy
      respond_to do |format|
        format.html do
          flash[:success] = t ".delete_success"
          redirect_to root_url
        end
        format.js
      end
    else
      flash[:danger] = t ".failed_delete"
      redirect_to root_url
    end
  end
end
