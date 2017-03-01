class CreateLights < ActiveRecord::Migration
  def change
    create_table :lights do |t|
      t.string :ip_address
      t.timestamps null: false
    end
  end
end
