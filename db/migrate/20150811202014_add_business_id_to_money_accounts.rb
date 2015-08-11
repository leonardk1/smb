class AddBusinessIdToMoneyAccounts < ActiveRecord::Migration
  def change
    add_column :bank_accounts, :business_id, :integer
    add_column :mobile_money_accounts, :business_id, :integer
  end
end
