# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130919025235) do

  create_table "homes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lotofacils", :force => true do |t|
    t.integer  "posicao"
    t.integer  "a"
    t.integer  "b"
    t.integer  "c"
    t.integer  "d"
    t.integer  "e"
    t.integer  "f"
    t.integer  "g"
    t.integer  "h"
    t.integer  "i"
    t.integer  "j"
    t.integer  "k"
    t.integer  "l"
    t.integer  "m"
    t.integer  "n"
    t.integer  "o"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "pontos_15"
    t.integer  "pontos_14"
    t.integer  "pontos_13"
    t.integer  "pontos_12"
    t.integer  "pontos_11"
    t.decimal  "total_premio", :precision => 13, :scale => 2
  end

  create_table "lotofacils16", :force => true do |t|
    t.integer  "posicao"
    t.integer  "a"
    t.integer  "b"
    t.integer  "c"
    t.integer  "d"
    t.integer  "e"
    t.integer  "f"
    t.integer  "g"
    t.integer  "h"
    t.integer  "i"
    t.integer  "j"
    t.integer  "k"
    t.integer  "l"
    t.integer  "m"
    t.integer  "n"
    t.integer  "o"
    t.integer  "p"
    t.integer  "pontos_15"
    t.integer  "pontos_14"
    t.integer  "pontos_13"
    t.integer  "pontos_12"
    t.integer  "pontos_11"
    t.decimal  "total_premio", :precision => 13, :scale => 2
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "lotofacils17", :force => true do |t|
    t.integer  "posicao"
    t.integer  "a"
    t.integer  "b"
    t.integer  "c"
    t.integer  "d"
    t.integer  "e"
    t.integer  "f"
    t.integer  "g"
    t.integer  "h"
    t.integer  "i"
    t.integer  "j"
    t.integer  "k"
    t.integer  "l"
    t.integer  "m"
    t.integer  "n"
    t.integer  "o"
    t.integer  "p"
    t.integer  "q"
    t.integer  "pontos_15"
    t.integer  "pontos_14"
    t.integer  "pontos_13"
    t.integer  "pontos_12"
    t.integer  "pontos_11"
    t.decimal  "total_premio", :precision => 13, :scale => 2
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "lotofacils18", :force => true do |t|
    t.integer  "posicao"
    t.integer  "a"
    t.integer  "b"
    t.integer  "c"
    t.integer  "d"
    t.integer  "e"
    t.integer  "f"
    t.integer  "g"
    t.integer  "h"
    t.integer  "i"
    t.integer  "j"
    t.integer  "k"
    t.integer  "l"
    t.integer  "m"
    t.integer  "n"
    t.integer  "o"
    t.integer  "p"
    t.integer  "q"
    t.integer  "r"
    t.integer  "pontos_15"
    t.integer  "pontos_14"
    t.integer  "pontos_13"
    t.integer  "pontos_12"
    t.integer  "pontos_11"
    t.decimal  "total_premio", :precision => 13, :scale => 2
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "resultados", :force => true do |t|
    t.integer  "concurso"
    t.date     "data"
    t.integer  "a"
    t.integer  "b"
    t.integer  "c"
    t.integer  "d"
    t.integer  "e"
    t.integer  "f"
    t.integer  "g"
    t.integer  "h"
    t.integer  "i"
    t.integer  "j"
    t.integer  "k"
    t.integer  "l"
    t.integer  "m"
    t.integer  "n"
    t.integer  "o"
    t.decimal  "rateio_15",  :precision => 13, :scale => 2
    t.decimal  "rateio_14",  :precision => 13, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "l1"
    t.integer  "l2"
    t.integer  "l3"
    t.integer  "l4"
    t.integer  "l5"
    t.integer  "c1"
    t.integer  "c2"
    t.integer  "c3"
    t.integer  "c4"
    t.integer  "c5"
  end

end
