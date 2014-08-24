class AddSessionIdToErrors < ActiveRecord::Migration
  def change
    add_reference :errors, :session, index: true
  end
end
