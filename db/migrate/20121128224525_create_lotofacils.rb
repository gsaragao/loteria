class CreateLotofacils < ActiveRecord::Migration
  def change
    create_table :lotofacils do |t|
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
