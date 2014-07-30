class DiscoverController < ApplicationController

  def index
    @songs = Song.order(:created_at).page(params[:page])
  end

end