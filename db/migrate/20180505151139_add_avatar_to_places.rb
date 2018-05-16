class AddAvatarToPlaces < ActiveRecord::Migration
  def change
    add_column :place, :avatar, :string
  end
end
