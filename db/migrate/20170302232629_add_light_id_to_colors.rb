class AddLightIdToColors < ActiveRecord::Migration
  def change
    add_column :colors, :light_id, :integer
  end
end
