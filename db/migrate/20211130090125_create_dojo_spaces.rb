class CreateDojoSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :dojo_spaces do |t|
      t.string :name
      t.integer :price
      t.text :location
      t.string :martial_art
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
