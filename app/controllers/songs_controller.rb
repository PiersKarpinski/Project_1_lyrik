class SongsController < ApplicationController
  before_filter :authenticate_user!, except: :index

  def index   
    @q = Song.search(params[:q])
    # authorize! :index, @song 
    @songs = @q.result.order(:created_at).page(params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @songs }
    end
  end

  def show
    @song = Song.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end

  def new
    @song = Song.new
    authorize! :new, @song 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song }
    end
  end

  def edit
    @song = Song.find(params[:id])  
    authorize! :edit, @song
  end

  def create
    @song = Song.new(params[:song])
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @song = Song.find(params[:id])
    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    authorize! :index, @song 
    end
  end
end
