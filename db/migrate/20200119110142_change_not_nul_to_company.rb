class ChangeNotNulToCompany < ActiveRecord::Migration[5.2]
  def change
    change_column_null :companies, :phone_number, true
    change_column_null :companies, :about, true
  end
end
