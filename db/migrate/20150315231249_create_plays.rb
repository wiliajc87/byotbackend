class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.string :title
      t.belongs_to :show

      t.timestamps null: false
    end
  end
end
