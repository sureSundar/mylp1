class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.integer :top_left_x
      t.integer :top_left_y
      t.integer :width
      t.integer :height
      t.string :original
      t.string :watermark
      t.integer :watermark_strength
      t.integer :watermark_resolution
      t.string :link
      t.belongs_to :image, index: true, foreign_key: true
      t.belongs_to :payoff, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
