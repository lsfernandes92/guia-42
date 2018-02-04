Rails.application.routes.draw do
  resources :books, only: [:new, :create, :edit, :update, :destroy, :show, :search]
  get "books/search" => "books#search",  as: :search_book
  root "books#index"
end
