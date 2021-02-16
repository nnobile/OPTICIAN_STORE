class AddCertificateNumberToOpticians < ActiveRecord::Migration[6.1]
  def change
    add_column :opticians, :certificate_number, :integer
  end
end
