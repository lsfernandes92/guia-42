class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :publisher
      t.integer :stars
      t.text :about
      t.string :image

      t.timestamps
    end
  end
end
