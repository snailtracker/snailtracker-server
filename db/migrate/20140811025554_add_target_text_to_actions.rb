class AddTargetTextToActions < ActiveRecord::Migration
  def change
    add_column :actions, :target_text, :string
  end
end
