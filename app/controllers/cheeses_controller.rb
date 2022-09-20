class CheesesController < ApplicationController

  # GET /cheeses
  def index # gets all cheeses and renders as json
    cheeses = Cheese.all
    render json: cheeses
  end

  # GET /cheeses/:id
  def show # gets one cheese using id and renders everything except exceptions
    cheese = Cheese.find_by(id: params[:id])
    if cheese # without conditional, if cheese was not found, it would be assigned nil
      # conditional accounts for records that do not exist
      # if cheese is checking if cheese is truthy or falsy
        # nil is falsy and would return error
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
          # also calls summary on cheese displays its return as json
    else 
      render json: { error: 'Cheese not found' }, status: :not_found # not_found gives 404 error
    end
  end

end
