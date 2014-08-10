class RemoveAppIdFromActions < ActiveRecord::Migration
  def up
    remove_column :actions, :app_id
  end
  def down
    add_reference :actions, :app, index: true
  end
end
