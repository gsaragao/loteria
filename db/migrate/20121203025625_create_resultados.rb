class CreateResultados < ActiveRecord::Migration
  def change
    create_table :resultados do |t|
      t.integer :concurso
      t.date :data
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

      t.timestamps
    end
  end
end
