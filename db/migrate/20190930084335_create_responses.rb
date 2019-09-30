class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.integer :pseudonym
      t.string :pstatus
      t.integer :pcredit_points
      t.string :penter_date
      t.string :reg_code
      t.integer :numinv1
      t.integer :numcpl1
      t.integer :numqut1
      t.integer :numscn1
      t.integer :numstr1
      t.integer :numinv2
      t.integer :numcpl2
      t.integer :numqut2
      t.integer :numscn2
      t.integer :numstr2
      t.integer :numinv3
      t.integer :numcpl3
      t.integer :numqut3
      t.integer :numscn3
      t.integer :numstr3
      t.integer :m_age
      t.string :m_panel_membership
      t.string :m_gender_expanded

      t.timestamps
    end
  end
end
