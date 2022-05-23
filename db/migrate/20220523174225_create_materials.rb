class CreateMaterials < ActiveRecord::Migration[6.1]
  def change

    enable_extension('citext')

    create_table :materials do |t|
      t.citext :name, unique: true
      t.citext :token_address, unique: true

      t.timestamps
    end
  end
end
