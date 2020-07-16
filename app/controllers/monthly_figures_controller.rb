class MonthlyFiguresController < ApplicationController
  def index
    @monthly_figures = DailyFigure.group_by_month(:timestamp, format: "%B %Y")
    @quarter_figures = DailyFigure.group_by_quarter(:timestamp, format: "Q%-m %Y")
  end
end
