# encoding: UTF-8
require 'roo'
require 'java'

import java.util.ArrayList

class Carrega

	# Rotina de obter dados da planilha a partir de um nome de arquivo
	def self.obter_dados_planilha(nome)

		retorno = []
		
		endereco = "app/models/planilha/" + nome

		oo = Roo::Openoffice.new(endereco)
		oo.sheet(0)

		1.upto(oo.last_row) do |line|

			if line > 0

				home = Home.new

				home.aa = oo.cell(line,'A') 
				home.bb = oo.cell(line,'B') 
				home.cc = oo.cell(line,'C')  
				home.dd = oo.cell(line,'D')  
				home.ee = oo.cell(line,'E') 
				home.ff = oo.cell(line,'F') 
				home.gg = oo.cell(line,'G') 
				home.hh = oo.cell(line,'H') 
				home.ii = oo.cell(line,'I') 
				home.jj = oo.cell(line,'J') 
				home.kk = oo.cell(line,'K') 
				home.ll = oo.cell(line,'L') 
				home.mm = oo.cell(line,'M') 
				home.nn = oo.cell(line,'N') 
				home.oo = oo.cell(line,'O') 
				home.pp = oo.cell(line,'P') if oo.cell(line,'P')
				home.qq = oo.cell(line,'Q') if oo.cell(line,'Q')
				home.rr = oo.cell(line,'R') if oo.cell(line,'R')

				retorno << home	
			end	
		end

		retorno
	end

	# Rotina de obter dados da planilha a partir de um nome de arquivo
	def self.obter_dados_planilha_java(nome)

		retorno = []
		#list = ArrayList.new

		endereco = "app/models/planilha/" + nome

		oo = Roo::Openoffice.new(endereco)
		oo.sheet(0)

		1.upto(oo.last_row) do |line|

			if line > 0

				home = []

				home[0] = oo.cell(line,'A').to_i 
				home[1] = oo.cell(line,'B').to_i 
				home[2] = oo.cell(line,'C').to_i  
				home[3] = oo.cell(line,'D').to_i  
				home[4] = oo.cell(line,'E').to_i 
				home[5] = oo.cell(line,'F').to_i 
				home[6] = oo.cell(line,'G').to_i 
				home[7] = oo.cell(line,'H').to_i 
				home[8] = oo.cell(line,'I').to_i 
				home[9] = oo.cell(line,'J').to_i 
				home[10] = oo.cell(line,'K').to_i 
				home[11] = oo.cell(line,'L').to_i 
				home[12] = oo.cell(line,'M').to_i 
				home[13] = oo.cell(line,'N').to_i 
				home[14] = oo.cell(line,'O').to_i 
				home[15] = oo.cell(line,'P').to_i if oo.cell(line,'P')
				home[16] = oo.cell(line,'Q').to_i if oo.cell(line,'Q')
				home[17] = oo.cell(line,'R').to_i if oo.cell(line,'R')

				retorno << home
			end	
		end

		retorno
	end


end
