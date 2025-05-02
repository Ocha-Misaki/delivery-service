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
    @food_set = FoodSet.new(grocery_params)
    if @food_set.save
      redirect_to admins_food_sets_path, notice: t("controller.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @food_set.update(grocery_params)
      redirect_to admins_food_sets_path, notice: t("controller.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food_set.destroy!
    redirect_to admins_food_sets_path, notice: t("controller.deleted")
  end

  private

  def set_food_set
    @food_set = FoodSet.find(params[:id])
  end

  def food_set_params
    params.expect(food_set: %i[name price total_weight refrigerated])
  end
end
