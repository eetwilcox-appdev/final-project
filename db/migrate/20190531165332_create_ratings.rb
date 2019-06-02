class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :wine_id
      t.integer :user_id
      t.float :score
      t.text :comment

      t.timestamps
    end
  end
end
