class AddSlotnoToBookingslots < ActiveRecord::Migration[6.0]
  def change
    add_column :bookingslots, :slotno, :integer
  end
end
