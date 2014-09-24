class AddAPIIdToTravel < ActiveRecord::Migration
  def change
    add_column :travels, :api_id, :integer
  end
end
