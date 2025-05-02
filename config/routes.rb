Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  namespace :admins do
    root "groceries#index"
    resources :foods, only: [ :show, :new, :create, :edit, :update, :destroy ]
    resources :food_sets
    resources :food_set_items, only: [ :new, :create, :edit, :update, :destroy ]
  end
end
