# encoding: UTF-8
require 'spreadsheet'
class Transforme

# Rotina para transformar o universo de jogos
	def self.transformar(home)
		
		retorno = []

		if home.exportar == "1"
			begin
				endereco = "app/models/planilha/#{home.nome_arquivo}.xls" 
				File.delete(endereco) if File.exist?(endereco)
			rescue Errno::ENOENT => e
				puts "-----------------------------------------------------------"
				puts "Error: #{e.message}"
				puts "-----------------------------------------------------------"
			end	
			
			@planilha = Spreadsheet::Workbook.new
			@sheet = @planilha.create_worksheet :name => 'Jogos'

		end	

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
		universo_cartao[18] = home.ss if !home.ss.blank?

		for a in 0..universo_cartao.size - 1
#if universo_cartao[a].to_i <= 2  ########## 1 ############
		 for b in (a+1)..universo_cartao.size - 1
#if universo_cartao[b].to_i <= 4 ########## 2 ############		 	
  	 	if home.qtde_dezenas.to_i > 2
	     for c in (b+1)..universo_cartao.size - 1
#if universo_cartao[c].to_i <= 6 ########## 3 ############	     	
        if home.qtde_dezenas.to_i > 3
         for d in (c+1)..universo_cartao.size - 1
#if universo_cartao[d].to_i <= 8 ######### 4 #############         	
          if home.qtde_dezenas.to_i > 4
	         for e in (d+1)..universo_cartao.size - 1
#if universo_cartao[e].to_i >= 6 && universo_cartao[e].to_i <= 10 ########## 5 ############	         	
			     	if home.qtde_dezenas.to_i > 5
			   		 for f in (e+1)..universo_cartao.size - 1
#if universo_cartao[f].to_i >= 8 && universo_cartao[f].to_i <= 12 ########### 6 ###########			   		 	
			       	if home.qtde_dezenas.to_i > 6
					   	 for g in (f+1)..universo_cartao.size - 1
#if universo_cartao[g].to_i >= 10 && universo_cartao[g].to_i <= 13 ########### 7 ###########					   	 	
					   	 	if home.qtde_dezenas.to_i > 7
					   	 	 for h in (g+1)..universo_cartao.size - 1
#if universo_cartao[h].to_i >= 11 && universo_cartao[h].to_i <= 15 ########### 8 ###########					   	 	 	
					   	 		if home.qtde_dezenas.to_i > 8
						   	 	 for i in (h+1)..universo_cartao.size - 1
#if universo_cartao[i].to_i >= 13 && universo_cartao[i].to_i <= 17 ########### 9 ###########					   	 	 							   	 	 	
						   	 		if home.qtde_dezenas.to_i > 9
							   	   for j in (i+1)..universo_cartao.size - 1
#if universo_cartao[j].to_i >= 15 && universo_cartao[j].to_i <= 18 ########### 10 ###########							   	   	
							   	 	 	if home.qtde_dezenas.to_i > 10
							   	 		 for k in (j+1)..universo_cartao.size - 1
							   	 			if home.qtde_dezenas.to_i > 11
							   	 			 for l in (k+1)..universo_cartao.size - 1
								   	 				retorno << "#{universo_cartao[a]} - 
										     	            #{universo_cartao[b]} - 
										     	            #{universo_cartao[c]} - 
										     	            #{universo_cartao[d]} - 
										     	            #{universo_cartao[e]} - 
										     	            #{universo_cartao[f]} - 
										     	            #{universo_cartao[g]} - 
										     	            #{universo_cartao[h]} - 
										     	            #{universo_cartao[i]} - 
										     	            #{universo_cartao[j]} - 
										     	            #{universo_cartao[k]} - 
										     	            #{universo_cartao[l]}".gsub(/\s+/, " ").strip
							   	 			 end #for l	
							   	 			else	
							   	 			 retorno << "#{universo_cartao[a]} - 
										     	            #{universo_cartao[b]} - 
										     	            #{universo_cartao[c]} - 
										     	            #{universo_cartao[d]} - 
										     	            #{universo_cartao[e]} - 
										     	            #{universo_cartao[f]} - 
										     	            #{universo_cartao[g]} - 
										     	            #{universo_cartao[h]} - 
										     	            #{universo_cartao[i]} - 
										     	            #{universo_cartao[j]} - 
										     	            #{universo_cartao[k]}".gsub(/\s+/, " ").strip
										    end #if 11      
							   	 		 end #for k	
							   	 		else	
							   	 		 retorno << "#{universo_cartao[a]} - 
						     	            #{universo_cartao[b]} - 
						     	            #{universo_cartao[c]} - 
						     	            #{universo_cartao[d]} - 
						     	            #{universo_cartao[e]} - 
						     	            #{universo_cartao[f]} - 
						     	            #{universo_cartao[g]} - 
						     	            #{universo_cartao[h]} - 
						     	            #{universo_cartao[i]} - 
						     	            #{universo_cartao[j]}".gsub(/\s+/, " ").strip
						     	    end #if 10  
#end ##########################						     	    
							   	 	 end #for j	
							   	 	else	
 					   	 			     retorno << "#{universo_cartao[a]} - 
				     	            #{universo_cartao[b]} - 
				     	            #{universo_cartao[c]} - 
				     	            #{universo_cartao[d]} - 
				     	            #{universo_cartao[e]} - 
				     	            #{universo_cartao[f]} - 
				     	            #{universo_cartao[g]} - 
				     	            #{universo_cartao[h]} - 
				     	            #{universo_cartao[i]}".gsub(/\s+/, " ").strip
						     	  end #if 9      
#end ##########################								     	  
						   	 	 end #for i	
					   	 		else
						   	 	 retorno << "#{universo_cartao[a]} - 
						     	            #{universo_cartao[b]} - 
						     	            #{universo_cartao[c]} - 
						     	            #{universo_cartao[d]} - 
						     	            #{universo_cartao[e]} - 
						     	            #{universo_cartao[f]} - 
						     	            #{universo_cartao[g]} - 
						     	            #{universo_cartao[h]}".gsub(/\s+/, " ").strip
					     	  end #if 8        
#end ##########################					     	  
					     	 end #for h          
					     	else          		
					     	  retorno << "#{universo_cartao[a]} - 
					     	              #{universo_cartao[b]} - 
					     	              #{universo_cartao[c]} - 
					     	              #{universo_cartao[d]} - 
					     	              #{universo_cartao[e]} - 
					     	              #{universo_cartao[f]} - 
					     	              #{universo_cartao[g]}".gsub(/\s+/, " ").strip
		 					  end #if 7
#end ##########################		 					  
		 					 end #for g	
		 					else
	    				 retorno << "#{universo_cartao[a]} - 
	    				 						 #{universo_cartao[b]} - 
	    				 						 #{universo_cartao[c]} - 
	    				 						 #{universo_cartao[d]} - 
	    				 						 #{universo_cartao[e]} - 
	    				 						 #{universo_cartao[f]}".gsub(/\s+/, " ").strip	
		 					end #if 6
#end ##########################
 						 end #for f	
 						else
	    			 retorno << "#{universo_cartao[a]} - 
	    			 					   #{universo_cartao[b]} - 
	    			 					   #{universo_cartao[c]} - 
	    			 					   #{universo_cartao[d]} - 
	    			 					   #{universo_cartao[e]}".gsub(/\s+/, " ").strip	
 						end #if 5	
#end ##########################
		    	 end #for e
		    	else
	    		 retorno << "#{universo_cartao[a]} - #{universo_cartao[b]} - #{universo_cartao[c]} - #{universo_cartao[d]}".gsub(/\s+/, " ").strip  	
		    	end #if 4 	
#end ##########################
    	   end #for d
	    	else
   			 retorno << "#{universo_cartao[a]} - #{universo_cartao[b]} - #{universo_cartao[c]}".gsub(/\s+/, " ").strip 
		    end #if 3   
#end ##########################
   	   end #for c
	    else
	     retorno << "#{universo_cartao[a]} - #{universo_cartao[b]}".gsub(/\s+/, " ").strip 
	    end #if 2  
#end ##########################   	 
   	 end #for b
#end ##########################   	 
   	end #for a

  	convert_export(retorno, home) if home.exportar == "1"
	 	
	retorno
	end

	def self.convert_export(arr, home)
		
		format = Spreadsheet::Format.new  :number_format => '00'

		for i in 0..arr.size - 1
			 row = arr[i].split(" - ")

			if home.numero_letra == "N"
				 for x in 0..row.size - 1
				 		row[x] = row[x].to_i
				 end			 

  	     @sheet.insert_row(i, row)
  	     row_sheet = @sheet.row(i)
  		   row_sheet.default_format = format
  		else
  			 @sheet.insert_row(i, row)
  		end	

  	end

  	@planilha.write "app/models/planilha/#{home.nome_arquivo}.xls"

	end

end	


