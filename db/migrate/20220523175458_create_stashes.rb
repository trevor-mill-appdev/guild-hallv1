class CreateStashes < ActiveRecord::Migration[6.1]
  def change
    create_table :stashes do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }, index: true
      t.references :material, null: false, foreign_key: { to_table: :materials }
      t.integer :quantity

      t.timestamps
    end
  end
end
