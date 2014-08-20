class AddTargetValueToActions < ActiveRecord::Migration
  def change
    add_column :actions, :target_value, :string
  end
end
