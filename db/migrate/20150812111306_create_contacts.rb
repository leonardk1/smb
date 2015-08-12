class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :mobile
      t.string :role

      t.timestamps null: false
    end
  end
end
