class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :place do |t|
      t.string :title
      t.text :content
      t.string :map
      t.string :month
      t.string :ampm
      t.integer :time
      
      t.timestamps null: false
    end
  end
end
