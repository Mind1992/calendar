class DeleteTimestamps < ActiveRecord::Migration
  def change
  	remove_column :events, :created_at, :datetime
  	remove_column :events, :updated_at, :datetime
  end
end
