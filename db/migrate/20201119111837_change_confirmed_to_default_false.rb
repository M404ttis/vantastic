class ChangeConfirmedToDefaultFalse < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :confirmed, :boolean, default: false
  end
end
