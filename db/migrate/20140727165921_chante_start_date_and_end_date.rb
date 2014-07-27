class ChanteStartDateAndEndDate < ActiveRecord::Migration
  def change
    change_column :travels, :start_date, :date
    change_column :travels, :end_date, :date
  end
end
