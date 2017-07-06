class UsersController < ApplicationController
  load_and_authorize_resource only: :index
  load_resource only: :show

  def index
    @users = User.select(:id, :name, :email, :avatar).sort_by_id
      .page(params[:page]).per Settings.user.page_user
  end
end
