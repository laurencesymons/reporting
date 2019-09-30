require "roo"
require "time"
require "pry"


class ImportResponsesController < ApplicationController
  def create
    upload_file = params[:import_response][:file]
    upload_filename = upload_file.original_filename.gsub!(" ", "_")
    upload_path = Rails.root.join("public", "uploads", upload_filename)

    File.open(upload_path, "wb") do |file|
      file.write(upload_file.read)
    end


    @import_res = Import_response.create({
      filename: upload_filename,
      catagory: params[:import_response][:catagory],
      month: params[:import_response][:month],
      processedraw: 0,
      processed: 0,
      })

      Roo:Excelx.new(upload_path).each_row_streaming(offset: 1) do |row|
        begin

        raw_response = {

        pseudonym: row[0].value.to_s,
        pstatus: row[1].value.to_s,
        pcredit_points: row[2].value.to_s,
        penter_date: Time.parse(row[3].value.to_s).to_s,
        day: Time.parse(row[3].value.to_s).day,
        reg_code: row[4].value,
        numinv1: row[5].value.to_s,
        numcpl1: row[6].value.to_s,
        numqut1: row[7].value.to_s,
        numscn1: row[8].value.to_s,
        numstr1: row[9].value.to_s,
        numinv2: row[10].value.to_s,
        numcpl2: row[11].value.to_s,
        numqut2: row[12].value.to_s,
        numscn2: row[13].value.to_s,
        numstr2: row[14].value.to_s,
        numinv3: row[15].value.to_s,
        numcpl3: row[16].value.to_s,
        numqut3: row[17].value.to_s,
        numscn3: row[18].value.to_s,
        numstr3: row[19].value.to_s,
        m_age: row[20].value.to_s,
        m_panel_membership: row[21].value.to_s,
        m_gender_expanded: row[22].value,

          }

          @import_res.responses.create(raw_response)

        rescue
          puts "ERROR"
          binding.pry
        end
      end

      @import_res.update({processedraw: 1})

      #create_daily_figures(@import_res.id)

    #  redirect_to imports_path



  end

  def show
    @import = Import_response.find(params[:id])
  end

  def index
    @import = Import.new
    @imports = Import.all

  end

  def destroy
    Import_response.destroy(params[:id])
    redirect_to imports_path
  end

  private



end
