class CreateF1Drivers < ActiveRecord::Migration[7.1]
  def change
    create_table :f1_drivers do |t|
      t.string :name
      t.integer :weight
      t.boolean :world_champion
      t.references :f1_team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
