class AddCharToActions < ActiveRecord::Migration
  def change
    add_column :actions, :char, :string
  end
end
