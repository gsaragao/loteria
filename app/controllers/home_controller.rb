# encoding : utf-8
require "rubygems"
require "java"
require 'Verificador.jar' 
require "mysql-connector-java-5.1.17-bin.jar"
java_import 'br.home.createbean.dao.Verificador'

class HomeController < ApplicationController

  respond_to :html
  before_filter :setar_classe_menu

  def index
    @home = Home.new(params[:home])
    default_values
    @resultado = {}

    begin

      if params[:commit] == 'Verificar'

        lista = []

        if @home.tipo_confere == 'M'
          lista << @home
          @resultado = Resultado.verificar(@home)
        elsif @home.tipo_confere == 'A'
          lista = Carrega.obter_dados_planilha_java(@home.nome_arquivo)

          Java::com.mysql.jdbc.Driver
          userurl = "jdbc:mysql://localhost/loteria_development"
          connSelect = java.sql.DriverManager.get_connection(userurl, "root", "1234")

          m = Verificador.new
          saida = m.executar(lista, connSelect, @home.qtde_dezenas.to_i, lista.size , @home.tipo_concurso, @home.operador, @home.concursos)

          if saida
            @resultado[:pontos_8] = saida[0]
            @resultado[:pontos_9] = saida[1]
            @resultado[:pontos_10] = saida[2]
            @resultado[:pontos_11] = saida[3]
            @resultado[:pontos_12] = saida[4]
            @resultado[:pontos_13] = saida[5]
            @resultado[:pontos_14] = saida[6]
            @resultado[:pontos_15] = saida[7]
            @resultado[:total_11] = saida[8]
            @resultado[:total_12] = saida[9]
            @resultado[:total_13] = saida[10]
            @resultado[:total_14] = saida[11]
            @resultado[:total_15] = saida[12]
            @resultado[:despesa] = saida[13]
            @resultado[:total] = saida[14]
            @resultado[:final] = saida[15]
            @resultado[:qtde_jogos] = saida[16]
            @resultado[:concurso11] = saida[17]
            @resultado[:concurso12] = saida[18]
            @resultado[:concurso13] = saida[19]
            @resultado[:concurso14] = saida[20]
            @resultado[:concurso15] = saida[21]
            @resultado[:categories] = saida[22]
            @resultado[:data_series] = saida[23]
          end  
          
          @resultado[:qtde_cartoes] = lista.size
        end      
        
      end    

    rescue Exception => e
      flash[:alert] = "Error: #{e.message}"  
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
