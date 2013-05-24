# encoding : utf-8
class LotofacilController < ApplicationController

  respond_to :html
  before_filter :setar_classe_menu
  before_filter :manage_params, :only => [:index]
  
  def index
  	@lotofacil = Lotofacil.new(params[:lotofacil])
  	@lotofacil.qtde_dezenas = 15 if @lotofacil.qtde_dezenas.blank?
	@jogos = []
    if params[:commit] == 'Pesquisar'	
    	@jogos = @lotofacil.pesquisar(params[:page])
    end	
    respond_with @jogos
  end

  private
  
  def setar_classe_menu
    @class_lotofacil = 'active'  
  end
  
  def manage_params
    if (!params[:lotofacil].nil?) 
       params[:lotofacil].delete_if{|k,v| v.blank?}
    end
  end
  
end
