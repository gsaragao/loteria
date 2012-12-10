# encoding: UTF-8
class Resultado < ActiveRecord::Base
  attr_accessible :concurso, :data, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o


  def self.verificar(obj)

  	resultado = []
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

  	if obj.qtde_dezenas.to_i > 15
	  	jogo[15] = obj.pp

	  	if obj.qtde_dezenas.to_i > 16
	  		jogo[16] = obj.qq

	  		if obj.qtde_dezenas.to_i > 17
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

				cont+=1 if result.a == jogo[i].to_i
				cont+=1 if result.b == jogo[i].to_i
				cont+=1 if result.c == jogo[i].to_i
				cont+=1 if result.d == jogo[i].to_i
				cont+=1 if result.e == jogo[i].to_i
				cont+=1 if result.f == jogo[i].to_i
				cont+=1 if result.g == jogo[i].to_i
				cont+=1 if result.h == jogo[i].to_i
				cont+=1 if result.i == jogo[i].to_i
				cont+=1 if result.j == jogo[i].to_i
				cont+=1 if result.k == jogo[i].to_i
				cont+=1 if result.l == jogo[i].to_i
				cont+=1 if result.m == jogo[i].to_i
				cont+=1 if result.n == jogo[i].to_i
				cont+=1 if result.o == jogo[i].to_i
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

		premio11 = 2.5
		premio12 = 5
		premio13 = 12.5
		premio14 = 1018
		premio15 = 596356
		custo15 = 1.25
		custo16 = 16
		custo17 = 170
		custo18 = 1020
		resultado[14] = 0
		resultado[15] = 0
		resultado[16] = 0
		resultado[17] = 0
    resultado[18] = 0

		if (obj.qtde_dezenas.to_i == 15)
			resultado[13] = resultados.size * custo15
			resultado[14] = cont11 * premio11
			resultado[15] = cont12 * premio12
			resultado[16] = cont13 * premio13
			resultado[17] = cont14 * premio14
	    resultado[18] = cont15 * premio15
	  elsif (obj.qtde_dezenas.to_i == 16)
			resultado[13] = resultados.size * custo16
			resultado[14] = cont11 * 5 * premio11 if cont11 > 0
			resultado[15] = (cont12 * 4 * premio12) + (12 * premio11)  if cont12 > 0
			resultado[16] = (cont13 * 3 * premio13) + (13 * premio12) if cont13 > 0
			resultado[17] = (cont14 * 2 * premio14) + (14 * premio13)  if cont14 > 0
	    resultado[18] = (cont15 * premio15) + (15 * premio14)  if cont15 > 0
		elsif (obj.qtde_dezenas.to_i == 17)
			resultado[13] = resultados.size * custo17
			resultado[14] = cont11 * 15 * premio11  if cont11 > 0
			resultado[15] = (cont12 * 10 * premio12) + (60 * premio11)  if cont12 > 0
			resultado[16] = (cont13 * 6 * premio13) + (52 * premio12) + (78 * premio11) if cont13 > 0
			resultado[17] = (cont14 * 3 * premio14) + (42 * premio13) + (91 * premio12) if cont14 > 0
	    resultado[18] = (cont15 * premio15) + (30 * premio14) + (105 * premio13)  if cont15 > 0
		elsif (obj.qtde_dezenas.to_i == 18)
			resultado[13] = resultados.size * custo18
 		  resultado[14] = cont11 * 35 * premio11 if cont11 > 0
			resultado[15] = (cont12 * 20 * premio12) + (180 * premio11)  if cont12 > 0
			resultado[16] = (cont13 * 10 * premio13) + (130 * premio12) + (390 * premio11) if cont13 > 0
			resultado[17] = (cont14 * 4 * premio14) + (84 * premio13) + (364 * premio12) + (364 * premio11) if cont14 > 0
	    resultado[18] = (cont15 * premio15) + (45 * premio14) + (315 * premio13)  + (455 * premio12) if cont15 > 0

		end	
	
    resultado[19] = resultado[14] + resultado[15] + resultado[16] + resultado[17] + resultado[18]
    resultado[20] = resultado[19] - resultado[13]

		resultado
  end	


end
