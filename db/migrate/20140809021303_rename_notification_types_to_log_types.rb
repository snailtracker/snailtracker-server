class RenameNotificationTypesToLogTypes < ActiveRecord::Migration
  def self.up
    rename_table :notification_types, :log_types
  end
  def self.down
    rename_table :log_types, :notification_types
  end
end
