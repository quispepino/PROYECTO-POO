require "../controlador/factory.rb"

$arregloVisitas = Array.new
$arregloFamilias = Array.new
$arregloPaquetes = Array.new
$arregloEstacionamientos = Array.new
$arregloVisitantes = Array.new

def MenuPrincipal()
	begin
		system("cls")
		puts"*********SISTEMA DE VISITANTES********"
		puts"1. Registrar nueva Visita"
		puts"2. Registrar nueva Familia"
		puts"3. Registrar nuevo Paquete"
		puts"4. Registrar nuevo Estacionamiento"
		puts"5. Listar Visitas"
		puts"6. Listar Familias"
		puts"7. Listar Paquetes"
		puts"8. Listar Estacionamientos"
		puts"9. Registrar Visitantes"
		puts"10. Reporte - Visitantes al condominio por familia"
		puts"11. Salir"
		puts"Seleccione una opcion: "
		opcion = gets.chomp.to_i
	end until(opcion>=1 and opcion<=11)
	case opcion
		when 1
			registrarVisita()
		when 2
			registrarFamilia()
		when 3
			registrarPaquete()
		when 4
			registrarEstacionamiento()
		when 5
			listarVisitas()
		when 6
			listarFamilias()
		when 7
			listarPaquetes()
		when 8
			listarEstacionamientos()
		when 9
			registrarVisitantes()
		when 10
			reporteVisitantes()
	end
end

def registrarVisita()
	system("cls")
	puts"*********REGISTRAR NUEVA VISITA********"
	puts"Ingrese DNI: "
	dni = gets.chomp
	puts"Ingrese Nombre: "
	nombre = gets.chomp
	puts"Ingrese Fecha: "
	fecha = gets.chomp
	puts"Ingrese Hora: "
	hora = gets.chomp
	obj = Factory.crearVisita(dni,nombre,fecha,hora)
	$arregloVisitas.push(obj)
	puts
	puts "Visita Registrada!"
	system("pause")
	MenuPrincipal()
end

def registrarFamilia()
	system("cls")
	puts"*********REGISTRAR NUEVA FAMILIA********"
	puts "Ingrese Apellido Familiar: "
	afamiliar = gets.chomp
	puts "Ingrese N° Torre: "
	ntorre = gets.chomp
	puts "Ingrese N° Departamento: "
	ndepa = gets.chomp.to_i
	obj = Factory.crearFamilia(afamiliar,ntorre,ndepa)
	$arregloFamilias.push(obj)
	puts
	puts "Familia Registrada!"
	system("pause")
	MenuPrincipal()
end

def registrarPaquete()
	system("cls")
	puts"*********REGISTRAR NUEVO PAQUETE********"
	puts"Ingrese Tipo: "
	tipo = gets.chomp
	puts"Ingrese Tamano: "
	tamano = gets.chomp
	obj = Factory.crearPaquete(tipo,tamano)
	$arregloPaquetes.push(obj)
	puts
	puts "Paquete Registrado!"
	system("pause")
	MenuPrincipal()
end

def registrarEstacionamiento()
	system("cls")
	puts"*********REGISTRAR NUEVO ESTACIONAMIENTO********"
	puts"Ingrese Placa: "
	placa = gets.chomp
	puts"Ingrese Vehiculo: "
	vehiculo = gets.chomp
	puts"Ingrese Marca: "
	marca = gets.chomp
	obj = Factory.crearEstacionamiento(placa,vehiculo,marca)
	$arregloEstacionamientos.push(obj)
	puts
	puts "Estacionamiento Registrado!"
	system("pause")
	MenuPrincipal()
end

def listarVisitas()
	system("cls")
	puts"*********VISITAS REGISTRADAS********"
	print"DNI".ljust(13)
	print"NOMBRE".ljust(13)
	print"FECHA".ljust(13)
	print"HORA".ljust(13)
	puts
	$arregloVisitas.each do |item|
		print "#{item.dni}".ljust(13)
		print "#{item.nombre}".ljust(13)
		print "#{item.fecha}".ljust(13)
		print "#{item.hora}".ljust(13)
		puts
	end
	puts
	system("pause")
	MenuPrincipal()
end

def listarFamilias()
	system("cls")
	puts"*********FAMILIAS REGISTRADAS********"
	print"AFAMILIAR".ljust(13)
	print"NTORRE".ljust(13)
	print"NDEPA".ljust(13)
	puts
	$arregloFamilias.each do |item|
		print "#{item.afamiliar}".ljust(13)
		print "#{item.ntorre}".ljust(13)
		print "#{item.ndepa}".ljust(13)
		puts
	end
	puts
	system("pause")
	MenuPrincipal()
end

def listarPaquetes()
	system("cls")
	puts"*********PAQUETES REGISTRADOS********"
	print"TIPO".ljust(13)
	print"TAMANO".ljust(13)
	puts
	$arregloPaquetes.each do |item|
		print "#{item.tipo}".ljust(13)
		print "#{item.tamano}".ljust(13)
	end
	puts
	system("pause")
	MenuPrincipal()
end

def listarEstacionamientos()
	system("cls")
	puts"*********ESTACIONAMIENTOS REGISTRADOS********"
	print"PLACA".ljust(13)
	print"VEHICULO".ljust(13)
	print"MARCA".ljust(13)
	puts
	$arregloEstacionamientos.each do |item|
		print "#{item.placa}".ljust(13)
		print "#{item.vehiculo}".ljust(13)
		print "#{item.marca}".ljust(13)
		puts
	end
	puts
	system("pause")
	MenuPrincipal()
end

def registrarVisitantes()
	system("cls")
	puts"*********REGISTRAR VISITANTES********"

	puts"Ingrese DNI de la visita: "
	dni = gets.chomp
	visita = $arregloVisitas.find_all{|v| v.dni == dni}
	if(visita == [])
		puts "La visita no se encuentra"
		system("pause")
		MenuPrincipal()
	end
	puts "#{visita[0].dni} - #{visita[0].nombre} - #{visita[0].fecha} - #{visita[0].hora}"
	puts

	puts "Ingrese apellido de la familia: "
	afamiliar = gets.chomp
	familia = $arregloFamilias.find_all{|f| f.afamiliar == afamiliar}
	if(familia == [])
		puts "La familia no se encuentra"
		system("pause")
		MenuPrincipal()
	end
	puts "#{familia[0].afamiliar} - #{familia[0].ntorre} - #{familia[0].ndepa}"
	puts

	puts"Ingrese tipo de paquete: "
	tipo = gets.chomp
	paquete = $arregloPaquetes.find_all{|p| p.tipo == tipo}
	if(paquete == [])
		puts "El paquete no se encuentra"
		system("pause")
		MenuPrincipal()
	end
	puts "#{paquete[0].tipo} - #{paquete[0].tamano}"
	puts

	puts"Ingrese placa para el estacionamiento: "
	placa = gets.chomp
	estacionamiento = $arregloEstacionamientos.find_all{|e| e.placa == placa}
	if(estacionamiento == [])
		puts "El estacionamiento no se encuentra"
		system("pause")
		MenuPrincipal()
	end
	puts "#{estacionamiento[0].placa} - #{estacionamiento[0].vehiculo} - #{estacionamiento[0].marca}"
	puts

	item = [visita[0],familia[0],paquete[0],estacionamiento[0]]
	$arregloVisitantes.push(item)

	puts "Visitante Registrado!"
	system("pause")
	MenuPrincipal()
end

def reporteVisitantes()
	system("cls")
	puts"*********REPORTE VISITANTES********"

	puts "Ingrese apellido de la familia"
	afamiliar = gets.chomp

	print "DNI".ljust(13)
	print "Nombre".ljust(13)
	print "Fecha".ljust(13)
	print "Hora".ljust(13)
	print "A.Familiar".ljust(13)
	print "N°Torre".ljust(13)
	print "N°Depa".ljust(13)
	print "Tipo".ljust(13)
	print "Tamano".ljust(13)
	print "Placa".ljust(13)
	print "Vehiculo".ljust(13)
	print "Marca".ljust(13)
	puts
	$arregloVisitantes.each do |item|
		if(item[1].afamiliar == afamiliar)
			print "#{item[0].dni}".ljust(13)
			print "#{item[0].nombre}".ljust(13)
			print "#{item[0].fecha}".ljust(13)
			print "#{item[0].hora}".ljust(13)
			print "#{item[1].afamiliar}".ljust(13)
			print "#{item[1].ntorre}".ljust(13)
			print "#{item[1].ndepa}".ljust(13)
			print "#{item[2].tipo}".ljust(13)
			print "#{item[2].tamano}".ljust(13)
			print "#{item[3].placa}".ljust(13)
			print "#{item[3].vehiculo}".ljust(13)
			print "#{item[3].marca}".ljust(13)
			puts
		end
	end
	puts
	system("pause")
	MenuPrincipal()
end

MenuPrincipal()