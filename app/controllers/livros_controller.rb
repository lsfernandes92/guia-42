class LivrosController < ApplicationController

  before_action :set_livro, only: [:edit, :update, :destroy]

  def index
    @ultimos_livros_inseridos = Livro.all.order(created_at: :desc )
  end

  def show
    @livro = Livro.find(params[:id])
    renderiza :show
  end

  def busca
    nome_a_buscar = "%#{params[:nome]}%"
    @livros = Livro.where "nome like ?", nome_a_buscar
  end

  def new
    @livro = Livro.new
    renderiza :new
  end

  def create
    @livro = Livro.new livro_params
    if @livro.save
      flash[:notice] = "Livro \"#{@livro.nome}\" salvo com sucesso!"
      redirect_to root_url
    else
      renderiza :new
    end
  end

  def edit
    renderiza :edit
  end

  def update
    if @livro.update livro_params
      flash[:notice] = "Livro \"#{@livro.nome}\" atualizado com sucesso!"
      redirect_to root_url
    else
      renderiza :new
    end
  end

  def destroy
    if @livro.destroy
      flash[:notice] = "Livro \"#{@livro.nome}\" deletado!"
      redirect_to root_url
    end
  end

  private

  def livro_params
    params.require(:livro).permit(:nome, :autor, :editora, :nota, :descricao)
  end

  def renderiza(view)
    render view
  end

  def set_livro
    id = params[:id]
    @livro = Livro.find(id)
  end
end
