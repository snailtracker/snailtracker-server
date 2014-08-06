class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :session, index: true
      t.string :url
      t.references :action_type, index: true
      t.string :selector

      t.timestamps
    end
  end
end
