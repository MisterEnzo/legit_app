Rails.application.routes.draw do
  devise_for :companies
  devise_for :users

  resources :reviews
  resources :companies, only: [:index, :show]

  root              to: 'static_pages#home'
  get '/about',     to: 'static_pages#about'
  get '/company',   to: 'static_pages#company_home'
end
