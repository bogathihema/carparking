class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.integer :number
      t.text :seats, array: true, default: []
      t.references :entry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
