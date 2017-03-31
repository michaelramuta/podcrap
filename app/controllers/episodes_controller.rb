class EpisodesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize, :except => [:new, :create]

  def new
    @user = current_user
    @episode = Episode.new
  end

  def create
    @user = current_user
    @episode = Episode.new(params[:episode].permit(:title, :subtitle, :summary, :audio_link, :image_link, :length, :duration))
    @episode.user = current_user
    if @episode.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @episode = Episode.find(params[:id])
  end

  def update
    @episode = Episode.find(params[:id])
    if @episode.update_attributes(params[:episode].permit(:title, :subtitle, :summary, :audio_link, :image_link, :length, :duration))
        redirect_to root_path
    else
        render 'edit'
    end
  end

  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy
    redirect_to root_path
  end

  private
  def authorize
    if Episode.find(params[:id]).user != current_user
      redirect_to root_path
    end
  end
end