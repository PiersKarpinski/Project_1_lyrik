class GenresController < ApplicationController
  before_filter :authenticate_user!

  def index
    @genres = Genre.all
    authorize! :index, Genre
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @genres }
    end
  end

  def show
    @genre = Genre.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @genre }
    end
  end

  def new
    @genre = Genre.new
    authorize! :new, @genre
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @genre }
    end
  end

  def edit
    @genre = Genre.find(params[:id])
    authorize! :edit, @genre
  end

  def create
    @genre = Genre.new(params[:genre])
    respond_to do |format|
      if @genre.save
        format.html { redirect_to @genre, notice: 'Genre was successfully created.' }
        format.json { render json: @genre, status: :created, location: @genre }
      else
        format.html { render action: "new" }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @genre = Genre.find(params[:id])
    respond_to do |format|
      if @genre.update_attributes(params[:genre])
        format.html { redirect_to @genre, notice: 'Genre was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    authorize! :destroy, @genre
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to genres_url }
      format.json { head :no_content }
    end
  end
end
