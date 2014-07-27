class CreatePriceComparations < ActiveRecord::Migration
  def change
    create_table :price_comparations do |t|
      t.string :name
      t.decimal :unit_cost, :precision => 10, :scale => 2
      t.string :source_information
      t.string :category
      t.string :description
      t.timestamps
    end
  end
end
