class AddAppIdToActions < ActiveRecord::Migration
  def change
    add_reference :actions, :app, index: true
  end
end
