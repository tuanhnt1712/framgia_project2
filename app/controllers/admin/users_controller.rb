class Admin::UsersController < ApplicationController
  load_and_authorize_resource
  layout "admin"

  def index
    @users = User.select(:id, :name, :email, :avatar, :phone).sort_by_name
      .page(params[:page]).per Settings.user.page_user
    respond_to do |format|
      format.html
      format.csv {send_data @users.to_csv}
      format.xls {send_data @users.to_csv(col_sep: "\t")}
    end
  end

  def destroy
    if @user.destroy
      respond_to do |format|
        format.html do
          flash[:success] = t ".deleted_user"
          redirect_to admin_root_path
        end
        format.js
      end
    else
      flash.now[:alert] = t ".delete_failed"
      redirect_to admin_root_path
    end
  end
end
