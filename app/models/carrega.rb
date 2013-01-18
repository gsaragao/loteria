# encoding: UTF-8
require 'roo'
require 'iconv'
class Carrega

# Rotina para gravar os resultados da loteria no banco
def gravar_resultado

		oo = Openoffice.new("app/models/planilha/resultado.ods")
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

	# Rotina de obter dados da planilha a partir de um nome de arquivo
	def self.obter_dados_planilha(nome)

		retorno = []

		endereco = "app/models/planilha/" + nome

		oo = Openoffice.new(endereco)
		#oo = Excel.new(endereco)
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

	# Rotina para transformar o universo de jogos
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

		universo_cartao[10] = home.kk if !home.kk.blank?
		universo_cartao[11] = home.ll if !home.ll.blank?
		universo_cartao[12] = home.mm if !home.mm.blank?
		universo_cartao[13] = home.nn if !home.nn.blank?
		universo_cartao[14] = home.oo if !home.oo.blank?
		universo_cartao[15] = home.pp if !home.pp.blank?
		universo_cartao[16] = home.qq if !home.qq.blank?
		universo_cartao[17] = home.rr if !home.rr.blank?

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

# Rotina para gerar a base completa
def self.gerar_base_completa
	
	universo_cartao = []
  	
  	for x in 1..25
      universo_cartao << x
  	end	

	 for a in 0..universo_cartao.size - 1
	   for b in (a+1)..universo_cartao.size - 1
        for c in (b+1)..universo_cartao.size - 1
          for d in (c+1)..universo_cartao.size - 1
            for e in (d+1)..universo_cartao.size - 1
              for f in (e+1)..universo_cartao.size - 1
                for g in (f+1)..universo_cartao.size - 1
                  for h in (g+1)..universo_cartao.size - 1
                    for i in (h+1)..universo_cartao.size - 1
                      for j in (i+1)..universo_cartao.size - 1
                        for k in (j+1)..universo_cartao.size - 1
                          for l in (k+1)..universo_cartao.size - 1
                            for m in (l+1)..universo_cartao.size - 1
                              for n in (m+1)..universo_cartao.size - 1
                                for o in (n+1)..universo_cartao.size - 1

     								lotofacil = Lotofacil.new

     								lotofacil.a = universo_cartao[a] 
									lotofacil.b = universo_cartao[b] 
									lotofacil.c = universo_cartao[c]  
									lotofacil.d = universo_cartao[d]  
									lotofacil.e = universo_cartao[e] 
									lotofacil.f = universo_cartao[f] 
									lotofacil.g = universo_cartao[g] 
									lotofacil.h = universo_cartao[h] 
									lotofacil.i = universo_cartao[i] 
									lotofacil.j = universo_cartao[j] 
									lotofacil.k = universo_cartao[k] 
									lotofacil.l = universo_cartao[l] 
									lotofacil.m = universo_cartao[m] 
									lotofacil.n = universo_cartao[n] 
									lotofacil.o = universo_cartao[o] 
									lotofacil.save    	                         

                                end
                              end  
                            end
                          end
                        end 
                      end       
                    end
                  end  
                end
              end
            end 
          end       
        end
      end  
    end

end


end
