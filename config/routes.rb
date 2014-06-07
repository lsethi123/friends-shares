FriendsShares::Application.routes.draw do
  resources :evnets_shares


  resources :events


  resources :friends


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end