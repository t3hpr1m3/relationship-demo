class MoviesController < ApplicationController
  respond_to :html

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

  private

  def movie_params
    params.require(:movie).permit(:title)
  end
end
