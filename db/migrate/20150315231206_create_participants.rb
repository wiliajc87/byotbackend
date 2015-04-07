class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :photo_url
      t.boolean :override
      t.boolean :contact, default: true
      t.text :notes

      t.timestamps null: false
    end
  end
end
