class CreateBookingslots < ActiveRecord::Migration[6.0]
  def change
    create_table :bookingslots do |t|
      t.string :entrance_no
      t.string :registration_no

      t.timestamps
    end
  end
end
