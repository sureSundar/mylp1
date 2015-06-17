class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :user
      t.string :logo
      t.belongs_to :hpuser, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
