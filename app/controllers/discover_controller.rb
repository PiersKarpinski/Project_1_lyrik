class DiscoverController < ApplicationController

  def index
    @genres = Genre.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @genres }
    end
  end

end