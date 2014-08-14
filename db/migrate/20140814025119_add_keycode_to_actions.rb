class AddKeycodeToActions < ActiveRecord::Migration
  def change
    add_column :actions, :keycode, :integer
  end
end
