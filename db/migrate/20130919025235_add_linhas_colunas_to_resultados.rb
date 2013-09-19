class AddLinhasColunasToResultados < ActiveRecord::Migration
  def change

  	#linhas
  	add_column :resultados, :l1, :integer
  	add_column :resultados, :l2, :integer
  	add_column :resultados, :l3, :integer
  	add_column :resultados, :l4, :integer
  	add_column :resultados, :l5, :integer

  	#colunas
  	add_column :resultados, :c1, :integer
  	add_column :resultados, :c2, :integer
  	add_column :resultados, :c3, :integer
  	add_column :resultados, :c4, :integer
  	add_column :resultados, :c5, :integer
  end
end
