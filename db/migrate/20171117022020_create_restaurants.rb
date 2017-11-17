class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      # restaurant table 欄位名稱&屬性
      t.string :name
      t.string :tel
      t.string :address
      t.string :opening_hours
      t.text :description
      t.timestamps
    end
  end
end
