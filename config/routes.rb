Rails.application.routes.draw do
  root to: 'dashboard#index'

  get 'dashboard', to: 'dashboard#index'

  get 'keywords', to: 'keywords#index'
  get 'paired_keywords', to: 'keywords#paired_keywords'

  get 'file_formats', to: 'images#file_formats'
  get 'ratings', to: 'images#ratings'
  get 'updates', to: 'images#updates'

  get 'apertures', to: 'exif#apertures'
  get 'focal_lengths', to: 'exif#focal_lengths'
  get 'lenses', to: 'exif#lenses'
  get 'isos', to: 'exif#isos'
  get 'shutterspeeds', to: 'exif#shutterspeeds'
  get 'cameras', to: 'exif#cameras'

  get 'isos_by_camera', to: 'exif#isos_by_camera'
  get 'focal_lengths_by_camera', to: 'exif#focal_lengths_by_camera'
  get 'lenses_by_camera', to: 'exif#lenses_by_camera'

  get 'cameras_by_year', to: 'exif#cameras_by_year'

  get 'crop_sizes', to: 'develop_settings#crop_sizes'
  get 'develop_steps', to: 'develop_settings#develop_steps'
  get 'adjustments', to: 'develop_settings#adjustments'
  get 'white_balances', to: 'develop_settings#white_balances'

  get '/graphs/keyword_data', to: 'graphs#keyword_data', defaults: { format: 'json' }
  get '/graphs/paired_keyword_data', to: 'graphs#paired_keyword_data', defaults: { format: 'json' }

  get '/graphs/file_format_data', to: 'graphs#file_format_data', defaults: { format: 'json' }
  get '/graphs/rating_data', to: 'graphs#rating_data', defaults: { format: 'json' }
  get '/graphs/update_data', to: 'graphs#update_data', defaults: { format: 'json' }

  get '/graphs/aperture_data', to: 'graphs#aperture_data',defaults: { format: 'json' }
  get '/graphs/focal_length_data', to: 'graphs#focal_length_data', defaults: { format: 'json' }
  get '/graphs/lens_data', to: 'graphs#lens_data', defaults: { format: 'json' }
  get '/graphs/iso_data', to: 'graphs#iso_data', defaults: { format: 'json' }
  get '/graphs/shutterspeed_data', to: 'graphs#shutterspeed_data', defaults: { format: 'json' }
  get '/graphs/camera_data', to: 'graphs#camera_data', defaults: { format: 'json' }

  get '/graphs/isos_by_camera_data', to: 'graphs#isos_by_camera_data', defaults: { format: 'json' }
  get '/graphs/focal_lengths_by_camera_data', to: 'graphs#focal_lengths_by_camera_data', defaults: { format: 'json' }
  get '/graphs/lenses_by_camera_data', to: 'graphs#lenses_by_camera_data', defaults: { format: 'json' }

  get '/graphs/crop_size_data', to: 'graphs#crop_size_data', defaults: { format: 'json' }
  get '/graphs/develop_step_data', to: 'graphs#develop_step_data', defaults: { format: 'json' }
  get '/graphs/adjustment_data', to: 'graphs#adjustment_data', defaults: { format: 'json' }
  get '/graphs/white_balance_data', to: 'graphs#white_balance_data', defaults: { format: 'json' }

  get '/graphs/cameras_by_year_data', to: 'graphs#cameras_by_year_data', defaults: { format: 'json' }
end
