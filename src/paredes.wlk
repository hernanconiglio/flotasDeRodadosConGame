import wollok.game.*

class Pared {
	var property resistencia = 3
	var property position = game.origin()
	var property image = "paredLadrillos3.jpg"
	const property tipoObjeto = "pared"
	
	method choque() { 
		resistencia = 0.max(resistencia - 1) 
		if (self.resistencia() == 2) { self.image("paredLadrillos2.jpg") }
		else self.image("paredLadrillos1.jpg") 
	}
	
	
}
