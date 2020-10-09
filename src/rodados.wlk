/* para crear una clase se usa la siguiente sintaxis:
 * const corsa1 = new Corsa(color=rojo,metalizado=true)
 * 
 * 
 */
import wollok.game.*

object azul {}
object rojo {}
object negro {}
object blanco {}
object verde {}
object beige {}

object norte {}
object sur {}
object oeste {}
object este {}


class Corsa {
	var property color = null
	var property position = game.origin()
	const property posiciones = [self.position()]
	const property filas = [0]
	
	method capacidad() { return 4 }
	method velMax() { return 150 }
	method peso() { return 1300 }
	
	method moverseHacia(direccion) {
		if (direccion == norte) { 
			self.position(self.position().up(1)) 
			filas.add(filas.last()+1)
		}
		else if (direccion == sur) { 
			self.position(self.position().down(1))
			filas.add(filas.last()-1)
		}
		else if (direccion == oeste) { 
			self.position(self.position().left(1))
		}
		else { 
			self.position(self.position().right(1))
		}
		posiciones.add(self.position())
	}
	
	method pasoPor(posicion) { return
		posiciones.contains( posicion )
	}
	
	method pasoPorFila(numero) { return
		filas.contains(numero)
	}
	
	method recorrioFilas(lista_de_numeros) { return
		lista_de_numeros.asSet().difference(filas.asSet()) == #{}
	}

}


class Kwid {
	var tanqueAdicional = false
	const color = azul
	var posicion = null
	var direc = null

	method ponerTanque() { tanqueAdicional = true }
	method quitarTanque() { tanqueAdicional = false }
	method capacidad() { return if (tanqueAdicional) { 3 } else { 4 } }
	method velMax() { return if (tanqueAdicional) { 110 } else { 120 }  }
	method peso() { return if (tanqueAdicional) { 1350 } else { 1200 } }
	method color() { return color }
	method moverseHacia(direccion) { direc = direccion }
	method setPosition(a,b) { 
		posicion = new Position(x = a, y = b )
	}

}

object traffic {
	var interior = null
	var motor = null
	const color = blanco
	var posicion = null
	var direc = null
	
	method setInterior(unInterior) { interior = unInterior }
	method setMotor(unMotor) { motor = unMotor }
	method capacidad() { return interior.capacidad() }
	method color() { return color }
	method peso() { return 4000 + interior.peso() + motor.peso() }	
	method velMax() { return motor.velMax() }
	method moverseHacia(direccion) { direc = direccion }
	method setPosition(a,b) { 
		posicion = new Position(x = a, y = b )
	}

}

object interiorComodo {
	const capacidad = 5
	const peso = 700
	
	method capacidad() { return capacidad }
	method peso() {return peso } 
	
}

object interiorPopular {
	method capacidad() = 12
	method peso() = 1000
}

object motorPulenta {
	method peso() = 800
	method velMax() = 130
	
}
object motorBataton {
	method peso() = 500
	method velMax() = 80
}


class AutoEspecial {
	var property capacidad = null
	var property velMax = null
	var property peso = null
	var property color = null
	var posicion = null
	var direc = null
	
	method moverseHacia(direccion) { direc = direccion }
	method setPosition(a,b) { 
		posicion = new Position(x = a, y = b )
	}

}