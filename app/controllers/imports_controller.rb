require "roo"
require "time"
require "pry"

class ImportsController < ApplicationController
  def create
    upload_file = params[:import][:file]
    upload_filename = upload_file.original_filename
    upload_path = Rails.root.join("public", "uploads", upload_filename)

    File.open(upload_path, "wb") do |file|
      file.write(upload_file.read)
    end

    @import = Import.create({
                                filename: upload_filename,
                                catagory: params[:import][:catagory],
                                month: params[:import][:month],
                                processedraw: 0,
                                processed: 0,
                            })

    Roo::Excelx.new(upload_path).each_row_streaming(offset: 1) do |row|
      begin

        raw_recruitment = {
            dispcode: row[0].value,
            u_email: row[1].value,
            pstatu_date: row[2].value.to_s,
            penter: Time.parse(row[3].value.to_s).to_s,
            day: Time.parse(row[3].value.to_s).day,
            reg_code: row[4].value,
            m_recruit: row[5].value.to_s,
            m_signup: row[6].value.to_s,
            m_panel_membership: row[7].value.to_s,
            m_gender_expanded: row[8].value.to_s,
            m_age_bands_report: row[9].value.to_s,
            datetime: row[10].value.to_s
        }
        puts(raw_recruitment)
        @import.raw_recruitments.create(raw_recruitment)

      rescue StandardError => e
        puts "ERROR ----- #{e.message}"
          # binding.pry
      end
    end

    @import.update({processedraw: 1})

    create_daily_figures(@import.id)

    redirect_to imports_path
  end

  def show
    @import = Import.find(params[:id])
  end

  def index
    @import = Import.new
    @imports = Import.all
  end

  def destroy
    Import.destroy(params[:id])
    redirect_to imports_path
  end

  private

  def create_daily_figures(import_id)

    quarters = {
        "01" => "1",
        "02" => "1",
        "03" => "1",
        "04" => "2",
        "05" => "2",
        "06" => "2",
        "07" => "3",
        "08" => "3",
        "09" => "3",
        "10" => "4",
        "11" => "4",
        "12" => "4"
    }
    year, month = params[:import][:month].split("-")

    quarter = [year, quarters[month]].join("")

    raw_r01 = RawRecruitment.select(:day, :dispcode).where(["import_id = ?", import_id]).group(:day).count(:dispcode)
    raw_r02 = RawRecruitment.select(:day, :pstatu_date).where(["import_id = ? AND pstatu_date IS NOT null", import_id]).group(:day).count(:pstatu_date)
    raw_recruited = RawRecruitment.select(:day, :datetime).where(["import_id = ? AND datetime IS NOT null", import_id]).group(:day).count(:datetime)

    format_raw(year,month,raw_r01, raw_r02, raw_recruited).each do |timestamp, data|
      r01_Completers, r02_Starters, recruited = data
      r01_Completes_To_R02_Starters_Ratio = ratio(r02_Starters,r01_Completers)
      r02_Starters_To_Recruited_Ratio =  ratio(recruited,r02_Starters)
      r01_Completers_To_Recruited_Ratio = ratio(recruited,r01_Completers)


      daily_figure = {

          :R01_Completers => r01_Completers,
          :R02_Starters => r02_Starters,
          :Recruited => recruited,
          :R01_Completes_To_R02_Starters_Ratio => r01_Completes_To_R02_Starters_Ratio.round(half: :up),
          :R02_Starters_To_Recruited_Ratio => r02_Starters_To_Recruited_Ratio.round(half: :up),
          :R01_Completers_To_Recruited_Ratio => r01_Completers_To_Recruited_Ratio.round(half: :up),
          :quarter => quarter,
          :timestamp => timestamp

      }

      @import.daily_figures.create(daily_figure)
    end
  end



  def format_raw(year, month, raw_r01, raw_r02, raw_recruited)
    raw_r01.default = 0
    raw_r02.default = 0
    raw_recruited.default = 0

    last_day = (Time.new(year, month.to_i + 1) - 1).day

    data = (1..last_day).to_a.reduce(Hash.new) {|hash, day|
      hash[Time.new(year, month, day).strftime("%F")] = [
        raw_r01[day],
        raw_r02[day],
        raw_recruited[day]

      ]

      hash
    }



  end











  def ratio(val1, val2)
    if val1.nonzero?.nil? || val2.nonzero?.nil?
      return 0
    end
    val3 = val1.to_f / val2.to_f
    val3 * 100

  end

end
