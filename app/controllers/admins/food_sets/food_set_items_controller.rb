class Admins::FoodSets::FoodSetItemsController < Admins::FoodSet::ApplicationController
  def new
    @food_set_item = @food_set.food_set_items.new
  end

  def create
    @food_set_item = @food_set.food_set_items.new(food_set_item_params)
    if @food_set_item.save
      redirect_to admins_food_set_path(@food_set), notice: "食品が登録されました"
    else
      render :new
    end
  end

  def destroy
    @food_set_item = @food_set.food_set_items.find(params[:id])
    @food_set_item.destroy!
    redirect_to admins_food_set_path(@food_set), notice: "食品が削除されました"
  end
end
