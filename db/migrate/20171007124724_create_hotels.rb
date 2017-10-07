class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.integer :room_count, null: false
      t.integer :free_room_count, null: false

      t.timestamps
    end
  end
end
