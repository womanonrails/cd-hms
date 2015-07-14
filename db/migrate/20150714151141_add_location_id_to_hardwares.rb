class AddLocationIdToHardwares < ActiveRecord::Migration
  def change
    add_column :hardwares, :location_id, :uuid, index: :true
  end
end
