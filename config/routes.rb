Rails.application.routes.draw do

  root 'site/home#index'

  #Site routes
  get '/index' => 'site/home#index'

  #BackOffice routes
  get '/admin' => 'backoffice/dashboard#index'

  namespace :backoffice do
    get '/' => 'dashboard#index'
    resources :categories, except: [:show]
  end



  devise_for :admins
  devise_for :members

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
