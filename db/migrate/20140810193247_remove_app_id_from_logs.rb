class RemoveAppIdFromLogs < ActiveRecord::Migration
  def up
    remove_column :actions, :app_id
  end
  def down
    add_reference :logs, :app, index: true
  end
end
