class PremiacaoController < ApplicationController

  respond_to :html
  before_filter :setar_classe_menu
  
  def index
  end

  private
  
  def setar_classe_menu
    @class_premiacao = 'active'  
  end
end
