class HomeController < ApplicationController

  respond_to :html
  before_filter :setar_classe_menu

  def index
  	@home = Home.new(params[:home])
  	@jogos = carregar_jogos(@home)
  end
 
  private
  
  def setar_classe_menu
    @class_home = 'active'  
  end

  def carregar_jogos(home)
  	
  	retorno = []
  	universo_cartao = ['01','02','03','04','05','06','07','08','09']

  	for x in 10..60
  		universo_cartao << x.to_s
  	end	

#  	for a in 0..59
#			for b in 1..59
#				for c in 2..59
#					for d in 3..59
#						for e in 4..59
#							for f in 4..59

#				      end	
#				    end				
#				  end	
#				end				
#			end	
#		end	

		for a in 0..universo_cartao.size
			for b in 0..universo_cartao.size

	 	  	lista = []
	 	  	lista[0] = universo_cartao[a]
	 	  	lista[1] = universo_cartao[b]
	 	  	retorno << lista

	 	  end	
	  end				

	  retorno
  end

end
