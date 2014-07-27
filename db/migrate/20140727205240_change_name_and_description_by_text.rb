class ChangeNameAndDescriptionByText < ActiveRecord::Migration
  def change
    change_column :travels, :name, :text
    change_column :travels, :description, :text
  end
end
