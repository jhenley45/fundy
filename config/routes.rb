Grifter::Application.routes.draw do

  get "pledges/index"
  get "pledges/show"
  get "pledges/new"
  get "pledges/update"
  get "pledges/destroy"
  devise_for :users
  root to: 'gifts#index'
  resources :gifts do
  	resources :pledges
  end

end
