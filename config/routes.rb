Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  resources :games, only: [:new, :create, :show, :update] do
    member do
      get "lobby"
      get "category"
      get "song_selection1", to: "games#song_selection1"
      get "song_selection2", to: "games#song_selection2"
      post "save_categories"
    end
    resources :songs, only: [:create]
    resources :invited_users, only: [:create]
  end
  # post "dashboard", to: 'games#create' do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


