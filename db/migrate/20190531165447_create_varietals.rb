class CreateVarietals < ActiveRecord::Migration[5.1]
  def change
    create_table :varietals do |t|
      t.string :grape
      t.integer :wine_id

      t.timestamps
    end
  end
end
