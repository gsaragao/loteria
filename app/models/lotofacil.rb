# encoding: UTF-8
class Lotofacil < ActiveRecord::Base
  attr_accessible :posicao, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :pontos_15, 
  :pontos_14, :pontos_13, :pontos_12, :pontos_11, :total_premio

  def self.pesquisar(obj)
  	
	sql = ' select count(*) total from lotofacils '		
	sql += ' where a in (' + obj.a.join(",") + ')'
	sql += ' and b in (' + obj.b.join(",") + ')'
	sql += ' and c in (' + obj.c.join(",") + ')'
	sql += ' and d in (' + obj.d.join(",") + ')'
	sql += ' and e in (' + obj.e.join(",") + ')'
	sql += ' and f in (' + obj.f.join(",") + ')'
	sql += ' and g in (' + obj.g.join(",") + ')'
	sql += ' and h in (' + obj.h.join(",") + ')'
	sql += ' and i in (' + obj.i.join(",") + ')'
	sql += ' and j in (' + obj.j.join(",") + ')'
	sql += ' and k in (' + obj.k.join(",") + ')'
	sql += ' and l in (' + obj.l.join(",") + ')'
	sql += ' and m in (' + obj.m.join(",") + ')'
	sql += ' and n in (' + obj.n.join(",") + ')'
	sql += ' and o in (' + obj.o.join(",") + ')'

	find_by_sql(sql)

  end

  def melhor_jogo(inicio = 1, fim = 1)

  	t1 = Time.now
	
	jogos = Lotofacil.where("id between #{inicio} and #{fim}")
	home = Home.new
	home.qtde_dezenas = 15
	home.tipo_concurso = 'A'
    home.tipo_confere = 'M'
	
    resultados = Resultado.all	

    puts 'Iniciou!!!!!'

    cont = 1

    jogos.each { |jogo| 
    	lista = []
    	home_jogo = Home.new
    	home_jogo.aa = jogo.a 
			home_jogo.bb = jogo.b 
			home_jogo.cc = jogo.c  
			home_jogo.dd = jogo.d  
			home_jogo.ee = jogo.e 
			home_jogo.ff = jogo.f 
			home_jogo.gg = jogo.g 
			home_jogo.hh = jogo.h 
			home_jogo.ii = jogo.i 
			home_jogo.jj = jogo.j 
			home_jogo.kk = jogo.k 
			home_jogo.ll = jogo.l 
			home_jogo.mm = jogo.m 
			home_jogo.nn = jogo.n 
			home_jogo.oo = jogo.o
			lista << home_jogo

			resultado = Resultado.verificar(lista, home, resultados)
			jogo.pontos_15 = resultado[:pontos_15]
			jogo.pontos_14 = resultado[:pontos_14]
			jogo.pontos_13 = resultado[:pontos_13]
			jogo.pontos_12 = resultado[:pontos_12]
			jogo.pontos_11 = resultado[:pontos_11]
			jogo.total_premio = resultado[:final]

			jogo.save

			puts "Cartão: #{cont}"
			cont += 1

    }
     
    puts 'Finalizou!!!!!'
    puts "Tempo: #{(Time.now - t1).round(2)} segundos" 

  end

end
