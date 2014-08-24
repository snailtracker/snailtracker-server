class CreateErrors < ActiveRecord::Migration
  def change
    create_table :errors do |t|
      t.string :exception_class
      t.string :message

      t.timestamps
    end
  end
end
