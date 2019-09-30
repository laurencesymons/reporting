class CreateDailyFigures < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_figures do |t|
      t.integer :R01_Completers
      t.integer :R02_Starters
      t.integer :Recruited
      t.integer :R01_Completes_To_R02_Starters_Ratio
      t.integer :R02_Starters_To_Recruited_Ratio
      t.integer :R01_Completers_To_Recruited_Ratio

      t.timestamps
    end
  end
end
