class Visita
	attr_accessor :dni,:nombre,:fecha,:hora
	def initialize(dni,nombre,fecha,hora)
		@dni = dni
		@nombre = nombre
		@fecha = fecha
		@hora = hora
	end
end