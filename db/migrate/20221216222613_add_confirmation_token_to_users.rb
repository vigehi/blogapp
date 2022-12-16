class AddConfirmationTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :confirmation_token, :string
  end
  add_index :users, :confirmation_token, unique: true

end
