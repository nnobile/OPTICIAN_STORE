class AddOpticianIdToPatients < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :optician_id, :integer
  end
end
