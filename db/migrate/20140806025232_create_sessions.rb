class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :app, index: true
      t.integer :user_id
      t.string :user_name
      t.string :email
      t.string :browser

      t.timestamps
    end
  end
end
