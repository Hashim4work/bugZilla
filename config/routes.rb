Rails.application.routes.draw do

  devise_for :users

  get 'projects/index'

  authenticated :user do
 	  root to: "projects#index", as: :authenticated_root
    resources :projects do
    get 'add_user'
    get 'add_user_to_project'
    get 'remove_user_from_project'
    resources :bugs do
      get 'update_assigner'
      get 'update_complete'
    end
  end

  end

  root to: redirect('users/sign_in')

end
