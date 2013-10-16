SharedHouses::Application.routes.draw do   
  root :to => "home#index"

  authenticated :house do
    root :to => "houses#show"
  end

  
  devise_for :houses, 
             :controllers => { :registrations => 'houses/registrations',
                               :sessions => 'houses/sessions' }
  devise_for :mates, 
             :controllers => { :sessions => 'mates/sessions',
                               :registrations => 'mates/registrations' }
  resources :houses, :only => [:new, :show ]
  resources :mates, :except => [:edit]
  resources :items, :except => [:edit, :update, :index]
  resources :needs, :only => [:new, :create]
  resources :months, :only => [:show, :index, :create]
  resources :transactions, :only => [ :update ]
  
  match "/needs/delete_many", :to => "needs#delete_many"
  match "/houses/sign_in", :to => "home#index"
end