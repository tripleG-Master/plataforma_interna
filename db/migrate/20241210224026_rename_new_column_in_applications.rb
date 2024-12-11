class RenameNewColumnInApplications < ActiveRecord::Migration[7.2]
  def change
    rename_column :applications, :new, :status_new
  end
end
