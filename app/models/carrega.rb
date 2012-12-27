# encoding: UTF-8
require 'roo'
require 'iconv'
class Carrega

def rodar

		oo = Openoffice.new("app/models/resultado.ods")
		#oo = Excel.new("dados.xls")
		oo.default_sheet = oo.sheets.first

		puts 'Vai rodar!'
		puts oo.last_row

		oo.last_row.times do |line|
			resultado = Resultado.new

			resultado.concurso = oo.cell(line,'A')
			resultado.data = oo.cell(line,'B')  
			resultado.a = oo.cell(line,'C') 
			resultado.b = oo.cell(line,'D') 
			resultado.c = oo.cell(line,'E')  
			resultado.d = oo.cell(line,'F')  
			resultado.e = oo.cell(line,'G') 
			resultado.f = oo.cell(line,'H') 
			resultado.g = oo.cell(line,'I') 
			resultado.h = oo.cell(line,'J') 
			resultado.i = oo.cell(line,'K') 
			resultado.j = oo.cell(line,'L') 
			resultado.k = oo.cell(line,'M') 
			resultado.l = oo.cell(line,'N') 
			resultado.m = oo.cell(line,'O') 
			resultado.n = oo.cell(line,'P') 
			resultado.o = oo.cell(line,'Q') 
			resultado.rateio_15 = oo.cell(line,'R') 
			resultado.rateio_14 = oo.cell(line,'S') 
			resultado.save
		end

		puts 'Terminou'

	end	

	def self.confere(nome)

		retorno = []

		endereco = "app/models/" + nome

		oo = Openoffice.new(endereco)
		#oo = Excel.new("dados.xls")
		oo.default_sheet = oo.sheets.first

		linhas = oo.last_row + 1
		linhas.times do |line|

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

end
