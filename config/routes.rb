Rails.application.routes.draw do
  devise_for :companies
  devise_for :users

  resources :companies, only: [:index, :show] do
    resources :reviews do
      resources :responses, except: [:show]
    end
  end


  root              to: 'static_pages#home'
  get '/about',     to: 'static_pages#about'
  
end
