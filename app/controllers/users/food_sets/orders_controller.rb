class Users::FoodSets::OrdersController < Users::FoodSets::ApplicationController
  def create
    current_user.create_order_by!(@food_set)
    redirect_to users_orders_path, notice: 'ご注文を受け付けました。'
  end
end
