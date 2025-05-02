Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  namespace :admins do
    root "groceries#index"
    resources :foods, only: [ :show, :new, :create, :edit, :update, :destroy ]
    resources :food_sets do
      resources :food_set_items, only: [ :new, :create, :destroy ], module: :food_sets
    end
  end
end
