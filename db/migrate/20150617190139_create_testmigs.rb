class CreateTestmigs < ActiveRecord::Migration
  def change
    create_table :testmigs do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
