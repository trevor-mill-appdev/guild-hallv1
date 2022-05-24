class CreateGuilds < ActiveRecord::Migration[6.1]
  def change
    create_table :guilds do |t|
      t.references :admin, foreign_key: { to_table: :users }
      t.integer :prop_threshold
      t.boolean :private
      t.string :name

      t.timestamps
    end
  end
end
