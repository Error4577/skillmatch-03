class AddColumnToEngineer < ActiveRecord::Migration[5.2]
  def change
    add_column :engineers, :nickname, :string, null: false, default: '', limit: 100
    add_column :engineers, :first_name, :string, null: false
    add_column :engineers, :last_name, :string, null: false
    add_column :engineers, :first_name_kana, :string, null: false
    add_column :engineers, :last_name_kana, :string, null: false
    add_column :engineers, :sex, :integer, null: false, default: 0
    add_column :engineers, :birthday, :date, null: false
    add_column :engineers, :phone_number, :string, null: false
    add_column :engineers, :self_introduction, :text, limit: 500
  end
end
