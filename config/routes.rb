Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  resources :games, only: [:new, :create] do
    member do
      get "lobby"
    end
    member do
      get "song_selection"
    end
  end
  # post "dashboard", to: 'games#create' do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


