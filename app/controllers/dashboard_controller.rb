class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all
    @genres = Genre.all
    @songs = Song.where(user_id: current_user.id)
    @comments = Comment.where(user_id: current_user.id)
  end
end