class AddUserReferenceToVans < ActiveRecord::Migration[6.0]
  def change
    add_reference :vans, :user, null: false, foreign_key: true
  end
end
