Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   #root "user#new"

   get 'article', to: 'article#index'


   get 'signup', to: 'users#new'

   resources :users, except: [:new]

  

end
