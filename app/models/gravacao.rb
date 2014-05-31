# encoding: UTF-8
require 'rubygems'
require 'roo'
require 'iconv'
class Gravacao

def self.atualizar_data
	oo = Roo::Openoffice.new("app/models/planilha/resultado.ods")
	oo.sheet(0)

	puts 'Vai rodar!'

	1.upto(oo.last_row) do |line|
		if !oo.cell(line,'B').blank?	
		  resultado = Resultado.find(oo.cell(line,'A'))	
		  resultado.update_column(:data , oo.cell(line,'B'))  
	    end  
	end
	puts 'Terminou'
end	

# Rotina para gravar os resultados da loteria no banco
 def self.gravar_resultado
		oo = Roo::Openoffice.new("app/models/planilha/resultado.ods")
		#oo = Roo::Excel.new("dados.xls")
		oo.sheet(0)

		puts 'Vai rodar!'

		1.upto(oo.last_row) do |line|
			resultado = Resultado.new

			if !oo.cell(line,'A').blank?

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
		end
		puts 'Terminou'
	end	

# Rotina para gerar a base completa
 def self.gerar_base_completa
	
 t1 = Time.now

	universo_cartao = []
  	
  	for x in 1..25
      universo_cartao << x
  	end	

  	cont = 1

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
                                for o in (n+1)..universo_cartao.size - 1 # 15 
                                   for p in (o+1)..universo_cartao.size - 1 # 16 
                                   	  for q in (p+1)..universo_cartao.size - 1 # 17 
                                   	  	for r in (q+1)..universo_cartao.size - 1 # 18
                                	puts "#{cont}"
                                	cont += 1

     								lotofacil18 = Lotofacil18.new

     								lotofacil18.a = universo_cartao[a] 
									lotofacil18.b = universo_cartao[b] 
									lotofacil18.c = universo_cartao[c]  
									lotofacil18.d = universo_cartao[d]  
									lotofacil18.e = universo_cartao[e] 
									lotofacil18.f = universo_cartao[f] 
									lotofacil18.g = universo_cartao[g] 
									lotofacil18.h = universo_cartao[h] 
									lotofacil18.i = universo_cartao[i] 
									lotofacil18.j = universo_cartao[j] 
									lotofacil18.k = universo_cartao[k] 
									lotofacil18.l = universo_cartao[l] 
									lotofacil18.m = universo_cartao[m] 
									lotofacil18.n = universo_cartao[n] 
									lotofacil18.o = universo_cartao[o] 
									lotofacil18.p = universo_cartao[p] 
									lotofacil18.q = universo_cartao[q] 
									lotofacil18.r = universo_cartao[r]
									lotofacil18.save    	                         
									
										end #r
									  end #q
								   end # p
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
    puts "Tempo: #{(Time.now - t1).round(2)} segundos"
 end

end	