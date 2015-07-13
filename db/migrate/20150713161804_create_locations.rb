class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations, id: :uuid do |t|
      t.string :name
      t.text :address
      t.string :url

      t.timestamps null: false
    end
  end
end
