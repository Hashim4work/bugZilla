Rails.application.routes.draw do
  
  devise_for :users
  resources :projects do
    get 'add_user'
    get 'add_user_to_project'
    get 'remove_user_from_project'
  	resources :bugs do
      get 'update_assigner'
      get 'update_complete'
    end
  end
  #put 'bugs/update_assigner' => 'bugs#update_assigner'
  #put 'bugs_controller/update_assigner' => 'bugs_controller#update_assigner'
  get 'projects/index'
  #root to: redirect('users/sign_in')
  authenticated :user do
 	  root to: "projects#index", as: :authenticated_root
  end
  root to: redirect('users/sign_in')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
