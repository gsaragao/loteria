# encoding: UTF-8
class Transforme

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
					   	 	if home.qtde_dezenas.to_i > 7
					   	 	 for h in (g+1)..universo_cartao.size - 1
					   	 		if home.qtde_dezenas.to_i > 8
						   	 	 for i in (h+1)..universo_cartao.size - 1
						   	 		if home.qtde_dezenas.to_i > 9
							   	   for j in (i+1)..universo_cartao.size - 1
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
										     	            #{universo_cartao[l]}"

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
										     	            #{universo_cartao[k]}"
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
						     	            #{universo_cartao[j]}"
						     	    end #if 10  
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
				     	            #{universo_cartao[i]}"
						     	  end #if 9      
						   	 	 end #for i	
					   	 		else
						   	 	 retorno << "#{universo_cartao[a]} - 
						     	            #{universo_cartao[b]} - 
						     	            #{universo_cartao[c]} - 
						     	            #{universo_cartao[d]} - 
						     	            #{universo_cartao[e]} - 
						     	            #{universo_cartao[f]} - 
						     	            #{universo_cartao[g]} - 
						     	            #{universo_cartao[h]}"
					     	  end #if 8        
					     	 end #for h          
					     	else          		
					     	  retorno << "#{universo_cartao[a]} - 
					     	              #{universo_cartao[b]} - 
					     	              #{universo_cartao[c]} - 
					     	              #{universo_cartao[d]} - 
					     	              #{universo_cartao[e]} - 
					     	              #{universo_cartao[f]} - 
					     	              #{universo_cartao[g]}"	
		 					  end #if 7
		 					 end #for g	
		 					else
	    				 retorno << "#{universo_cartao[a]} - 
	    				 						 #{universo_cartao[b]} - 
	    				 						 #{universo_cartao[c]} - 
	    				 						 #{universo_cartao[d]} - 
	    				 						 #{universo_cartao[e]} - 
	    				 						 #{universo_cartao[f]}"	
		 					end #if 6
 						 end #for f	
 						else
	    			 retorno << "#{universo_cartao[a]} - 
	    								   #{universo_cartao[b]} - 
	    								   #{universo_cartao[c]} - 
	    								   #{universo_cartao[d]} - 
	    								   #{universo_cartao[e]}"	
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

end	