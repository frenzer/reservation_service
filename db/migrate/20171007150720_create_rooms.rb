class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.belongs_to :hotel, foreign_key: true
      t.integer :room_number, null: false
      t.boolean :reserved, null: false, default: false

      t.timestamps
    end
  end
end
