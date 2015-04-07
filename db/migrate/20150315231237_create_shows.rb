class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :month
      t.string :year
      t.integer :audience_count
      t.text :notes

      t.timestamps null: false
    end
  end
end
