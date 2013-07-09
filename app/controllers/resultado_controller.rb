# encoding : utf-8
class ResultadoController < ApplicationController

  respond_to :html
  before_filter :setar_classe_menu
  before_filter :manage_params, :only => [:index]
  before_filter :load_resultado , :only => [:show, :edit, :update, :destroy]

  def index
    @resultado = Resultado.new(params[:resultado])
    @resultados = @resultado.pesquisar(params[:page])
    respond_with @resultados
  end

  def acompanhamento
    @resultados = Resultado.acompanhamento
    @resultados = @resultados.sort_by { |result| result[0] }
    respond_with @resultados
  end

  def inverso
    @resultados = Resultado.inverso
    @resultados = @resultados.sort_by { |result| result[0] }
    respond_with @resultados
  end

  def new
    load_combos
    @action = "create"
    @resultado = Resultado.new
    respond_with @resultado
  end

  def edit
    load_combos
    @action = "update"
  end

  def create
    @resultado = Resultado.new(params[:resultado])
    
    if @resultado.save
      flash[:notice] = t('msg.create_sucess')
      redirect_to resultado_index_path
    else
      load_combos
      render :action => :new 
    end
     
  end

  def update
    if @resultado.update_attributes(params[:resultado])
      flash[:notice] = t('msg.update_sucess')
      redirect_to resultado_index_path
    else
      load_combos
      render :action => :edit
    end
  end

  def destroy
    
    if @resultado.destroy
      flash[:notice] = t('msg.destroy_sucess')
    else
      flash[:alert] = @resultado.errors.full_messages[0]
    end

    redirect_to resultado_index_path
  end
  
  private
  
  def setar_classe_menu
    @class_resultado = 'active'  
  end
  
  def load_resultado
    begin
      @resultado = Resultado.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = t('msg.data_not_found')
      redirect_to resultado_index_path
    end
  end
  
  def load_combos 
    #Collections
  end
  
  def manage_params
    if (!params[:resultado].nil?) 
       params[:resultado].delete_if{|k,v| v.blank?}
    end
  end
  
end
