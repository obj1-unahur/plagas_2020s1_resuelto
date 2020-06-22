import elementos.*
class Plagas {
	
	var property poblacion = 0
	method transmiteEnfermedades() = poblacion >= 10
	method atacar(elemento) {
		elemento.recibirAtaque(self)
		poblacion *= 1.1
	}
	method nivelDanio()  
	
}

class Cucaracha inherits Plagas {
	var property pesoPromedio = 0

	override method nivelDanio() = poblacion / 2
	
	override method transmiteEnfermedades() {
		return super() and pesoPromedio >= 10
	}
	
	override method atacar(elemento) {
		super(elemento)
		pesoPromedio += 2
	}
}

class Pulgas inherits Plagas{
	override method nivelDanio() = poblacion * 2
	
}

class Garrapatas inherits Pulgas {
	override method atacar(elemento) {
		elemento.recibirAtaque(self)
		poblacion *= 1.2
	}
}


class Mosquito inherits Plagas {
	override method nivelDanio() = poblacion
	override method transmiteEnfermedades() {
		return super() and poblacion % 3 == 0
	}	
}
