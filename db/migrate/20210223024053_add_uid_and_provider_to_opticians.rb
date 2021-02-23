class AddUidAndProviderToOpticians < ActiveRecord::Migration[6.1]
  def change
    add_column :opticians, :uid, :string
    add_column :opticians, :provider, :string
  end
end
