class AddColumnTimestamp < ActiveRecord::Migration
  def change
  	change_table :events do |t| 
  		t.timestamps
  	end
  end
end
