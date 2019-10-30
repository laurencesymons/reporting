class RawRecruitment < ApplicationRecord
  belongs_to :import

  scope :graduates, -> {where(m_panel_membership: 'Graduate').order(datetime: :asc)}
  scope :students, -> {where(m_panel_membership: 'Student').order(datetime: :asc)}
  scope :youths, -> {where(m_panel_membership: 'Youth').order(datetime: :asc)}
  scope :applicants, -> {where(m_panel_membership: 'Applicant').order(datetime: :asc)}
  scope :monthly, -> {where.not(datetime: ['0000-00-00 00:00:00', nil, '']).group_by {|row| row.datetime.to_datetime.strftime("%B %Y")}}
  scope :organic, -> {where(reg_code: ['Join page', 'Home page'])}
  scope :ucas, -> {where(reg_code: ['UCAS'])}
  scope :money_magpie, -> {where(reg_code: ['Money Magpie'])}
  scope :save_the_student, -> {where(reg_code: ['Save The Student'])}
  scope :facebook, -> {where(reg_code: ['Facebook promoted posts'])}
  scope :with_valid_dates, -> {where.not(datetime: ['0000-00-00 00:00:00', nil, ''])}

  def organic?
    ['Join page', 'Home page'].include?(reg_code)
  end

  def ucas?
    ['UCAS'].include?(reg_code)
  end

  def money_magpie?
    ['Money Magpie'].include?(reg_code)
  end

  def save_the_student?
    ['Save The Student'].include?(reg_code)
  end

  def facebook?
    ['Facebook promoted posts'].include?(reg_code)
  end
end
