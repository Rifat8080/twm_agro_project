# filepath: /Users/mdmahadihasanrifat/Desktop/twm_agro_project/db/migrate/20250213131443_change_users_primary_key_to_uuid.rb
class ChangeUsersPrimaryKeyToUuid < ActiveRecord::Migration[8.0]
  def up
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    add_column :users, :uuid, :uuid, default: 'gen_random_uuid()', null: false

    change_table :users do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    execute "ALTER TABLE users ADD PRIMARY KEY (id);"
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end