Rails.application.routes.draw do
  root to: 'dashboard#index'

  get 'dashboard', to: 'dashboard#index'
  get 'keywords', to: 'keywords#index'
  get 'paired_keywords', to: 'keywords#paired_keywords'

  get '/graphs/keyword_data', to: 'graphs#keyword_data', defaults: { format: 'json' }
  get '/graphs/paired_keyword_data', to: 'graphs#paired_keyword_data', defaults: { format: 'json' }
end
