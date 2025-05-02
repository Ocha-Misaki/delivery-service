class Users::OrdersController < Users::ApplicationController
  def index
    @orders = current_user.orders.includes(:food_set).default_order
  end
end
