class AddTotalRevenueToPatients < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :total_revenue, :float
  end
end
