class RestaurantsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    restaurants = Restaurant.all
    render json: restaurants
  end

  def show
    restaurant = find_restaurant
    render json: restaurant, only: [:id, :name, :address], include: { pizzas: { only: [:id, :name, :ingredients] } }
  end

  # DELETE /restaurant/:id
  def destroy
    restaurant = find_restaurant
    
      restaurant.destroy
      head :no_content
   
      render_not_found_response
   
  end


  private

  def find_restaurant
    Restaurant.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Restaurant not found" }, status: :not_found
  end

  #   rescue_from ActiveRecord::RecordNotFound,
  #   with: :render_not_found_response will be triggered
  # when the controller action tries to find a bird by id,
  #      but no bird with the given id exists in the database.
  #       In this case, the find_bird method will raise an
  #          ActiveRecord::RecordNotFound exception, and
  #          the rescue_from method will catch the exception and call
  #           the render_not_found_response method to return a JSON response
  #           with the error message "Bird not found" and an HTTP status code of 404.
end
