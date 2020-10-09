import rodados.*
import dependencias.*

class Pedido {
	var property distancia = 0
	var property tiempoMax = 0
	var property cantPasajeros = 0
	const coloresIncompat = []
	
	method velocidadReq() { return 
		distancia / tiempoMax
	}
	
	method coloresIncompat(colores) {
		coloresIncompat.addAll(colores)
	}
	
	method coloresIncompat() { return coloresIncompat }
	
	method satisfacePedido(unAuto) { return
		unAuto.velMax() > self.velocidadReq() + 10 and 
		unAuto.capacidad() >= self.cantPasajeros() and
		not coloresIncompat.contains(unAuto.color())
	}
	

	
	method acelerar() { tiempoMax = 0.max(tiempoMax - 1) }
	
	method relajar() { tiempoMax += 1 }
	
}
