Rails.application.routes.draw do
  
  devise_for :users
  resources :projects do
  	resources :bugs
  end

  get 'projects/index'
  #root to: redirect('users/sign_in')
  authenticated :user do
 	root to: "projects#index", as: :authenticated_root
  end
  root to: redirect('users/sign_in')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
