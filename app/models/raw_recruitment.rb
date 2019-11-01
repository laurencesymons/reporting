class RawRecruitment < ApplicationRecord
  belongs_to :import
  scope :organic, -> {where(reg_code: ['Join page', 'Home page'])}
  scope :ucas, -> {where(reg_code: ['UCAS'])}
  scope :money_magpie, -> {where(reg_code: ['Money Magpie'])}
  scope :save_the_student, -> {where(reg_code: ['Save The Student'])}
  scope :facebook, -> {where(reg_code: ['Facebook promoted posts'])}
  scope :monthly, -> {includes(:import).order('imports.month').group_by(&:import)}
  scope :students, -> {where(m_panel_membership: 'Student')}
  scope :graduates, -> {where(m_panel_membership: 'Graduate')}
  scope :youths, -> {where(m_panel_membership: 'Youth')}
  scope :applicants, -> {where(m_panel_membership: 'Applicant')}

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
