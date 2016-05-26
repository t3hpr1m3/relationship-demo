class ActorsController < ApplicationController
  respond_to :html

  def index
    respond_with @actors = Actor.all
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

  private

  def actor_params
    params.require(:actor).permit(:name)
  end
end

