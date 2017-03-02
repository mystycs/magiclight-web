class AddStatusAllToLights < ActiveRecord::Migration
  def change
    add_column :lights, :status_all, :boolean, default: false
  end
end
