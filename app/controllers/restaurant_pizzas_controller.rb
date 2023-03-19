class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

      # create! exceptions will be handled by the rescue_from ActiveRecord::RecordInvalid code
      def create
        restaurant_pizza = RestaurantPizza.create!(restaurant_params)
        render json: restaurant_pizza.pizza, only: [:id, :name, :ingredients]
      rescue ActiveRecord::RecordInvalid
        render json: { errors: restaurant_pizza.errors.full_messages }, status: :unprocessable_entity
      end
    
  private
  def restaurant_params
    params.permit(:price, :restaurant_id, :pizza_id)
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end
