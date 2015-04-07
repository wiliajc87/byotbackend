class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.belongs_to :show
      t.string :title
      t.text :notes

      t.timestamps null: false
    end
  end
end
