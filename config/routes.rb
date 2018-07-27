Rails.application.routes.draw do

  root 'site/home#index'

  #Site routes
  get '/index' => 'site/home#index'

  #BackOffice routes
  get '/admin' => 'backoffice/dashboard#index'

  namespace :backoffice do
    get '/' => 'dashboard#index'
    resources :admins, except: [:show]
    resources :categories, except: [:show, :destroy]
  end



  devise_for :admins, path_names: { sign_in: 'login' }, skip: [:registrations]
  devise_for :members

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
