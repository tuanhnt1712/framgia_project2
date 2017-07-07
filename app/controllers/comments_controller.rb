class CommentsController < ApplicationController
  before_action :load_post
  before_action :load_comment, only: [:update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def create
    @comment = @post.comments.build comment_params
    @comment.user_id = current_user.id

    if @comment.save
      render json: {status: :success, html: render_to_string(@comment)}
    else
      render json: {status: :error}
    end
  end

  def update
    if @comment.update_attributes comment_params
      render json: {status: :success, html: render_to_string(@comment)}
    else
      render json: {status: :error}
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html do
          flash[:success] = t ".delete_success"
          redirect_to :back
        end
        format.js
      end
    else
      flash[:danger] = t ".failed_delete"
      redirect_to root_url
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end

  def load_post
    @post = Post.find_by id: params[:post_id]
    load_info @post
  end

  def load_comment
    @comment = @post.comments.find_by id: params[:id]
    load_info @comment
  end
end
