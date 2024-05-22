Rails.application.routes.draw do
  root to: 'restaurants#index'

  # get '/restaurants/top', to: 'restaurants#top'
  # get '/restaurants/:id/chef', to: 'restaurants#chef'

  # get '/reviews/new', to: 'reviews#new'
  # post '/reviews', to: 'reviews#create'

  # DELETE /reviews/:id
  resources :reviews, only: [:destroy]

  resources :restaurants do
    resources :reviews, only: [:new, :create]

    collection do
      get :top # GET /restaurants/top, to: 'restaurants#top'
      get :shitty # GET /restaurants/shitty, to: 'restaurants#shitty'
    end

    member do
      get :chef # GET /restaurants/:id/chef, to: 'restaurants#chef'
      get :schedule # GET /restaurants/:id/schedule, to: 'restaurants#schedule'
    end
  end
end
