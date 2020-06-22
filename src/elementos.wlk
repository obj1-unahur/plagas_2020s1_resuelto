import plagas.*

class Elemento {
	method esBueno()
	method recibirAtaque(plaga)
}

class Hogar inherits Elemento{
	var property mugre = 0
	var property confort = 0
	
	 override method esBueno() = mugre <= confort / 2
	
	override method recibirAtaque(plaga) {
		mugre += plaga.nivelDanio()
	}
}

class Huerta  inherits Elemento{
	var property produccion = 0
	var property nivel = nivelProduccion
	
	
	override method esBueno() = produccion > nivel.nivel()
	override method recibirAtaque(plaga) {
		produccion -= plaga.nivelDanio() * 0.1
		if (plaga.transmiteEnfermedades()){
			produccion = 0.max(produccion - 10)
		}
		
	}
}

object nivelProduccion {
	var property nivel = 10
}

class Mascota inherits Elemento {
	var property salud = 0
	override method esBueno() = salud > 250 
	override method recibirAtaque(plaga) {
		if (plaga.transmiteEnfermedades()) {
			salud = 0.max( salud - plaga.nivelDanio())
		}
	}
	
}

class Barrios {
	var property elementos = []
	
	method addElementos(elementosList) {
		elementos.add(elementosList)
	}
	
	method contarBuenos() {
		return elementos.count ({e => e.esBueno()})
	}
	
	
	
	method esCopado() {
		const buenos = self.contarBuenos()
		const malos = elementos.size() - malos
		return buenos > malos
	}
}
