class RenameHardwareColumnFromStatusToState < ActiveRecord::Migration
  def change
    rename_column :hardwares, :status, :state
  end
end
