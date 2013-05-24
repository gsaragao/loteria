begin
require "rubygems"
require "java"
require "mysql-connector-java-5.1.17-bin.jar"
#java_import 'br.home.createbean.dao.MySqlDAO' 
java_import 'br.home.createbean.dao.Verificador' 

Java::com.mysql.jdbc.Driver
userurl = "jdbc:mysql://localhost/loteria_development"
connSelect = java.sql.DriverManager.get_connection(userurl, "root", "1234")

lista = []

home = []

home[0] = 1
home[1] = 2
home[2] = 3 
home[3] = 4 
home[4] = 5
home[5] = 8
home[6] = 10
home[7] = 12
home[8] = 15
home[9] = 17
home[10] = 19
home[11] = 21
home[12] = 22
home[13] = 23
home[14] = 24

lista << home

m = Verificador.new
#public Map<String, Object> executar(Integer[][] lista, Connection conn, int qtdeDezenas, String tipoConcurso, String operador, String concursos) 
teste = m.executar(lista, connSelect, 15, "T", "=", "1")

puts teste[0]
puts teste[1]
puts teste[2]
puts teste[3]
puts teste[4]
puts teste[5]
puts teste[6]
puts teste[7]
puts teste[8]
puts teste[9]
puts teste[10]
puts teste[11]
puts teste[12]
puts teste[13]
puts teste[14]
puts teste[15]
 
end


			
