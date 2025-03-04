class CreateStaffs < ActiveRecord::Migration[8.0]
  def change
    create_table :staffs, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.uuid :organization_id, null: false
      t.string :roles, array: true, default: [] # Allows multiple roles
      
      t.timestamps
    end

    add_index :staffs, [:user_id, :organization_id], unique: true
    add_foreign_key :staffs, :users
    add_foreign_key :staffs, :organizations
  end
end
