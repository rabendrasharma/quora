Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :topics
  resources :questions
  resources :answers
  get '/follow' => "follows#follow", as: :follow
  get '/unfollow' => "follows#unfollow", as: :unfollow
  get '/followings' => "follows#followings", as: :followings
  get '/my_topics' => "users#my_topics", as: :my_topics
  get '/follow_topics' => "topics#follow_topics", as: :follow_topics
end
