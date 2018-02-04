class BooksController < ApplicationController

    http_basic_authenticate_with name: "42", password: "42", only: :destroy
    before_action :set_book, only: [:edit, :update, :destroy, :show]

    def index
      @lastest_add_books = Book.all.order(created_at: :desc )
    end

    def search
      search_name = "%#{params[:name]}%"
      @books = Book.where "name like ?", search_name
    end

    def show
      renderiza :show
    end

    def new
      @book = Book.new
      renderiza :new
    end

    def create
      @book = Book.new book_params
      if @book.save
        flash[:notice] = "Livro \"#{@book.name}\" salvo com sucesso!"
        redirect_to root_url
      else
        renderiza :new
      end
    end

    def edit
      renderiza :edit
    end

    def update
      if @book.update book_params
        flash[:notice] = "Livro \"#{@book.name}\" atualizado com sucesso!"
        redirect_to root_url
      else
        renderiza :new
      end
    end

    def destroy
      if @book.destroy
        flash[:notice] = "Livro \"#{@book.name}\" deletado!"
        redirect_to root_url
      end
    end

    private

    def book_params
      params.require(:book).permit(:name, :author, :publisher, :stars, :about, :image)
    end

    def renderiza(view)
      render view
    end

    def set_book
      id = params[:id]
      @book = Book.find(id)
    end
end
