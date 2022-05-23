class CreateRaiders < ActiveRecord::Migration[6.1]
  def change
    create_table :raiders do |t|
      t.string :serial, unique: true
      t.string :image_url
      t.references :owner, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
