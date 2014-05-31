# encoding: UTF-8
require 'spreadsheet'
class Reducao

	def self.reduzir

		Spreadsheet.client_encoding = 'UTF-8'
		book = Spreadsheet.open "app/models/planilha/reducao.xls" 
		sheet1 = book.worksheet 0
	
		puts "Imprimir planilha"
		puts "Qtde: #{sheet1.row_count}"

		universo_cartao = []
		universo_cartao << []
		universo_cartao << []
  	
  	for x in 0..24
      universo_cartao[0][x] = x + 1
      universo_cartao[1][x] = 0
  	end	 

  	sheet1.each do |row|
  		row.each do |col|
  			universo_cartao[1][col-1] += 1 
  		end	
  	end

  	for i in 0..24
  		puts "Numero: #{universo_cartao[0][i]} Qtde: #{universo_cartao[1][i]}"  
  	end	

	end


  def self.verificar
    
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open "app/models/planilha/reducao.xls" 
    sheet1 = book.worksheet 0
   
    linha = 1   

    sheet1.each do |row|
      
      cont = 1
      b = []

      for x in 0..13
         if (row[x+1] - row[x] == 1)
            cont += 1
         else

            if cont > 2
              b << cont
              b << "#"
            end
              
            cont = 1
         end
      end   

      b << cont if cont > 2

      puts "Linha: #{linha}"
      puts b

      linha += 1
    end

    
  end
end