Rails.application.routes.draw do
  root to: 'dashboard#index'

  get 'dashboard', to: 'dashboard#index'

  get 'keywords', to: 'keywords#index'
  get 'paired_keywords', to: 'keywords#paired_keywords'

  get 'apertures', to: 'exif#apertures'
  get 'focal_lengths', to: 'exif#focal_lengths'
  get 'lenses', to: 'exif#lenses'

  get '/graphs/keyword_data', to: 'graphs#keyword_data', defaults: { format: 'json' }
  get '/graphs/paired_keyword_data', to: 'graphs#paired_keyword_data', defaults: { format: 'json' }
  get '/graphs/aperture_data', to: 'graphs#aperture_data',defaults: { format: 'json' }
  get '/graphs/focal_length_data', to: 'graphs#focal_length_data', defaults: { format: 'json' }
  get '/graphs/lens_data', to: 'graphs#lens_data', defaults: { format: 'json' }
end
