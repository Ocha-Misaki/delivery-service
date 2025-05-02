class Users::FoodSets::ApplicationController < Users::ApplicationController
  before_action :set_food_set

  private
  def set_food_set
    @food_set = FoodSet.find(params[:food_set_id])
  end
end
