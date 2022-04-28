class AddEntryAtToBookingslots < ActiveRecord::Migration[6.0]
  def change
    add_column :bookingslots, :entry_at, :date
  end
end
