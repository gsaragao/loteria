class AddPontosToLotofacil < ActiveRecord::Migration
  def change

  	add_column :lotofacils, :pontos_15, :integer
  	add_column :lotofacils, :pontos_14, :integer
  	add_column :lotofacils, :pontos_13, :integer
  	add_column :lotofacils, :pontos_12, :integer
  	add_column :lotofacils, :pontos_11, :integer
  	add_column :lotofacils, :total_premio, :decimal, :precision => 13, :scale => 2
  end
end
