Rails.application.routes.draw do
resources :products
resources :users  do
 	collection do
    get 'login'
    post 'authenticate'
    delete 'logout'
 	end

 end
 root to: "users#login"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
