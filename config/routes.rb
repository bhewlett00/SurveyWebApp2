Rails.application.routes.draw do
  get "surveys" => "surveys#index"
  get "surveys/new" => "surveys#new"
  post "surveys" => "surveys#create"
  get "surveys/:id" => "surveys#show"
  get "surveys/:survey_id/:question_id" => "surveys#show_responses"
  get "questions/:id" => "questions#new"
  post "questions/:id" => "questions#create"
  get "respondents" => "respondents#index"
  get "respondents/new" => "respondents#new"
  post "respondents/:id" => "respondents#create"
  get "respondents/:id" => "respondents#show"
  get "responses/:respondent_id/:survey_id" => "responses#new"
  post "respondents" => "responses#create"
  post "surveys/:id/top_rated" => "surveys#top_rated"
  post "surveys/:id/low_rated" => "surveys#low_rated"
end
