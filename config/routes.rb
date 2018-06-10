Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "repositories#index"
  post "" => "repositories#search"
  get "repository/:id" => "repositories#show"
end
