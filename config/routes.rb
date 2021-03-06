Rails.application.routes.draw do
  resources :widgets, only: [:index, :show]
  resources :widget_ratings, only: [:create]

  namespace :customer_service do
    resources :widgets, only: [:show, :update, :destroy]
  end

  ####
  # Custom routes start here →#
  # For each new custom route: →#
  # * Be sure you have the canonical route declared above
  # * Add the new custom route below the existing ones
  # * Document why it's needed
  # * Explain anything else non-standard →
  # Used in podcast ads for the 'amazing' campaign
  get '/amazing', to: 'widgets#index'
  get 'manufacturer/:id', to: 'manufacturers#show'

  if Rails.env.development?
    resources :design_system_docs, only: [:index]
  end
end
