# encoding: UTF-8
class Resultado < ActiveRecord::Base
  attr_accessible :concurso, :data, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :rateio_15, :rateio_14

  # Rotina que verifica os pontos ganhos na aposta
  def self.verificar(lista, home, arr_resultados = nil)

  	resultado = {}
  	resultado[:concurso11] = []
  	resultado[:concurso12] = []
  	resultado[:concurso13] = []
  	resultado[:concurso14] = []
  	resultado[:concurso15] = []
		resultado[:pontos_8] = 0
		resultado[:pontos_9] = 0
		resultado[:pontos_10] = 0
		resultado[:pontos_11] = 0
		resultado[:pontos_12] = 0
		resultado[:pontos_13] = 0
		resultado[:pontos_14] = 0
		resultado[:pontos_15] = 0
		resultado[:total_11] = 0
		resultado[:total_12] = 0
		resultado[:total_13] = 0
		resultado[:total_14] = 0
		resultado[:total_15] = 0
		resultado[:total] = 0
		resultado[:final] = 0
		resultado[:despesa] = 0
  		cont_cartao = 1
		resultados = []

	    if home.tipo_concurso == 'T'
	    	resultados = Resultado.all 	
	    elsif home.tipo_concurso == 'C'

	    	if home.operador == '=' && home.concursos
	    		resultados = Resultado.where('concurso = ?', home.concursos)
	    	elsif home.operador == '>' && home.concursos
	    		resultados = Resultado.where('resultados.concurso > ?', home.concursos)
	    	elsif home.operador == '<' && home.concursos
	    		resultados = Resultado.where('resultados.concurso < ?', home.concursos)	
	    	elsif home.operador == ':' && home.concursos
					
	    		num1 = home.concursos.split(":")[0]
	    		num2 = home.concursos.split(":")[1]

	    		resultados = Resultado.where(:concurso => num1..num2)
	    	elsif home.operador == ',' && home.concursos
	    		resultados = Resultado.where('concurso in (?)', home.concursos.split(","))	
	    	end			

	    elsif home.tipo_concurso == 'A'
	    	resultados = arr_resultados
	    end	

  	lista.each { |obj| 
		
  		#puts "Cartão verificado: #{cont_cartao}"
  		cont_cartao += 1
	  	jogo = []
	  	jogo[0] = obj.aa
	  	jogo[1] = obj.bb
	  	jogo[2] = obj.cc
	  	jogo[3] = obj.dd
	  	jogo[4] = obj.ee
	  	jogo[5] = obj.ff
	  	jogo[6] = obj.gg
	  	jogo[7] = obj.hh
	  	jogo[8] = obj.ii
	  	jogo[9] = obj.jj
	  	jogo[10] = obj.kk
	  	jogo[11] = obj.ll
	  	jogo[12] = obj.mm
	  	jogo[13] = obj.nn
	  	jogo[14] = obj.oo
	  	jogo[15] = obj.pp if home.qtde_dezenas.to_i > 15
			jogo[16] = obj.qq if home.qtde_dezenas.to_i > 16
			jogo[17] = obj.rr if home.qtde_dezenas.to_i > 17

	  	    premio11 = 2.5
			premio12 = 5
			premio13 = 12.5
			custo15 = 1.25
			custo16 = 16
			custo17 = 170
			custo18 = 1020

			resultado[:qtde_jogos] = resultados.size
		
			resultados.each {|result|

				cont = 0

				for i in 0..jogo.size

					cont+=1 if result.a.to_i == jogo[i].to_i
					cont+=1 if result.b.to_i == jogo[i].to_i
					cont+=1 if result.c.to_i == jogo[i].to_i
					cont+=1 if result.d.to_i == jogo[i].to_i
					cont+=1 if result.e.to_i == jogo[i].to_i
					cont+=1 if result.f.to_i == jogo[i].to_i
					cont+=1 if result.g.to_i == jogo[i].to_i
					cont+=1 if result.h.to_i == jogo[i].to_i
					cont+=1 if result.i.to_i == jogo[i].to_i
					cont+=1 if result.j.to_i == jogo[i].to_i
					cont+=1 if result.k.to_i == jogo[i].to_i
					cont+=1 if result.l.to_i == jogo[i].to_i
					cont+=1 if result.m.to_i == jogo[i].to_i
					cont+=1 if result.n.to_i == jogo[i].to_i
					cont+=1 if result.o.to_i == jogo[i].to_i
				end	

				if cont == 8
					resultado[:pontos_8] += 1 
				end

				if cont == 9
					resultado[:pontos_9] += 1 
				end	

				if cont == 10
					resultado[:pontos_10] += 1 
				end

				if cont == 11
					resultado[:pontos_11] += 1 
					resultado[:concurso11] << result.concurso

					if (home.qtde_dezenas.to_i == 15)
						resultado[:total_11] += premio11
			    elsif (home.qtde_dezenas.to_i == 16)
						resultado[:total_11] += 5 * premio11
					elsif (home.qtde_dezenas.to_i == 17)
						resultado[:total_11] += 15 * premio11
					elsif (home.qtde_dezenas.to_i == 18)
		 		    resultado[:total_11] += 35 * premio11
					end	
				end

				if cont == 12
					resultado[:pontos_12] += 1 
					resultado[:concurso12] << result.concurso

					if (home.qtde_dezenas.to_i == 15)
						resultado[:total_12] += premio12
			    elsif (home.qtde_dezenas.to_i == 16)
						resultado[:total_12] += (4 * premio12) + (12 * premio11)
					elsif (home.qtde_dezenas.to_i == 17)
						resultado[:total_12] += (10 * premio12) + (60 * premio11)
					elsif (home.qtde_dezenas.to_i == 18)
		 		    resultado[:total_12] += (20 * premio12) + (180 * premio11)
					end		
				end

				if cont == 13
					resultado[:pontos_13] += 1 
					resultado[:concurso13] << result.concurso

					if (home.qtde_dezenas.to_i == 15)
						resultado[:total_13] += premio13
				  elsif (home.qtde_dezenas.to_i == 16)
						resultado[:total_13] += (3 * premio13) + (13 * premio12)
					elsif (home.qtde_dezenas.to_i == 17)
						resultado[:total_13] += (6 * premio13) + (52 * premio12) + (78 * premio11)
					elsif (home.qtde_dezenas.to_i == 18)
			      resultado[:total_13] += (10 * premio13) + (130 * premio12) + (390 * premio11)
					end		
				end

				if cont == 14
					resultado[:pontos_14] += 1 
					resultado[:concurso14] << result.concurso

					if (home.qtde_dezenas.to_i == 15)
						resultado[:total_14] += result.rateio_14
				  elsif (home.qtde_dezenas.to_i == 16)
						resultado[:total_14] += (2 * result.rateio_14) + (14 * premio13) 
					elsif (home.qtde_dezenas.to_i == 17)
						resultado[:total_14] += (3 * result.rateio_14) + (42 * premio13) + (91 * premio12)
					elsif (home.qtde_dezenas.to_i == 18)
			 	    resultado[:total_14] += (4 * result.rateio_14) + (84 * premio13) + (364 * premio12) + (364 * premio11)
					end
				end

				if cont == 15
					resultado[:pontos_15] += 1 
					resultado[:concurso15] << result.concurso

					if (home.qtde_dezenas.to_i == 15)
						resultado[:total_15] += result.rateio_15
				  elsif (home.qtde_dezenas.to_i == 16)
						resultado[:total_15] += (result.rateio_15) + (15 * result.rateio_14) 
					elsif (home.qtde_dezenas.to_i == 17)
						resultado[:total_15] += (result.rateio_15) + (30 * result.rateio_14) + (105 * premio13)
					elsif (home.qtde_dezenas.to_i == 18)
			 		  resultado[:total_15] += (result.rateio_15) + (45 * result.rateio_14) + (315 * premio13)  + (455 * premio12)
					end
				end

			}	
		
			if (jogo.size == 15)
				resultado[:despesa] += custo15 * resultados.size
		    elsif (jogo.size == 16)
				resultado[:despesa] += custo16 * resultados.size
			elsif (jogo.size == 17)
				resultado[:despesa] += custo17 * resultados.size
			elsif (jogo.size == 18)
	 		  resultado[:despesa] += custo18 * resultados.size
			end	
	    
	  }  
	  resultado[:total] += resultado[:total_11] + resultado[:total_12] + resultado[:total_13] + resultado[:total_14] + 
	    						resultado[:total_15]
	  resultado[:final] += resultado[:total] - resultado[:despesa]
	  resultado[:qtde_cartoes] = lista.size
		resultado
  end	

end
