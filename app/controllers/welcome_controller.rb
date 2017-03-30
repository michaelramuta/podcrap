class WelcomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @episodes = current_user.episodes
  end
end
