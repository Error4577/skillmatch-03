class RemoveNicknameFromEngineer < ActiveRecord::Migration[5.2]
  def change
    add_column :engineers, :name, :string, null: false
    remove_column :engineers, :nickname
    remove_column :engineers, :first_name
    remove_column :engineers, :last_name
    remove_column :engineers, :first_name_kana
    remove_column :engineers, :last_name_kana
    change_column_null :engineers, :phone_number, true
  end
end