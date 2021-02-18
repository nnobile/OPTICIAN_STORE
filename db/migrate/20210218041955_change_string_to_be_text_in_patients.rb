class ChangeStringToBeTextInPatients < ActiveRecord::Migration[6.1]
  def change
    change_column :patients, :notes, :text
  end
end
