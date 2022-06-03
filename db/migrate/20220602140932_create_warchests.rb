class CreateWarchests < ActiveRecord::Migration[6.1]
  def change
    create_table :warchests do |t|
      t.references :guild, null: false, foreign_key: true, index: true
      t.references :material, null: false, foreign_key: { to_table: :materials }
      t.integer :quantity

      t.timestamps
    end
  end
end
