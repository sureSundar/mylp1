class AddTriggerToRegion < ActiveRecord::Migration
  def change
    add_column :regions, :trigger, :string
  end
end
