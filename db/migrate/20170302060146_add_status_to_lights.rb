class AddStatusToLights < ActiveRecord::Migration
  def change
    add_column :lights, :status, :boolean, default: false
  end
end
