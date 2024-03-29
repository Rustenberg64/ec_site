class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :manufacturer
      t.integer :price
      t.text :description
      t.integer :stock

      t.timestamps
    end
  end
end
