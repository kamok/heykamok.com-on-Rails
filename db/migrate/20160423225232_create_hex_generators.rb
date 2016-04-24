class CreateHexGenerators < ActiveRecord::Migration
  def change
    create_table :hex_generators do |t|
      t.string   :hexcode
      t.timestamps null: false
    end
  end
end
