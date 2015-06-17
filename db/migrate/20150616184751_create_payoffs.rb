class CreatePayoffs < ActiveRecord::Migration
  def change
    create_table :payoffs do |t|
      t.string :name
      t.string :url
      t.string :payoff
      t.belongs_to :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
