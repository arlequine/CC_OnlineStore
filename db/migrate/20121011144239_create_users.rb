class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # Completa con las columnas que necesites
      t.string :user_name
      t.string :user_type
      t.string :email
      t.string :password
      t.timestamps
    end
  end
end
