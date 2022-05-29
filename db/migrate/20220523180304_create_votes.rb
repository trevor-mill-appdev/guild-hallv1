class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :voter, null: false, foreign_key: { to_table: :users }, index: true
      t.references :proposal, null: false, foreign_key: true, index: true
      t.string :value

      t.timestamps
    end
  end
end
