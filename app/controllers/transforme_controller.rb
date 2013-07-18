# encoding : utf-8
require 'will_paginate/array'
class TransformeController < ApplicationController

  respond_to :html
  before_filter :setar_classe_menu

  def index
      
    @home = Home.new(params[:home])
    @resultado = []
    @resultado_total = []

    if params[:commit] == 'Transformar' 
      if validaForm
         @resultado_total = Transforme.transformar(@home)
         @resultado = @resultado_total.paginate(page: params[:page], per_page: 10)
      else
         flash[:alert] = "Alerta: Preencha os dados do formulário corretamente!"
      end   
    end
    
  end

  private
  
  def setar_classe_menu
    @class_transforme = 'active'  
  end

  def validaForm
    retorno = true
    retorno = false if @home.aa.blank? || @home.qtde_dezenas.blank?
    retorno
  end
end
