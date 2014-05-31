# encoding: UTF-8
class Resultado < ActiveRecord::Base
  usar_como_dinheiro :rateio_15, :rateio_14
  attr_accessible :concurso, :data, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :rateio_15, :rateio_14,
  :l1, :l2, :l3, :l4, :l5, :c1, :c2, :c3, :c4, :c5
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

  def linha 
	l1.to_s + '-' + l2.to_s + '-' + l3.to_s + '-' + l4.to_s + '-' + l5.to_s  	
  end	

  def coluna 
	c1.to_s + '-' + c2.to_s + '-' + c3.to_s + '-' + c4.to_s + '-' + c5.to_s  	
  end

  def converte_linha
  	  	
  		linha1 = 0
  		linha2 = 0
  		linha3 = 0
  		linha4 = 0
  		linha5 = 0
  	  	
  		for i in 3..17
  	 		 if [1,2,3,4,5].include?(attributes.to_a[i].map.to_a[1])
  	 		 		linha1 += 1
  	 		 end

  	 		 if [6,7,8,9,10].include?(attributes.to_a[i].map.to_a[1])
  	 		 		linha2 += 1
  	 		 end

  	 		 if [11,12,13,14,15].include?(attributes.to_a[i].map.to_a[1])
  	 		 		linha3 += 1
  	 		 end

  	 		 if [16,17,18,19,20].include?(attributes.to_a[i].map.to_a[1])
  	 		 		linha4 += 1
  	 		 end

  	 		 if [21,22,23,24,25].include?(attributes.to_a[i].map.to_a[1])
  	 		 		linha5 += 1
  	 		 end
  	 	end

  	 	self.l1 = linha1
  	 	self.l2 = linha2 
  	 	self.l3 = linha3
  	 	self.l4 = linha4
  	 	self.l5 = linha5
  end

  def converte_coluna
  	  	
  		coluna1 = 0
  		coluna2 = 0
  		coluna3 = 0
  		coluna4 = 0
  		coluna5 = 0
  	  	
  		for i in 3..17
  	 		 if [1,6,11,16,21].include?(attributes.to_a[i].map.to_a[1])
  	 		 		coluna1 += 1
  	 		 end

  	 		 if [2,7,12,17,22].include?(attributes.to_a[i].map.to_a[1])
  	 		 		coluna2 += 1
  	 		 end

  	 		 if [3,8,13,18,23].include?(attributes.to_a[i].map.to_a[1])
  	 		 		coluna3 += 1
  	 		 end

  	 		 if [4,9,14,19,24].include?(attributes.to_a[i].map.to_a[1])
  	 		 		coluna4 += 1
  	 		 end

  	 		 if [5,10,15,20,25].include?(attributes.to_a[i].map.to_a[1])
  	 		 		coluna5 += 1
  	 		 end
  	 	end

  	 	self.c1 = coluna1
  	 	self.c2 = coluna2
  	 	self.c3 = coluna3
  	 	self.c4 = coluna4
  	 	self.c5 = coluna5
  end


  def self.acompanhamento
  	
  	 retorno = [] 

  	 resultados = order("id desc").limit(20)	

  	 resultados.each {|result| 

  	 		jogo = []
  	 		jogo[0] = result.concurso

  	 		for i in 3..17
  	 			 jogo[result.attributes.to_a[i].map.to_a[1]] = result.attributes.to_a[i].map.to_a[1]
  	 		end
  	 		
  	 		jogo[26] = result.linha
  	 		jogo[27] = result.coluna

  	 		retorno << jogo	
  	 }

  	 retorno
  end

  def self.inverso
  	
  	 retorno = [] 

  	 resultados = Resultado.acompanhamento 

  	 resultados.each {|result| 

  	 		jogo = []
  	 		jogo[0] = result[0]

  	 		for i in 1..25
  	 			 jogo[i] = i if result[i].blank? 
  	 		end

  	 		retorno << jogo	
  	 }

  	 retorno
  end

  def self.analisar

		retorno = []
  	
  	sql = "select x.a as num, concat(concat(x.a, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select a, count(*) total, (select count(*) from resultados) geral from resultados group by a) x "
  	retorno[0] = find_by_sql(sql)

  	sql = "select x.b as num, concat(concat(x.b, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select b, count(*) total, (select count(*) from resultados) geral from resultados group by b) x "
  	retorno[1] = find_by_sql(sql)

		sql = "select x.c as num, concat(concat(x.c, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select c, count(*) total, (select count(*) from resultados) geral from resultados group by c) x "
  	retorno[2] = find_by_sql(sql)

		sql = "select x.d as num, concat(concat(x.d, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select d, count(*) total, (select count(*) from resultados) geral from resultados group by d) x "
  	retorno[3] = find_by_sql(sql)

		sql = "select x.e as num, concat(concat(x.e, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select e, count(*) total, (select count(*) from resultados) geral from resultados group by e) x "
  	retorno[4] = find_by_sql(sql)

		sql = "select x.f as num, concat(concat(x.f, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select f, count(*) total, (select count(*) from resultados) geral from resultados group by f) x "
  	retorno[5] = find_by_sql(sql)

		sql = "select x.g as num, concat(concat(x.g, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select g, count(*) total, (select count(*) from resultados) geral from resultados group by g) x "
  	retorno[6] = find_by_sql(sql)

		sql = "select x.h as num, concat(concat(x.h, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select h, count(*) total, (select count(*) from resultados) geral from resultados group by h) x "
  	retorno[7] = find_by_sql(sql)

		sql = "select x.i as num, concat(concat(x.i, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select i, count(*) total, (select count(*) from resultados) geral from resultados group by i) x "
  	retorno[8] = find_by_sql(sql)

		sql = "select x.j as num, concat(concat(x.j, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select j, count(*) total, (select count(*) from resultados) geral from resultados group by j) x "
  	retorno[9] = find_by_sql(sql)

		sql = "select x.k as num, concat(concat(x.k, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select k, count(*) total, (select count(*) from resultados) geral from resultados group by k) x "
  	retorno[10] = find_by_sql(sql)

		sql = "select x.l as num, concat(concat(x.l, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select l, count(*) total, (select count(*) from resultados) geral from resultados group by l) x "
  	retorno[11] = find_by_sql(sql)

		sql = "select x.m as num, concat(concat(x.m, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select m, count(*) total, (select count(*) from resultados) geral from resultados group by m) x "
  	retorno[12] = find_by_sql(sql)

		sql = "select x.n as num, concat(concat(x.n, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select n, count(*) total, (select count(*) from resultados) geral from resultados group by n) x "
  	retorno[13] = find_by_sql(sql)

		sql = "select x.o as num, concat(concat(x.o, ' - ', round((x.total / x.geral) * 100,1)),' ','%') as perc " 
		sql += "from (select o, count(*) total, (select count(*) from resultados) geral from resultados group by o) x "
  	retorno[14] = find_by_sql(sql)

  	retorno
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
			custo16 = 20
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
			  resultado[:data_series] += total_por_concurso.to_f.to_s;
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
