Hackathon::Application.routes.draw do
  root to: "images#index"
  resources :blasts
  resources :images
end
