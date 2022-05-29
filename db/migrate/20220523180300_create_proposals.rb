class CreateProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :proposals do |t|
      t.references :proposer, null: false, foreign_key: { to_table: :users}
      t.references :guild, null: false, foreign_key: true
      t.string :status
      t.text :body

      t.timestamps
    end
  end
end
