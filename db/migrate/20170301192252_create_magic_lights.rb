class CreateMagicLights < ActiveRecord::Migration
  def change
    create_table :magic_lights do |t|
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
