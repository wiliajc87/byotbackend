class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.boolean :contact, default: true
      t.string :notes

      t.timestamps null: false
    end
  end
end
