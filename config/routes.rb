Grifter::Application.routes.draw do

  # get "invitations/index"
  # get "invitations/new"
  # get "invitations/create"
  # get "invitations/show"
  # get "invitations/destroy"
  # get "user_venmos/index"
  # get "user_venmos/new"
  # get "user_venmos/create"
  # get "user_venmos/update"

  get 'venmo_accounts/confirm_venmo' => 'venmo_accounts#confirm_venmo'

  devise_for :users
  resources :venmo_accounts


  resources :gifts do
  	resources :pledges
    resources :invitations
  end

  root to: 'gifts#index'
end
