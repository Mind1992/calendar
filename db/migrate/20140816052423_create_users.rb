class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.column :name, :string
    end
    add_column :events, :user_id, :integer
  end
end
