class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :name
      t.string :image_path
      t.boolean :is_answer

      t.timestamps null: false
    end
  end
end
