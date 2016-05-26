class ActorsController < ApplicationController
  respond_to :html

  # this is really heavy.  Should probably move to a javascript form
  before_action :load_movies, only: [:new, :create, :edit, :update]

  def index
    @filter = Filter.new(%w(name movies.title), params)
    respond_with @actors = @filter.apply(Actor)
  end

  def show
    respond_with @actor = Actor.find(params[:id])
  end

  def new
    respond_with @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      flash[:notice] = 'Actor created successfully.'
    end

    respond_with @actor
  end

  def edit
    respond_with @actor = Actor.find(params[:id])
  end

  def update
    @actor = Actor.find(params[:id])
    if @actor.update_attributes(actor_params)
      flash[:notice] = 'Actor updated successfully.'
    end

    respond_with @actor, location: actors_url
  end

  def destroy
    @actor = Actor.find(params[:id])
    respond_with @actor, location: root_url if @actor.nil?

    @actor.destroy

    flash[:notice] = 'Actor successfully deleted.'

    respond_with @actor
  end

  private

  def actor_params
    params.require(:actor).permit(:name, :thumbnail_url, movie_ids: [])
  end

  def load_movies
    @movies = Movie.all
  end
end

