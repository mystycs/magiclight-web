class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :color
    end
  end
end
