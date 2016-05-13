class CreateWeathermen < ActiveRecord::Migration
  def change
    create_table :weathermen do |t|

      t.timestamps null: false
    end
  end
end
