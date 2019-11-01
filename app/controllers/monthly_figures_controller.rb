class MonthlyFiguresController < ApplicationController
  def index
    @monthly_figures = DailyFigure.group_by_month(:timestamp, format: "%B %Y")
  end
end
