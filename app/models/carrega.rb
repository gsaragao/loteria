# encoding: UTF-8
require 'spreadsheet'

class Carrega

	# Rotina de obter dados da planilha a partir de um nome de arquivo
	def self.obter_dados_planilha(nome)

		Spreadsheet.client_encoding = 'UTF-8'

		retorno = []
		
		book = Spreadsheet.open "app/models/planilha/" + nome 
		sheet1 = book.worksheet 0

		sheet1.each do |row|

			home = Home.new

			home.aa = row[0] 
			home.bb = row[1] 
			home.cc = row[2]  
			home.dd = row[3]  
			home.ee = row[4] 
			home.ff = row[5] 
			home.gg = row[6] 
			home.hh = row[7] 
			home.ii = row[8] 
			home.jj = row[9] 
			home.kk = row[10] 
			home.ll = row[11] 
			home.mm = row[12] 
			home.nn = row[13] 
			home.oo = row[14] 
			home.pp = row[15] if row[15]
			home.qq = row[16] if row[16]
			home.rr = row[17] if row[17]

			retorno << home	
		end

		retorno
	end

	# Rotina de obter dados da planilha a partir de um nome de arquivo
	def self.obter_dados_planilha_java(nome)

		Spreadsheet.client_encoding = 'UTF-8'

		retorno = []

		book = Spreadsheet.open "app/models/planilha/" + nome 
		sheet1 = book.worksheet 0


		sheet1.each do |row|

			home = []

			home[0] = row[0].to_i 
			home[1] = row[1].to_i 
			home[2] = row[2].to_i  
			home[3] = row[3].to_i  
			home[4] = row[4].to_i 
			home[5] = row[5].to_i 
			home[6] = row[6].to_i 
			home[7] = row[7].to_i 
			home[8] = row[8].to_i 
			home[9] = row[9].to_i 
			home[10] = row[10].to_i 
			home[11] = row[11].to_i 
			home[12] = row[12].to_i 
			home[13] = row[13].to_i 
			home[14] = row[14].to_i 
			home[15] = row[15].to_i if row[15]
			home[16] = row[16].to_i if row[16]
			home[17] = row[17].to_i if row[17]

			retorno << home
		end

		retorno
	end


end
