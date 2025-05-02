Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  namespace :admins do
    root "foods#index"
    resources :foods, only: [ :show, :new, :create, :edit, :update, :destroy ]
    resources :food_sets
  end
end
