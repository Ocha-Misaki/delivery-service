class Admins::FoodSet::ApplicationController < Admins::ApplicationController
  def set_food_set
    @food_set = FoodSet.find(params[:food_set_id])
  end
end
