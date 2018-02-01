class AddImageToLivros < ActiveRecord::Migration[5.1]
  def change
    add_column :livros, :image, :string
  end
end
