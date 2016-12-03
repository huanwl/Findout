class AddRelations < ActiveRecord::Migration
  def change
    add_column :options, :level_id, :integer
    add_column :tips, :level_id, :integer
  end
end
