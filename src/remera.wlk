import pedido.*
import sucursal.*
import comercio.*
	class RemeraLisa {
		var property color
		const property talle= 0
		
		
		method costoPorTalle() = if (talle.between(32,40)) 80
										else if (talle.between(41,48)) 100
	
		method costoTotal() = if (not(color == "Blanco" or color == "Negro" or color == "Gris") ) self.costoPorTalle() + self.costoPorTalle() * 0.10
							
								else self.costoPorTalle() 
								
								
		method tipoDeRemera()= "Lisa"
	
	
	
	
}

class RemeraBordada inherits RemeraLisa {
	
	var property bordados=[]
	
	
	override method costoTotal() = super() + self.costoExtraPorBordado()
	
	
	method costoExtraPorBordado() = if (bordados.size().between(1, 2)) 20
										else if (bordados.size()>2) bordados.size() * 10
										
	override method tipoDeRemera()= "Bordada"
	
	
}

class RemeraEstampada inherits RemeraLisa {
	var property alto=0
	var property ancho=0
	var property empresa

	
	override method costoTotal() = super() + self.costoDeSublimado() + self.costoDeDerechosDeAutor()
	
	method costoDeSublimado() {return alto * ancho * 0.5}
	
	method costoDeDerechosDeAutor() {return empresa.costoDerechosDeAutor()} 
	

	
	override	method tipoDeRemera()= "Estampa"
}

class Empresa {
	var property costoDerechosDeAutor=0
	
	
}