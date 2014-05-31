# encoding: UTF-8
class Lotofacil16 < ActiveRecord::Base
  attr_accessible :posicao, :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :p, :pontos_15, 
  :pontos_14, :pontos_13, :pontos_12, :pontos_11, :total_premio

self.per_page = 10

  def self.pesquisar(obj)
  	
	sql = ' select count(*) total from lotofacils16 '		
	sql += ' where a in (' + obj.a.join(",") + ')'
	sql += ' and b in (' + obj.b.join(",") + ')'
	sql += ' and c in (' + obj.c.join(",") + ')'
	sql += ' and d in (' + obj.d.join(",") + ')'
	sql += ' and e in (' + obj.e.join(",") + ')'
	sql += ' and f in (' + obj.f.join(",") + ')'
	sql += ' and g in (' + obj.g.join(",") + ')'
	sql += ' and h in (' + obj.h.join(",") + ')'
	sql += ' and i in (' + obj.i.join(",") + ')'
	sql += ' and j in (' + obj.j.join(",") + ')'
	sql += ' and k in (' + obj.k.join(",") + ')'
	sql += ' and l in (' + obj.l.join(",") + ')'
	sql += ' and m in (' + obj.m.join(",") + ')'
	sql += ' and n in (' + obj.n.join(",") + ')'
	sql += ' and o in (' + obj.o.join(",") + ')'
	sql += ' and p in (' + obj.p.join(",") + ')'

	find_by_sql(sql)

  end

end
