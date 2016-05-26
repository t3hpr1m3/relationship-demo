class StaticPagesController < ApplicationController
  def index
    @movies = Movie.all
    @actors = Actor.all
    respond_to do |format|
      format.html { render 'index' }
    end
  end
end
