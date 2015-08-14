class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :customer_id
      t.integer :service_provider_id

      t.timestamps null: false
    end
    add_index :relationships, :customer_id
    add_index :relationships, :service_provider_id
    add_index :relationships, [:customer_id, :service_provider_id], unique: true
  end
end
