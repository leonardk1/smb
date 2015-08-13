class CreateMobileMoneyAccounts < ActiveRecord::Migration
  def change
    create_table :mobile_money_accounts do |t|
      t.string :number
      t.string :name

      t.timestamps null: false
    end
  end
end
