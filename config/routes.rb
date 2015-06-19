Rails.application.routes.draw do
  concern :assessments do
    resources :results, only: [:new, :create]
  end

  namespace :assessments do
    resources :courses, only: [:index]
  end

  namespace :manage_outcomes do
    root "dashboard#show"

    resources :courses, only: [] do
      resources :standard_outcomes, only: [:index, :create]
      resources :outcomes, only: [:index, :new, :create]
    end

    resources :outcomes, only: [:edit, :update]
  end

  resource :assessments_dashboard, controller: "assessments_dashboard", only: [:show]

  resources :courses, only: [] do
    resources :assessments, only: [:index]
  end

  resources :direct_assessments,
    only: [:show, :new, :create, :edit, :update],
    concerns: :assessments

  resources :indirect_assessments,
    only: [:show, :edit, :update],
    concerns: :assessments

  resources :outcomes, only: [:show] do
    resources :assessments, only: [:new]
    resources :indirect_assessments, only: [:new, :create]
  end

  resources :results, only: [:edit, :update, :destroy]

  resources :subjects, only: [:index, :show]

  get "/pages/*id" => "pages#show", as: :page, format: false
  root "manage_outcomes/dashboard#show"
end
