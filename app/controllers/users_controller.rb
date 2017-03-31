class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => :show
  before_filter :authorize, :except => :show

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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

  private
  def authorize
    if User.find(params[:id]) != current_user
      redirect_to root_path
    end
  end
end
