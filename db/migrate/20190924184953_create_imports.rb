class CreateImports < ActiveRecord::Migration[6.0]
  def change
    create_table :imports do |t|
      t.string :filename
      t.string :month
      t.string :catagory
      t.integer :processedraw
      t.integer :processed

      t.timestamps
    end
  end
end
