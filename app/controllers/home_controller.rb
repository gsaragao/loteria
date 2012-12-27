# encoding : utf-8
class HomeController < ApplicationController

  respond_to :html
  before_filter :setar_classe_menu

  def index
    @home = Home.new(params[:home])
    default_values
    @resultado = {}

    if params[:commit] == 'Verificar'

      lista = []

      if @home.tipo_confere == 'M'
        lista << @home
      elsif @home.tipo_confere == 'A'
        lista = Carrega.confere(@home.nome_arquivo)
      end      
      
      @resultado = Resultado.verificar(lista, @home)
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

    if @home.tipo_concurso.blank?
       @home.tipo_concurso = 'T'
    end

    if @home.tipo_confere.blank?
       @home.tipo_confere = 'M'
    end

    if @home.nome_arquivo.blank?
       @home.nome_arquivo = 'teste.ods'
    end
  end

end
