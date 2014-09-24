class AddAPIIdToTravel < ActiveRecord::Migration
  def change
    add_column :travel, :api_id, :integer
  end
end
