Rails.application.routes.draw do

  devise_for :users
  resource :dashboard, only: [:show]
  root 'static_pages#index'
  # associating courses content for index and show. 
    resources :courses, only: [:index, :show] do
      resources :enrollments, only: :create 
    end
    
    resources :lessons, only: [:show]

  # associating namespace for instructor courses
    namespace :instructor do
      resources :lessons, only: [:update]
      resources :sections, only: [:update] do
        resources :lessons, only: [:create]
      end
      resources :courses, only:  [:new, :create, :show] do
        resources :sections, only: [:create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
