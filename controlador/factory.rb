require "../modelo/visita.rb"
require "../modelo/familia.rb"
require "../modelo/paquete.rb"
require "../modelo/estacionamiento.rb"
class Factory
	def self.crearVisita(dni,nombre,fecha,hora)
		obj = Visita.new(dni,nombre,fecha,hora)
		return obj
	end
	def self.crearFamilia(afamiliar,ntorre,ndepa)
		obj = Familia.new(afamiliar,ntorre,ndepa)
		return obj
	end
	def self.crearPaquete(tipo,tamano)
		obj = Paquete.new(tipo,tamano)
		return obj
	end
	def self.crearEstacionamiento(placa,vehiculo,marca)
		obj = Estacionamiento.new(placa,vehiculo,marca)
		return obj
	end
end