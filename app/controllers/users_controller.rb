class UsersController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user].permit(:title, :website, :copyright, :subtitle, :summary, :description, :username, :category, :explicit))
        flash[:success] = "Your settings have been saved!"
        redirect_to root_path
    else
        render 'edit'
    end
  end
end