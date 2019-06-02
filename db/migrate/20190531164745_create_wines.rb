class CreateWines < ActiveRecord::Migration[5.1]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :varietal
      t.string :price
      t.string :location_of_origin
      t.integer :year_of_origin
      t.string :image

      t.timestamps
    end
  end
end
