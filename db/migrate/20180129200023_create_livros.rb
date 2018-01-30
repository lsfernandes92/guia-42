class CreateLivros < ActiveRecord::Migration[5.1]
  def change
    create_table :livros do |t|
      t.string :nome
      t.string :autor
      t.string :editora
      t.integer :nota
      t.text :descricao

      t.timestamps
    end
  end
end
