class AddAppIdToLogs < ActiveRecord::Migration
  def change
    add_reference :logs, :app, index: true
  end
end
