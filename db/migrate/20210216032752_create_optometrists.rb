class CreateOptometrists < ActiveRecord::Migration[6.1]
  def change
    create_table :optometrists do |t|
      t.string :first_name
      t.string :last_name
      t.string :optometrist_email
      t.string :phone_number
      t.string :address
      t.string :notes

      t.timestamps
    end
  end
end
