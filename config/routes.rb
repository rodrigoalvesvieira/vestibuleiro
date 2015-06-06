Rails.application.routes.draw do
  root 'questions#index'

  resources :questions, :users, :teachers
  resources :disciplines

  get "tags/search/:search_term", to: "disciplines#search_tag", method: :json

  devise_controllers = {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  devise_for :users, path: "", controllers: devise_controllers, path_names: { sign_in: 'login', password: 'forgot', confirmation: 'confirm', unlock: 'unblock', sign_up: 'signup', sign_out: 'signout'}

  get 'sobre' => 'home#about', as: :about
  get 'ajuda' => 'home#help', as: :help
end
