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

    if params[:commit] == 'Verificar' || !params[:jogo].blank?

      lista = []

      if !params[:jogo].blank?  
        @home.qtde_dezenas = params[:qtde_dezenas]
        atribuir_jogo
      end  

      if @home.tipo_confere == 'M'
        lista << @home
        @resultado = Resultado.verificar(@home)
      elsif @home.tipo_confere == 'A'

        begin

          lista = Carrega.obter_dados_planilha_java(@home.nome_arquivo)

          Java::com.mysql.jdbc.Driver
          userurl = "jdbc:mysql://localhost/loteria_development"
          connSelect = java.sql.DriverManager.get_connection(userurl, "root", "1234")

          m = Verificador.new
          saida = m.executar(lista, connSelect, @home.qtde_dezenas.to_i, lista.size , @home.tipo_concurso, @home.operador, @home.concursos)

        rescue Exception => e
          flash[:alert] = "Error: #{e.message}"  
        end  

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
       @home.nome_arquivo = 'teste15.ods'
    end
  end

  def atribuir_jogo

#$ intersection = conta.attributes.keys && verba.attributes.keys
#$ conta.attributes = verba.attributes.select {|k, v| intersection.include? k}

    if @home.qtde_dezenas == '15'
      jogo = Lotofacil.find(params[:jogo])
    elsif @home.qtde_dezenas == '16'
      jogo = Lotofacil16.find(params[:jogo])
    elsif @home.qtde_dezenas == '17'
      jogo = Lotofacil17.find(params[:jogo])
    elsif @home.qtde_dezenas == '18'
      jogo = Lotofacil18.find(params[:jogo])
    end  

    @home.aa = jogo.a
    @home.bb = jogo.b
    @home.cc = jogo.c
    @home.dd = jogo.d  
    @home.ee = jogo.e 
    @home.ff = jogo.f 
    @home.gg = jogo.g 
    @home.hh = jogo.h 
    @home.ii = jogo.i 
    @home.jj = jogo.j 
    @home.kk = jogo.k 
    @home.ll = jogo.l 
    @home.mm = jogo.m 
    @home.nn = jogo.n 
    @home.oo = jogo.o 
    @home.pp = jogo.p if @home.qtde_dezenas.to_i > 15
    @home.qq = jogo.q if @home.qtde_dezenas.to_i > 16
    @home.rr = jogo.r if @home.qtde_dezenas.to_i > 17
    
  end

end
