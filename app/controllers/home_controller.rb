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
    
    if params[:commit] == 'Verificar'

      lista = []

      if @home.tipo_confere == 'M'
        lista << @home
        @resultado = Resultado.verificar(lista, @home)
      elsif @home.tipo_confere == 'A'
        lista = Carrega.obter_dados_planilha_java(@home.nome_arquivo)

        Java::com.mysql.jdbc.Driver
        userurl = "jdbc:mysql://localhost/loteria_development"
        connSelect = java.sql.DriverManager.get_connection(userurl, "root", "1234")

        m = Verificador.new
        teste = m.executar(lista, connSelect, 15, "T", "=", "1")
        puts teste[0]
        puts teste[1]
        puts teste[2]
        puts teste[3]
        puts teste[4]
        puts teste[5]
        puts teste[6]
        puts teste[7]
        puts teste[8]
        puts teste[9]
        puts teste[10]
        puts teste[11]
        puts teste[12]
        puts teste[13]
        puts teste[14]
        puts teste[15]
      end      
      
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
