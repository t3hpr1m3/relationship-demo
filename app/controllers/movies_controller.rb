class MoviesController < ApplicationController
  respond_to :html

  def index
    respond_with @movies = Movie.all
  end

  def show
    respond_with @movie = Movie.find(params[:id])
  end

  def new
    #
    # Need to clean this up once we have a more robust form in place, as
    # this is potentially really expensive/heavy
    #
    @actors = Actor.all

    respond_with @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = 'Movie created successfully.'
    end

    respond_with @movie
  end

  private

  def movie_params
    params.require(:movie).permit(:title)
  end
end
