SharedHouses::Application.routes.draw do   
  authenticated :house do
    root :to => "houses#show"
  end

  root :to => "home#index"
  
  devise_for :houses, :controllers => { :registrations => 'houses/registrations',
                                        :sessions => 'houses/sessions' }
  devise_for :mates, :controllers => { :sessions => 'mates/sessions',
                                       :registrations => 'mates/registrations' }
  resources :houses, :mates, :items, :needs, :months
  resources :transactions, :only => [ :update ]
  
  match "/needs/delete_many", :to => "needs#delete_many"
  match "/houses/sign_in", :to => "home#index"
end