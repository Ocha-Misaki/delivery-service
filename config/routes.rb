Rails.application.routes.draw do
  root "users/food_sets#index"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  namespace :admins do
    root "foods#index"
    resources :foods, only: [ :show, :new, :create, :edit, :update, :destroy ]
    resources :food_sets
  end

  namespace :users do
    root "food_sets#index"
    resources :food_sets, only: [ :show ] do
      resources :orders, only: [ :new, :create ], module: :food_sets
    end
    resources :orders, only: [ :index, :show ]
    resources :delivery_schedules, only: [ :index, :show ]
  end
end
