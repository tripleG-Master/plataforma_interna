class AddNewColumnToApplications < ActiveRecord::Migration[7.2]
  def change
    add_column :applications, :new, :boolean
  end
end