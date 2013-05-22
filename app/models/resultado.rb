# encoding: UTF-8
class Resultado < ActiveRecord::Base
  usar_como_dinheiro :rateio_15, :rateio_14
  attr_accessible :concurso, :data, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :rateio_15, :rateio_14
  validates_presence_of :concurso, :data, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :rateio_15, :rateio_14

  self.per_page = 10

  PREMIO11 = 2.5
  PREMIO12 = 5
  PREMIO13 = 12.5

  def pesquisar(page)
    Resultado.paginate(:conditions => conditions, :page => page).order("id desc")
  end

  def self.media_15
  	 find_by_sql("select round(sum(rateio_15) / count(*),2) rateio_15 from resultados")
  end

  def self.media_14
  	 find_by_sql("select round(sum(rateio_14) / count(*),2) rateio_14 from resultados")
  end

  # Rotina que verifica os pontos ganhos na aposta
  def self.verificar(home)

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
		resultado[:categories] = ''
		resultado[:data_series] = ''
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
	    end	

    	jogo = []
	  	jogo[0] = home.aa
	  	jogo[1] = home.bb
	  	jogo[2] = home.cc
	  	jogo[3] = home.dd
	  	jogo[4] = home.ee
	  	jogo[5] = home.ff
	  	jogo[6] = home.gg
	  	jogo[7] = home.hh
	  	jogo[8] = home.ii
	  	jogo[9] = home.jj
	  	jogo[10] = home.kk
	  	jogo[11] = home.ll
	  	jogo[12] = home.mm
	  	jogo[13] = home.nn
	  	jogo[14] = home.oo
	  	jogo[15] = home.pp if home.qtde_dezenas.to_i > 15
			jogo[16] = home.qq if home.qtde_dezenas.to_i > 16
			jogo[17] = home.rr if home.qtde_dezenas.to_i > 17

	  	custo15 = 1.25
			custo16 = 16
			custo17 = 170
			custo18 = 1020

			resultado[:qtde_jogos] = resultados.size
		  
			verifica_primeiro = false

			resultados.each {|result|

				cont = 0
				total_por_concurso = 0

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
						resultado[:total_11] += PREMIO11
						total_por_concurso = PREMIO11
			    elsif (home.qtde_dezenas.to_i == 16)
						resultado[:total_11] += 5 * PREMIO11
						total_por_concurso = 5 * PREMIO11
					elsif (home.qtde_dezenas.to_i == 17)
						resultado[:total_11] += 15 * PREMIO11
						total_por_concurso = 15 * PREMIO11
					elsif (home.qtde_dezenas.to_i == 18)
		 		    resultado[:total_11] += 35 * PREMIO11
		 		    total_por_concurso = 35 * PREMIO11
					end	
				end

				if cont == 12
					resultado[:pontos_12] += 1 
					resultado[:concurso12] << result.concurso

					if (home.qtde_dezenas.to_i == 15)
						resultado[:total_12] += PREMIO12
						total_por_concurso = PREMIO12
			    elsif (home.qtde_dezenas.to_i == 16)
						resultado[:total_12] += (4 * PREMIO12) + (12 * PREMIO11)
						total_por_concurso = (4 * PREMIO12) + (12 * PREMIO11)
					elsif (home.qtde_dezenas.to_i == 17)
						resultado[:total_12] += (10 * PREMIO12) + (60 * PREMIO11)
						total_por_concurso = (10 * PREMIO12) + (60 * PREMIO11)
					elsif (home.qtde_dezenas.to_i == 18)
		 		    resultado[:total_12] += (20 * PREMIO12) + (180 * PREMIO11)
		 		    total_por_concurso = (20 * PREMIO12) + (180 * PREMIO11)
					end		
				end

				if cont == 13
					resultado[:pontos_13] += 1 
					resultado[:concurso13] << result.concurso

					if (home.qtde_dezenas.to_i == 15)
						resultado[:total_13] += PREMIO13
						total_por_concurso = PREMIO13
				  elsif (home.qtde_dezenas.to_i == 16)
						resultado[:total_13] += (3 * PREMIO13) + (13 * PREMIO12)
						total_por_concurso = (3 * PREMIO13) + (13 * PREMIO12)
					elsif (home.qtde_dezenas.to_i == 17)
						resultado[:total_13] += (6 * PREMIO13) + (52 * PREMIO12) + (78 * PREMIO11)
						total_por_concurso = (6 * PREMIO13) + (52 * PREMIO12) + (78 * PREMIO11)
					elsif (home.qtde_dezenas.to_i == 18)
			      resultado[:total_13] += (10 * PREMIO13) + (130 * PREMIO12) + (390 * PREMIO11)
			      total_por_concurso = (10 * PREMIO13) + (130 * PREMIO12) + (390 * PREMIO11)
					end		
				end

				if cont == 14
					resultado[:pontos_14] += 1 
					resultado[:concurso14] << result.concurso

					if (home.qtde_dezenas.to_i == 15)
						resultado[:total_14] += result.rateio_14
						total_por_concurso = result.rateio_14
				  elsif (home.qtde_dezenas.to_i == 16)
						resultado[:total_14] += (2 * result.rateio_14) + (14 * PREMIO13)
						total_por_concurso =  (2 * result.rateio_14) + (14 * PREMIO13)
					elsif (home.qtde_dezenas.to_i == 17)
						resultado[:total_14] += (3 * result.rateio_14) + (42 * PREMIO13) + (91 * PREMIO12)
						total_por_concurso = (3 * result.rateio_14) + (42 * PREMIO13) + (91 * PREMIO12)
					elsif (home.qtde_dezenas.to_i == 18)
			 	    resultado[:total_14] += (4 * result.rateio_14) + (84 * PREMIO13) + (364 * PREMIO12) + (364 * PREMIO11)
			 	    total_por_concurso = (4 * result.rateio_14) + (84 * PREMIO13) + (364 * PREMIO12) + (364 * PREMIO11)
					end
				end

				if cont == 15
					resultado[:pontos_15] += 1 
					resultado[:concurso15] << result.concurso

					if (home.qtde_dezenas.to_i == 15)
						resultado[:total_15] += result.rateio_15
						total_por_concurso = result.rateio_15
				  elsif (home.qtde_dezenas.to_i == 16)
						resultado[:total_15] += (result.rateio_15) + (15 * result.rateio_14)
						total_por_concurso =  (result.rateio_15) + (15 * result.rateio_14)
					elsif (home.qtde_dezenas.to_i == 17)
						resultado[:total_15] += (result.rateio_15) + (30 * result.rateio_14) + (105 * PREMIO13)
						total_por_concurso = (result.rateio_15) + (30 * result.rateio_14) + (105 * PREMIO13)
					elsif (home.qtde_dezenas.to_i == 18)
			 		  resultado[:total_15] += (result.rateio_15) + (45 * result.rateio_14) + (315 * PREMIO13)  + (455 * PREMIO12)
			 		  total_por_concurso = (result.rateio_15) + (45 * result.rateio_14) + (315 * PREMIO13)  + (455 * PREMIO12)
					end
				end

				
			  if (verifica_primeiro)
				  resultado[:categories] += ","
				  resultado[:data_series] += ","
				else  
					verifica_primeiro = true
			  end

			  resultado[:categories] += result.concurso.to_s;
			  resultado[:data_series] += total_por_concurso.to_s;
			}	
		
			if (jogo.size == 15)
				resultado[:despesa] = custo15 * resultados.size
		    elsif (jogo.size == 16)
				resultado[:despesa] = custo16 * resultados.size
			elsif (jogo.size == 17)
				resultado[:despesa] = custo17 * resultados.size
			elsif (jogo.size == 18)
	 		  resultado[:despesa] = custo18 * resultados.size
			end	
	    
	  resultado[:total] = resultado[:total_11] + resultado[:total_12] + resultado[:total_13] + resultado[:total_14] + 
	    						resultado[:total_15]
	  resultado[:final] = resultado[:total] - resultado[:despesa]
	  resultado[:qtde_cartoes] = 1
		resultado
  end	

private

	def concurso_conditions
    ["resultados.concurso = ?", "#{concurso}"] unless concurso.blank?
  end

  def data_conditions
    ["resultados.data = ?", "#{data}"] unless data.blank?
  end

  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end

  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end

  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end

  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end


end
