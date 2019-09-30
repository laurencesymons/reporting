class AddColumnsToDaily < ActiveRecord::Migration[6.0]
  def change
    add_column :daily_figures, :import_id , :integer
    add_column :daily_figures, :quarter, :integer
    
  end
end
