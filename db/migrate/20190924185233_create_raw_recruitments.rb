class CreateRawRecruitments < ActiveRecord::Migration[6.0]
  def change
    create_table :raw_recruitments do |t|
      t.integer :import_id
      t.string :dispcode
      t.string :u_email
      t.string :pstatu_date
      t.string :penter
      t.integer :day
      t.string :reg_code
      t.string :m_recruit
      t.string :m_signup
      t.string :m_panel_membership
      t.string :m_gender_expanded
      t.string :m_age_bands_report
      t.string :datetime

      t.timestamps
    end
  end
end
