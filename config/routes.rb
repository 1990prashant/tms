class RoleConstraint

  def self.matches?(request)
    request.env['warden'].user.try(:admin?)
  end

end

Rails.application.routes.draw do
  resources :todos do
    post :update_state
  end
  resources :projects do
    member do
      get :add_developer
      get :add_todo
      put :update_todos
    end
  end
  devise_for :users
  
  authenticate :user do
    root "projects#index", constraints: RoleConstraint
  end
  root "todos#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
