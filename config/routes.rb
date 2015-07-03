Rails.application.routes.draw do
  resources :notifications

  root 'questions#index'
  get "questions/next_page", to: "questions#get_next_page"
  resources :questions, :users do
    member do
      post 'create_answer'
      post 'create_question_comment'
      post 'create_answer_comment'
    end
  end

  get "ranking", to: "users#ranking"

  resources :disciplines

  get "search", to: "questions#search", as: :search

  get "tags/search/:search_term", to: "disciplines#search_tag", method: :json

  devise_controllers = {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  devise_for :users, path: "", controllers: devise_controllers, path_names: { sign_in: 'login', password: 'forgot', confirmation: 'confirm', unlock: 'unblock', sign_up: 'signup', sign_out: 'signout'}

  get 'sobre' => 'home#about', as: :about
  get 'ajuda' => 'home#help', as: :help
end
