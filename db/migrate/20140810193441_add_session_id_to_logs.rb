class AddSessionIdToLogs < ActiveRecord::Migration
  def change
    add_reference :logs, :session, index: true
  end
end
