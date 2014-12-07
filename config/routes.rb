Rails.application.routes.draw do
  # API ROUTES
  namespace :api, path: '/api', defaults: {format: :json} do
    resources :meetings
  end
end
