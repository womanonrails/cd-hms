class CreateHardwares < ActiveRecord::Migration
  def change
    create_table :hardwares, id: :uuid do |t|
      t.string :name
      t.float :length
      t.float :width
      t.float :height
      t.float :weight
      t.string :serial_number
      t.float :price
      t.integer :status
      t.date :warranty_expired_on

      t.timestamps null: false
    end
  end
end
