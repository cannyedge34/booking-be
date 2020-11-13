class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :description
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.belongs_to :space, null: false, foreign_key: true
      t.timestamps
    end
  end
end
