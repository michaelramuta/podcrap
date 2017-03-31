class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => :show

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user].permit(:title, :website, :copyright, :subtitle, :summary, :description, :username, :category, :explicit, :image_link))
        redirect_to root_path
    else
        render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @episodes = @user.episodes
    respond_to do |format|
      format.html
      format.xml
    end
  end
end
