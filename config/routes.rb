Rails.application.routes.draw do
  resources :sessions, only:[:index, :new, :create, :destroy]
  resources :users, only:[:index, :new, :create, :show,]
  resources :articles do
    collection do
      post :confirm
    end
  end
end
