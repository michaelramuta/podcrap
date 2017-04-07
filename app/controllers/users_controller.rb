class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @episodes = current_user.episodes
  end
end