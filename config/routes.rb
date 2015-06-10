Rails.application.routes.draw do
  concern :assessments do
    resources :results, only: [:new, :create]
  end

  resources :courses, only: [:show] do
    resource :default_outcomes, only: [:create]
    resources :outcomes, only: [:new, :create]
  end

  resources :departments, only: [:show]

  resources :direct_assessments,
    only: [:show, :edit, :update],
    concerns: :assessments

  resources :indirect_assessments,
    only: [:show, :edit, :update],
    concerns: :assessments

  resources :outcomes, only: [:show] do
    resources :assessments, only: [:new]
    resources :direct_assessments, only: [:new, :create]
    resources :indirect_assessments, only: [:new, :create]
  end

  resource :outcomes_dashboard, controller: "outcomes_dashboard", only: [:show]

  get "/pages/*id" => "pages#show", as: :page, format: false
  root "home#index"
end
