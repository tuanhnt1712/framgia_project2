class UsersController < ApplicationController
  load_and_authorize_resource only: :index
  load_resource only: :show

  def index
    @users = User.select(:id, :name, :email, :avatar, :phone).sort_by_id
      .page(params[:page]).per Settings.user.page_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  def following
    @title = t ".following"
    @user = User.find_by id: params[:id]
    @users = @user.following.page(params[:page]).per Settings.user.users_per_page
    render :show_follow
  end

  def followers
    @title = t ".followers"
    @user = User.find_by id: params[:id]
    @users = @user.followers.page(params[:page]).per Settings.user.users_per_page
    render :show_follow
  end
end
