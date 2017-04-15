class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @podcast = current_user.podcast
    @episodes = current_user.episodes
  end
end