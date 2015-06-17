class CreateHpusers < ActiveRecord::Migration
  def change
    create_table :hpusers do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :client_id
      t.string :client_secret

      t.timestamps null: false
    end
  end
end
