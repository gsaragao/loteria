class App

loteca = []

loteca[0] = "1"
loteca[1] = "X"
loteca[2] = "2" 
loteca[3] = "1X"
loteca[4] = "12"
loteca[5] = "X2"
loteca[6] = "1X2"

cont = 0

for a in 0..loteca.size - 1
  for b in 0..loteca.size - 1
     for c in 0..loteca.size - 1
        for d in 0..loteca.size - 1
           for e in 0..loteca.size - 1
           	  for f in 0..loteca.size - 1

           	  	cont+= 1

           	  	puts "#{loteca[a]} - #{loteca[b]} - #{loteca[c]} - #{loteca[d]} - #{loteca[e]} - #{loteca[f]}"

           	  end #f
           end #e 
        end #d
     end #c
   end #b    
 end #a

 puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
 puts "Total: #{cont}"
 puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

end
