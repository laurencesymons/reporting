class CreateImportResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :import_responses do |t|
      t.string :filename
      t.string :month
      t.string :catagory
      t.integer :processedraw
      t.integer :processed

      t.timestamps
    end
  end
end
