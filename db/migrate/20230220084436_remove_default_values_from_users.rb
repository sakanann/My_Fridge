class RemoveDefaultValuesFromUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :name, nil
    change_column_default :users, :email, nil
    change_column_default :users, :encrypted_password, nil
  end
end
