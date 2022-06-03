class CreateBulletins < ActiveRecord::Migration[6.1]
  def change
    create_table :bulletins do |t|
      t.references :guild, null: false, foreign_key: true, index: true
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.text :body
      t.boolean :priority

      t.timestamps
    end
  end
end
