Rails.application.routes.draw do
  get "surveys" => "surveys#index"
  get "surveys/new" => "surveys#new"
  post "surveys" => "surveys#create"
  get "questions/:id" => "questions#new"
  post "questions/:id" => "questions#create"
end
