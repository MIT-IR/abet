Rails.application.routes.draw do
  root "home#index"

  resources :departments, only: [:show]

  resources :courses, only: [:show] do
    resource :default_outcomes, only: [:create]
    resources :outcomes
  end

  resources :outcomes do
    resources :assessments
    resources :direct_assessments, only: [:new, :create]
    resources :indirect_assessments, only: [:new, :create]
    resources :outcome_alignments
  end

  concern :assessments do
    resources :results, only: [:new, :create]
  end

  resources :direct_assessments, only: [:show, :edit, :update], concerns: :assessments
  resources :indirect_assessments, only: [:show, :edit, :update], concerns: :assessments

  get "/pages/*id" => "pages#show", as: :page, format: false
end
