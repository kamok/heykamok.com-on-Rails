class CreateReadingLists < ActiveRecord::Migration
  def change
    create_table :reading_lists do |t|
      t.string :title
      t.string :body

      t.timestamps null: false
    end
  end
end
