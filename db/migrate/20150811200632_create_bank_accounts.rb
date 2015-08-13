class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.string :name
      t.string :number
      t.string :kind
      t.string :location

      t.timestamps null: false
    end
  end
end
