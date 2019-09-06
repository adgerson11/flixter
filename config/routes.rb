Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#index'
  # associating courses content for index and show. 
    resources :courses, only: [:index, :show] do
      resources :enrollments, only: :create 
    end
    
    resources :lessons, only: [:show]

  # associating namespace for instructor courses
    namespace :instructor do
      resources :lessons, only: [:update]
      resources :sections, only: [] do
        resources :lessons, only: [:new, :create]
      end
      resources :courses, only:  [:new, :create, :show] do
  # associating sections with the courses. 
        resources :sections, only: [:new, :create] 

  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
