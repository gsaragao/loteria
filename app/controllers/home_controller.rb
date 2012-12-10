# encoding : utf-8
class HomeController < ApplicationController

  respond_to :html
  before_filter :setar_classe_menu

  def index
    @home = Home.new(params[:home])
    default_values
    @resultado = []
    
    if params[:commit] == 'Gerar'
      @jogos = Lotofacil.pesquisar(@home)
    end  

    if params[:commit] == 'Verificar'
      @resultado = Resultado.verificar(@home)
    end    

  end

  private
  
  def setar_classe_menu
    @class_home = 'active'  
  end

  def default_values
    
    if @home.qtde_dezenas.blank?
       @home.qtde_dezenas = 15
    end

    if @home.a.blank?
       @home.a = [1,2]
    end  
    if @home.b.blank?         
       @home.b = [2,3,4]
    end
    if @home.c.blank? 
       @home.c = [3,4,5,6]
    end
    if @home.d.blank? 
       @home.d = [4,5,6,7,8]
    end
    if @home.e.blank? 
       @home.e = [6,7,8,9,10]
    end
    if @home.f.blank? 
       @home.f = [8,9,10,11,12]
    end
    if @home.g.blank? 
       @home.g = [10,11,12,13]
    end
    if @home.h.blank? 
       @home.h = [11,12,13,14,15]
    end
    if @home.i.blank? 
       @home.i = [13,14,15,16,17]
    end
    if @home.j.blank? 
       @home.j = [15,16,17,18]
    end
    if @home.k.blank? 
       @home.k = [16,17,18,19,20]
      end
    if @home.l.blank? 
       @home.l = [18,19,20,21,22]
    end
    if @home.m.blank? 
        @home.m = [20,21,22,23]
    end
    if @home.n.blank? 
        @home.n = [22,23,24]
    end
    if @home.o.blank? 
        @home.o = [24,25]
    end

  end

end
