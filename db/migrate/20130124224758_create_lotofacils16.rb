class CreateLotofacils16 < ActiveRecord::Migration
  def change
    create_table :lotofacils16 do |t|
      t.integer :posicao
      t.integer :a
      t.integer :b
      t.integer :c
      t.integer :d
      t.integer :e
      t.integer :f
      t.integer :g
      t.integer :h
      t.integer :i
      t.integer :j
      t.integer :k
      t.integer :l
      t.integer :m
      t.integer :n
      t.integer :o
      t.integer :p
      t.integer :pontos_15
	  	t.integer :pontos_14
	  	t.integer :pontos_13
	  	t.integer :pontos_12
	  	t.integer :pontos_11
	  	t.decimal :total_premio, :precision => 13, :scale => 2

      t.timestamps
    end
  end
end
