class RemoveTimeColumnsAndSwitchDateToDatetime < ActiveRecord::Migration
  def change
  	remove_column :events, :start_time, :time
  	remove_column :events, :end_time, :time 
  	rename_column :events, :start_date, :start_datetime
  	rename_column :events, :end_date, :end_datetime
  	change_column :events, :start_datetime, :datetime
  	change_column :events, :end_datetime, :datetime
  end
end
