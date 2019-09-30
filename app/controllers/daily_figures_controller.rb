class DailyFiguresController < ApplicationController


  def index
    @import = Import.find(params[:import_id])
  end

  def show

  end

  def create

  end



end
