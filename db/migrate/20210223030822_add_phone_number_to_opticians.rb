class AddPhoneNumberToOpticians < ActiveRecord::Migration[6.1]
  def change
    add_column :opticians, :phone_number, :string
  end
end
