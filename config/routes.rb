Rails.application.routes.draw do
  root to: 'dashboard#index'

  get 'dashboard', to: 'dashboard#index'
  get 'popular_keywords', to: 'keywords#popular_keywords'
end
