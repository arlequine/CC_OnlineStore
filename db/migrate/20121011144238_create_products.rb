class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      # Completa con las columnas que necesites
      t.string :name
      t.string :description
      t.integer :price
      t.string :empresa
      t.timestamps
    end
  end
end
