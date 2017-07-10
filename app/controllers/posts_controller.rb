class PostsController < ApplicationController
  before_action :load_post, only: :show
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource except: [:index, :show]

  def index
    @posts = Post.search(params[:search]).page(params[:page])
      .per Settings.post.page_post
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build post_params

    if @post.save
      flash[:success] = t ".create_post"
      redirect_to @post
    else
      flash.now[:danger] = t ".failed_create"
      render :new
    end
  end

  def edit; end

  def update
    if @post.update_attributes post_params
      flash[:success] = t ".update_success"
      redirect_to @post
    else
      flash.now[:danger] = t ".update_failed"
      render :edit
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

  private

  def post_params
    params.require(:post).permit :title, :content, :picture, :picture_cache, :list_tags
  end

  def load_post
    @post = Post.find_by id: params[:id]
    load_info @post
  end
end
