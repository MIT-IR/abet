Rails.application.routes.draw do
  concern :assessments do
    resources :results, only: [:new, :create]
  end

  namespace :assessments do
    resources :courses, only: [:index]
  end

  resource :assessments_dashboard, controller: "assessments_dashboard", only: [:show]

  resources :courses, only: [] do
    resources :standard_outcomes, only: [:index, :create]
    resources :outcomes, only: [:new, :create, :index]
  end

  resources :direct_assessments,
    only: [:show, :edit, :update],
    concerns: :assessments

  resources :indirect_assessments,
    only: [:show, :edit, :update],
    concerns: :assessments

  resources :outcomes, only: [:show, :edit, :update] do
    resources :assessments, only: [:new]
    resources :direct_assessments, only: [:new, :create]
    resources :indirect_assessments, only: [:new, :create]
  end

  resource :outcomes_dashboard, controller: "outcomes_dashboard", only: [:show]

  resources :subjects, only: [:index, :show]

  get "/pages/*id" => "pages#show", as: :page, format: false
  root "outcomes_dashboard#show"
end
