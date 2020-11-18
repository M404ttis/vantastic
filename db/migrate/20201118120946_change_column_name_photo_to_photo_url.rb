class ChangeColumnNamePhotoToPhotoUrl < ActiveRecord::Migration[6.0]
  def change
    rename_column :vans, :photo, :photo_url
  end
end
