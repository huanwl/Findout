class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name
      t.string :description
      t.string :image_path
      t.integer :degree

      t.timestamps null: false
    end
  end
end
