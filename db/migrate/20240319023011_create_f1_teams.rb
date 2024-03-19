class CreateF1Teams < ActiveRecord::Migration[7.1]
  def change
    create_table :f1_teams do |t|
      t.string :name
      t.integer :horsepower
      t.boolean :slick_tires

      t.timestamps
    end
  end
end
