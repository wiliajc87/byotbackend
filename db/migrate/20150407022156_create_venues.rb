class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.belongs_to :show
      t.string :contact_name
      t.integer :phone
      t.text :address
      t.text :cost
      t.text :notes
      t.timestamps null: false
    end
  end
end
