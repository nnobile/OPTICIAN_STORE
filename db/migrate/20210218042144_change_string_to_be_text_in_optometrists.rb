class ChangeStringToBeTextInOptometrists < ActiveRecord::Migration[6.1]
  def change
    change_column :optometrists, :notes, :text
  end
end
