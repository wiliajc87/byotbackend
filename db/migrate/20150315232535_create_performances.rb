class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.belongs_to :participant
      t.belongs_to :show
      t.belongs_to :play
      t.string :role

      t.timestamps null: false
    end
  end
end
