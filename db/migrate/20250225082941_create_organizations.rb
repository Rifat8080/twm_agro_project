class CreateOrganizations < ActiveRecord::Migration[8.0]
  def change
    create_table :organizations, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :organization_name, null: false
      t.timestamps
    end
  end
end
