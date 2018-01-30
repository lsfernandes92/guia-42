Rails.application.routes.draw do
  resources :livros, only: [:new, :create, :edit, :update, :destroy, :show]
  get "livros/busca" => "livros#busca", as: :busca_livro
  root "livros#index"
end
