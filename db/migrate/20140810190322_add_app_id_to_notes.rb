class AddAppIdToNotes < ActiveRecord::Migration
  def change
    add_reference :notes, :app, index: true
  end
end
