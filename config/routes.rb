Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/api/v1/forecast", to: "api/v1/landing#forecast"
  get "/api/v1/backgrounds", to: "api/v1/landing#background"
end
