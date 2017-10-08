class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :room, foreign_key: true, null: false
      t.belongs_to :user, foreign_key: true, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
