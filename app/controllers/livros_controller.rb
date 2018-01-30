class LivrosController < ApplicationController

  def index
    @ultimos_livros_inseridos = Livro.all.order(created_at: :asc)
  end

  def busca
    nome_a_buscar = "%#{params[:nome]}%"
    @livros = Livro.where "nome like ?", nome_a_buscar
  end
end
