class StaticPagesController < ApplicationController
  respond_to :html

  def index
    respond_with @movies = Movie.all
  end
end
