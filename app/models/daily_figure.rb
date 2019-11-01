class DailyFigure < ApplicationRecord
  belongs_to :import

    # 
    # r01Completers = RawRecruitment.select(:Day, :id).where(dispcode:'Invited (12)').or(RawRecruitment.select(:Day,:id).where(dispcode:'E-mail could not be delivered (14)')).group(:Day).count(:id)
    # r02Starters = RawRecruitment.select(:Day, :id).where(dispcode:'Suspended (22)').or(RawRecruitment.select(:Day,:id).where(dispcode: 'Screened out (37)')).group(:Day).count(:id)
    # recruited = RawRecruitment.select(:Day, :id).where(dispcode:'Completed (31)').or(RawRecruitment.select(:Day,:id).where(dispcode: 'Custom completed 1 (33)')).group(:Day).count(:id)
    #
    #
    # def r01_Completers_To_Recruited_Ratio
    #   ratio = recruited / r01Completers * 100
    #   ratio.round(half: :up)
    # end
    #
    # def r02_Starters_To_Recruited_Ratio
    #   ratio = recruited / r02Starters * 100
    #   ratio.round(half: :up)
    # end
    #
    # def r01_Completes_To_R02_Starters_Ratio
    #   ratio = recruited / r02Starters * 100
    #   ratio.round(half: :up)
    # end

end
