Rails.application.routes.draw do
  get '/' => 'home#index'

  get '/history_search' => 'transactions#history_search', as: 'history_search'
  get '/history' => 'transactions#history'

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :users, only: [ :show, :index ] do
    resources :transactions
    resources :categories
  end

  resources :categories do
    resources :goals
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
