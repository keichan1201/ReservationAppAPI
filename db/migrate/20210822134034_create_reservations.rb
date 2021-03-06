class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :space, index: true, foreign_key: true
      t.integer :numbers
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.timestamps
    end
  end
end
