class Admins::FoodSetsController < Admins::ApplicationController
  before_action :set_food_set, only: %i[show edit update destroy]

  def index
    @food_sets = FoodSet.default_order
  end

  def show; end

  def new
    @food_set = FoodSet.new
  end

  def create
    @food_set = FoodSet.new(food_set_params)
    if @food_set.save
      redirect_to admins_food_sets_path, notice: t("controllers.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @food_set.update(food_set_params)
      redirect_to admins_food_sets_path, notice: t("controllers.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food_set.destroy!
    redirect_to admins_food_sets_path, notice: t("controllers.deleted")
  end

  private

  def set_food_set
    @food_set = FoodSet.find(params[:id])
  end

  def food_set_params
  params.require(:food_set).permit(:name, :price, :total_weight, :refrigerated, food_ids: [])
  end
end
