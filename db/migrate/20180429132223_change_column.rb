class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :completed_at 
    add_column :items, :completed_at, :datetime
  end
end
