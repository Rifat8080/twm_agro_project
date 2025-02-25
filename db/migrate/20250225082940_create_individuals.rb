class CreateIndividuals < ActiveRecord::Migration[8.0]
  def change
    create_table :individuals, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :full_name, null: false
      t.timestamps
    end
  end
end
