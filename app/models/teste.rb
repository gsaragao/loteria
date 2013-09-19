# encoding: UTF-8
require 'spreadsheet'
class Teste

	def self.ab
		
		begin
			endereco = "app/models/planilha/8pra3.xls" 
			#File.delete(endereco) if File.exist?(endereco)
		rescue Errno::ENOENT => e
			puts "-----------------------------------------------------------"
			puts "Error: #{e.message}"
			puts "-----------------------------------------------------------"
		end	
		
			@planilha = Spreadsheet::Workbook.new
			@sheet = @planilha.create_worksheet :name => 'Jogos'
			format = Spreadsheet::Format.new  :number_format => '00'
			@sheet.add_format format

		arr = []
		arr[0] = 1
		arr[1] = "2"
		arr[2] = "3"
		arr[3] = "10"
		arr[4] = "15"

		arr1 = []
		arr1[0] = "2"
		arr1[1] = "4"
		arr1[2] = "6"
		arr1[3] = "20"
		arr1[4] = "30"

  		@sheet.insert_row(0, arr)
  		@sheet.insert_row(1, arr1)

  		row = @sheet.row(0)
  		row.set_format(0, format)

		#4.times do |x| sheet1.row(x + 1).set_format(0, bold) end

  	@planilha.write "app/models/planilha/aaaa.xls"

	end


end	