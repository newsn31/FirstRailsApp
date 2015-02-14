class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2 #redefines the definition of the price to have eight digits of significance and two digits after the decimal point.

      t.timestamps null: false
    end
  end
end
