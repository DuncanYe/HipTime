class ChangeCompletedAtColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :cpmpleted_at 
  end
end
