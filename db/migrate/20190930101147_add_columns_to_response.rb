class AddColumnsToResponse < ActiveRecord::Migration[6.0]
  def change
    add_column :responses , :import_id, :integer
  end
end
