class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :log_type, index: true
      t.text :message

      t.timestamps
    end
  end
end
