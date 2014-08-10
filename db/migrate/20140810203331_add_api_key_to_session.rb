class AddApiKeyToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :api_key, :string
  end
end
