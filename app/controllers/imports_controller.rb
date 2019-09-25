require "roo"
require "time"

class ImportsController < ApplicationController
  def create
    upload_file = params[:import][:file]
    upload_filename = upload_file.original_filename.gsub!(" ", "_")
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
      raw_recruitment = {
        dispcode: row[0].value,
        u_email: row[1].value,
        pstatu_date: Time.parse(row[2].value.to_s).to_s,
        penter: Time.parse(row[3].value.to_s).to_s,
        reg_code: row[4].value,
        m_recruit: row[5].value.to_s,
        m_signup: row[6].value.to_s,
        m_panel_membership: row[7].value.to_s,
        m_gender_expanded: row[8].value.to_s,
        m_age_bands_report: row[9].value,
        datetime: Time.parse(row[10].value.to_s).to_s,
      }
      @import.raw_recruitments.create(raw_recruitment)
    end

    @import.update({ processedraw: 1 })
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
end
