Rails.application.routes.draw do
  root to: 'dashboard#index'

  get 'dashboard', to: 'dashboard#index'
  get 'keywords', to: 'keywords#index'

  get '/graphs/keyword_data', to: 'graphs#keyword_data', defaults: { format: 'json' }
end
