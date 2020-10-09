/* en el test voy a tener que hacer 
 * const deportes = new Dependencia()
 * deportes.cantEmpleados(45)
 * o se puede hacer directamente const deportes = new Dependencia(cantEmpleados=40)
 */
import rodados.*
import pedidos.*

class Dependencia {
	const flota = []
	var property cantEmpleados = 0
	const pedidos = []
	
	method agregarAFlota(rodado) { 
		flota.add(rodado)
	}
	
	method quitarDeFlota(rodado) {
		flota.remove(rodado)
	} 
	
	method pesoTotalFlota() { return
		flota.sum( { r=>r.peso() } )
	} 
	
	method estaBienEquipada() { return
		flota.size() >= 3 and flota.all( { r=>r.velMax() >= 100} ) 
	}
	
	method capacidadTotalEnColor(color) { return
		flota.filter( {r=>r.color() == color } ).sum( { r=>r.capacidad() } )
	}
	
	 method colorDelRodadoMasRapido() { return
	 	flota.max( { r=>r.velMax() } ).color()
	 } 
	 
	 method capacidadFaltante() { return
	 	0.max(self.cantEmpleados() - flota.sum( { f=>f.capacidad() } ) )
	 }
	 method esGrande() { return
	 	self.cantEmpleados() >= 40 and flota.size() >= 5
	 }
	 
	 method agregarPedido(pedido) { pedidos.add(pedido) }
	 
	 method quitarPedido(pedido) { pedidos.remove(pedido) }
	 
	 method totalPasajerosEnPedidos() { return 
	 	pedidos.sum( { p=>p.cantPasajeros() } )
	 }
	 
	 method pedidosNoSatisfechos() { return
	 	pedidos.filter( { p=>self.flotaSatisfacePedido(p) } )

	 }
	 
	 method flotaSatisfacePedido(pedido) { return
	 	flota.any( { a=> pedido.satisfacePedido(a) })
	 	
	 }
	 
	 method colorIncompatibleEnPedidos(color) { return
	 	pedidos.all( { p=>p.coloresIncompat().any( { c=>c == color } ) } ) 
	 }
	 
	 method relajarPedidos() { 
	 	pedidos.forEach( { p=>p.relajar() } )
	 }
	 
}


/* hacer hasta test de 2 dependencias */