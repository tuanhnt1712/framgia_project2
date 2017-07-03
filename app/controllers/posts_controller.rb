class PostsController < ApplicationController
  before_action :find_post, except: [:index, :create, :new]

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
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
      @feed_items = []
      flash.now[:danger] = t ".failed_create"
      render "static_pages/home"
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = t(".successfully_updated")
      redirect_to post_path(@post)
    else
      flash.now[:alert] = t(".error_updating")
      render :edit
    end
  end

  def show
  end

  def destroy
    if @post.destroy
      flash[:notice] = t(".successfully_deleted")
    else
      flash.now[:alert] = t(".error_updating")
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit :title, :content, :all_tags
  end

  def find_post
    @post = Post.find_by(id: params[:id])
  end
end
