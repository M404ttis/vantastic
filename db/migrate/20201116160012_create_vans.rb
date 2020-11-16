class CreateVans < ActiveRecord::Migration[6.0]
  def change
    create_table :vans do |t|
      t.string :title
      t.string :brand
      t.string :model
      t.string :description
      t.string :photo
      t.integer :price_per_day

      t.timestamps
    end
  end
end
