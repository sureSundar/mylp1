class AddClientIdAndClientSecretToUsers < ActiveRecord::Migration
  def change
    add_column :users, :client_id, :string
    add_column :users, :client_secret, :string
  end
end