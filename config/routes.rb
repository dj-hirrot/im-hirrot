Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :blogs
  resources :experiences
  root 'page#top'

  namespace :admin do
    root "home#top"
    get "users" => "home#users"
    get "user_logs/:id/" => "home#user_logs", as: 'user_logs'
    patch "/:id/user_accept" => "home#user_accept", as: 'user_accept'
    get "blogs" => "home#blogs"
    patch "/:id/blog_publish" => "home#blog_publish", as: 'blog_publish'
  end
  # LetterOpener
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
