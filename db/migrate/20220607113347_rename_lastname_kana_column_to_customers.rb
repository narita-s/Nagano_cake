class RenameLastnameKanaColumnToCustomers < ActiveRecord::Migration[6.1]
  def change
    rename_column :customers, :lastname_kana, :last_name_kana
  end
end
