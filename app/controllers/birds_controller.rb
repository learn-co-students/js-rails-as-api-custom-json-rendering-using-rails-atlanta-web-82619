class BirdsController < ApplicationController

  def index
    birds = Bird.all
    render json: birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: only: [:id, :name, :species]
    else
      render json: { message: 'Bird not found' }
    end
    # render json: {id: bird.id, name: bird.name, species: bird.species}
    #OR: render json: bird.slice(:id, :name, :species) BUT NOT BEST HERE
    # render json: birds, except: [:created_at, :updated_at]
  end

end