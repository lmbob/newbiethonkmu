class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.text :content
      t.string :map
      t.string :month
      t.string :ampm
      t.integer :time
      t.string :avatar
      
      t.timestamps null: false
    end
  end
end
