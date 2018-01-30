class Livro < ApplicationRecord

  validates :nome, :autor, :editora, presence: true
end
