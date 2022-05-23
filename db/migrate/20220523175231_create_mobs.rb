class CreateMobs < ActiveRecord::Migration[6.1]
  def change
    create_table :mobs do |t|
      t.references :owner, null: false, foreign_key: { to_table: :users }, index: true
      t.string :serial
      t.string :image_url

      t.timestamps
    end
  end
end
