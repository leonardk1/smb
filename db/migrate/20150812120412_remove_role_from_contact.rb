class RemoveRoleFromContact < ActiveRecord::Migration
  def change
    remove_column :contacts, :role, :string
  end
end
