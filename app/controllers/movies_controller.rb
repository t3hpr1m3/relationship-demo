class MoviesController < ApplicationController
  respond_to :html

  # this is really heavy.  Should probably move to a javascript form
  before_action :load_actors, only: [:new, :create, :edit, :update]

  def index
    respond_with @movies = Movie.all
  end

  def show
    respond_with @movie = Movie.find(params[:id])
  end

  def new
    respond_with @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = 'Movie created successfully.'
    end

    respond_with @movie
  end

  def edit
    respond_with @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movie_params)
      flash[:notice] = 'Movie updated successfully.'
    end

    respond_with @movie, location: movies_url
  end

  def destroy
    @movie = Movie.find(params[:id])
    respond_with @movie, location: root_url if @movie.nil?

    @movie.destroy

    flash[:notice] = 'Movie successfully deleted.'

    respond_with @movie
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :thumbnail_url, actor_ids: [])
  end

  def load_actors
    @actors = Actor.all
  end
end
