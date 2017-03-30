class EpisodesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @user = current_user
    @episode = Episode.new
  end
end