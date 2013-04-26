# encoding: UTF-8
class TestarUniverso

  def simular(qtde=15)

    universo_cartao = []
  	
  	for x in 1..25
      universo_cartao << x
  	end	

    cont = 0

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
                                for o in (n+1)..universo_cartao.size - 1

                                  if (qtde == 15)
                                    cont+= 1
                                  else 
                                     for p in (o+1)..universo_cartao.size - 1
                                       
                                        if (qtde == 16)
                                          cont+= 1
                                        else
                                           for q in (p+1)..universo_cartao.size - 1
                                             
                                              if (qtde == 17)
                                                cont+= 1
                                              elsif (qtde == 18)
                                                 for r in (q+1)..universo_cartao.size - 1
                                                   cont+= 1
                                                 end #for r
                                              end #qtde 17
                                           end #for q
                                        end #qtde 16
                                     end #for p
                                  end #qtde 15

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
  
  cont
  end

end