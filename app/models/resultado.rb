# encoding: UTF-8
class Resultado < ActiveRecord::Base
  attr_accessible :concurso, :data, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o


  def verificar(obj)

  	resultado = []
  	jogo = []
  	jogo[0] = obj.aa
  	jogo[1] = obj.aa
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

  	if obj.qtde_dezenas > 15
	  	jogo[15] = obj.pp

	  	if obj.qtde_dezenas > 16
	  		jogo[16] = obj.qq
	  		
	  		if obj.qtde_dezenas > 17
	  			jogo[18] = obj.rr
	  		end	
	  	end	
	  end


  	cont9 = 0
  	cont10 = 0
  	cont11 = 0
  	cont12 = 0
  	cont13 = 0
  	cont14 = 0
  	cont15 = 0

  	concurso11 = []
  	concurso12 = []
  	concurso13 = []
  	concurso14 = []
  	concurso15 = []

    resultados = Resultado.all 

		resultados.each {|result|

			cont = 0

			for i in 0..jogo.size

				cont+=1 if result.a == jogo[i]
				cont+=1 if result.b == jogo[i]
				cont+=1 if result.c == jogo[i]
				cont+=1 if result.d == jogo[i]
				cont+=1 if result.e == jogo[i]
				cont+=1 if result.f == jogo[i]
				cont+=1 if result.g == jogo[i]
				cont+=1 if result.h == jogo[i]
				cont+=1 if result.i == jogo[i]
				cont+=1 if result.j == jogo[i]
				cont+=1 if result.k == jogo[i]
				cont+=1 if result.l == jogo[i]
				cont+=1 if result.m == jogo[i]
				cont+=1 if result.n == jogo[i]
				cont+=1 if result.o == jogo[i]

			end	

			if cont == 9
				cont9 += 1 
			end	

			if cont == 10
				cont10 += 1 
			end

			if cont == 11
				cont11 += 1 
				concurso11 << result.concurso
			end

			if cont == 12
				cont12 += 1 
				concurso12 << result.concurso
			end

			if cont == 13
				cont13 += 1 
				concurso13 << result.concurso
			end

			if cont == 14
				cont14 += 1 
				concurso14 << result.concurso
			end

			if cont == 15
				cont15 += 1 
				concurso15 << result.concurso
			end

		}	
		
		resultado[0] = resultados.size
		resultado[1] = cont9
		resultado[2] = cont10
		resultado[3] = cont11
		resultado[4] = cont12
		resultado[5] = cont13
		resultado[6] = cont14
		resultado[7] = cont15
		resultado[8] = concurso11
		resultado[9] = concurso12
		resultado[10] = concurso13
		resultado[11] = concurso14
		resultado[12] = concurso15

		if (obj.qtde_dezenas == 15)
			resultado[13] = resultados.size * 1.25
	  elsif (obj.qtde_dezenas == 16)
			resultado[13] = resultados.size * 16
		elsif (obj.qtde_dezenas == 17)
			resultado[13] = resultados.size * 170
		elsif (obj.qtde_dezenas == 18)
			resultado[13] = resultados.size * 1020
		end	
			
    resultado[14] = cont11 * 2.5
		resultado[15] = cont12 * 5
		resultado[16] = cont13 * 12.5
		resultado[17] = cont14 * 1018
    resultado[18] = cont15 * 596356

    resultado[19] = resultado[14] + resultado[15] + resultado[16] + resultado[17] + resultado[18]
    resultado[20] = resultado[19] - resultado[13]

		resultado
  end	


end
