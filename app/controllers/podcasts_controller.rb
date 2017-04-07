class PodcastsController < ApplicationController
  before_filter :authenticate_user!, :except => :show
  before_filter :authorize, :except => [:show, :new, :create]

  def edit
    @podcast = Podcast.find(params[:id])
  end

  def update
    @podcast = Podcast.find(params[:id])
    if @podcast.update_attributes(params[:podcast].permit(:title, :website, :copyright, :subtitle, :summary, :description, :username, :category, :explicit, :image_link))
        redirect_to root_path
    else
        render 'edit'
    end
  end

  def show
    @podcast = Podcast.find(params[:id])
    @episodes = @podcast.user.episodes.where(live: true)
    respond_to do |format|
      format.html
      format.xml
    end
  end

  def new
    @podcast = Podcast.new
  end

  def create
    @user = current_user
    @podcast = Podcast.new(params[:podcast].permit(:title, :website, :copyright, :subtitle, :summary, :description, :username, :category, :explicit, :image_link))
    @podcast.user = current_user
    if @podcast.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def authorize
    if Podcast.find(params[:id]).user != current_user
      redirect_to root_path
    end
  end
end
