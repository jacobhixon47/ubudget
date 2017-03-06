Rails.application.routes.draw do
  get '/' => 'home#index'

  get '/products' => 'products#index'

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :users, only: [ :show, :index ] do
    resources :transactions
  end

  resources :categories do
    resources :goals
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
