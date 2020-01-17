class AddColumnToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :name, :string, null: false
    add_column :companies, :phone_number, :string, null: false
    add_column :companies, :about, :text, null: false
  end
end
