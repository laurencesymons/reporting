class AddColumnsToDailyDate < ActiveRecord::Migration[6.0]
  def change
    add_column :daily_figures, :timestamp, :string
  end
end
