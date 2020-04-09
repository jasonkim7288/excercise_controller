Rails.application.routes.draw do
  get "/books", to: "books#index"
  post "/books", to: "books#create"
  get "/books/:id", to: "books#show", as: "book"
  put "/books/:id", to: "books#update"
  delete "/books/:id", to: "books#destroy"

  root "books#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
