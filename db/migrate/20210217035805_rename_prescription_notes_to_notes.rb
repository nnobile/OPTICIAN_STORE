class RenamePrescriptionNotesToNotes < ActiveRecord::Migration[6.1]
  def change
    rename_column :patients, :prescription_notes, :notes
  end
end
