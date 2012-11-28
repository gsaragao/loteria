class Home < ActiveRecord::Base
  attr_accessible :regras, :excluir_dezena
 	attr_accessor :regras, :excluir_dezena
	
end
