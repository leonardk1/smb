class AddRoleIdToContact < ActiveRecord::Migration
  def change
    add_reference :contacts, :role, index: true, foreign_key: true
  end
end
