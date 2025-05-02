class Users::OrdersController < Users::ApplicationController
  def index
    @orders = current_user.orders.default_order
  end
end
