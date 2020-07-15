class ResultMatricesController < ApplicationController

  def index
    @raw_recruitment = RawRecruitment.all
    @monthly_raw_recruitment = get_monthly_raw_recruitment
    @monthly_students = get_monthly_students
    @monthly_youths = get_monthly_youths
    @monthly_graduates = get_monthly_graduates
    @monthly_applicants = get_monthly_applicants
  end

  private

  def get_monthly_raw_recruitment
    @raw_recruitment.monthly
  end

  def get_monthly_students
    @raw_recruitment.students.monthly
  end

  def get_monthly_youths
    @raw_recruitment.youths.monthly
  end

  def get_monthly_applicants
    @raw_recruitment.applicants.monthly
  end

  def get_monthly_graduates
    @raw_recruitment.graduates.monthly
  end
  def ratios(val1, val2)
    if val1.nonzero?.nil? || val2.nonzero?.nil?
      return 0
    end
    val3 = val1.to_f / val2.to_f
    val3 * 100

  end

end
