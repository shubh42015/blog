Rails.application.routes.draw do
  # get 'post/create'
  resources :blogs do
      get 'verify', on: :member
    resources :posts do
      resources :comments
    end
  end
  devise_for :users, controllers: { sessions: 'devise/sessions' }, skip: 'blog'
  root 'blogs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
