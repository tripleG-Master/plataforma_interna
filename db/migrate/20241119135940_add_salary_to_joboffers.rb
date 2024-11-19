class AddSalaryToJoboffers < ActiveRecord::Migration[7.2]
  def change
    add_column :joboffers, :salary, :string
  end
end
