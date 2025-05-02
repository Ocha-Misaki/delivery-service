class Users::FoodSetsController < Users::ApplicationController
  def index
    @food_sets = FoodSet.default_order
  end

  def show
    @food_set = FoodSet.find(params[:id])
  end
end
