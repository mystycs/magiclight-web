class RemoveStatusAllToLights < ActiveRecord::Migration
  def change
    remove_column :lights, :status_all, :boolean
  end
end
