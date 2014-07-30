class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all
    @genres = Genre.all
    @songs = Song.all
    @comments = Comment.all
  end
end