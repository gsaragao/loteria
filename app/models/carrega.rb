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

	def self.transformar(home)
		
		retorno = []

		universo_cartao = []
  	
	  	universo_cartao[0] = home.aa if !home.aa.blank?
		universo_cartao[1] = home.bb if !home.bb.blank?
		universo_cartao[2] = home.cc if !home.cc.blank?
		universo_cartao[3] = home.dd if !home.dd.blank?
		universo_cartao[4] = home.ee if !home.ee.blank?
		universo_cartao[5] = home.ff if !home.ff.blank?
		universo_cartao[6] = home.gg if !home.gg.blank?
		universo_cartao[7] = home.hh if !home.hh.blank?
		universo_cartao[8] = home.ii if !home.ii.blank?
		universo_cartao[9] = home.jj if !home.jj.blank?

		for a in 0..universo_cartao.size - 1
		 for b in (a+1)..universo_cartao.size - 1

		 	if home.qtde_dezenas.to_i > 2
	          for c in (b+1)..universo_cartao.size - 1

	          	if home.qtde_dezenas.to_i > 3
		           for d in (c+1)..universo_cartao.size - 1

		           	if home.qtde_dezenas.to_i > 4

			            for e in (d+1)..universo_cartao.size - 1
			            	if home.qtde_dezenas.to_i > 5
			             		for f in (e+1)..universo_cartao.size - 1
			             			if home.qtde_dezenas.to_i > 6
					             		for g in (f+1)..universo_cartao.size - 1
					             			retorno << "#{universo_cartao[a]} - #{universo_cartao[b]} - #{universo_cartao[c]} - #{universo_cartao[d]} - #{universo_cartao[e]} - #{universo_cartao[f]} - #{universo_cartao[g]}"	
		 						 		end #for g	
		 						 	else
	    								retorno << "#{universo_cartao[a]} - #{universo_cartao[b]} - #{universo_cartao[c]} - #{universo_cartao[d]} - #{universo_cartao[e]} - #{universo_cartao[f]}"	
		 						 	end #if 6
 						 		end #for f	
 						 	else
	    						retorno << "#{universo_cartao[a]} - #{universo_cartao[b]} - #{universo_cartao[c]} - #{universo_cartao[d]} - #{universo_cartao[e]}"	
 						 	end #if 5	
		    	     	end #for e
		    	    else
	    				retorno << "#{universo_cartao[a]} - #{universo_cartao[b]} - #{universo_cartao[c]} - #{universo_cartao[d]}"  	
		    	    end #if 4 	

		    	   end #for d
		    	else
	    			retorno << "#{universo_cartao[a]} - #{universo_cartao[b]} - #{universo_cartao[c]}" 
		    	end #if 3   

	    	  end #for c
	    	else
	    		retorno << "#{universo_cartao[a]} - #{universo_cartao[b]}" 
	    	end #if 2  

    	 end #for b
    	end #for a
    	retorno
	end


end
