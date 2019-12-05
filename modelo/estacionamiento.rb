class Estacionamiento
	attr_accessor :placa,:vehiculo,:marca
	def initialize(placa,vehiculo,marca)
		@placa = placa
		@vehiculo = vehiculo
		@marca = marca
	end
end