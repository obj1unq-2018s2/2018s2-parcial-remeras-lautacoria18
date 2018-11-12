import pedido.*
import sucursal.*
import comercio.*

// Cuida la identacion por favor, no solo a favor de la lectura
// incluso hay lenguajes en donde el identado es obligatorio.

class RemeraLisa {

	var property color
	const property talle = 0

	method costoPorTalle() = if (talle.between(32, 40)) 80 else if (talle.between(41, 48)) 100

	// Esto se puede mejorar usando una coleccion de colores y preguntando
	// Si lo incluye el color.
	method costoTotal() = if (not (color == "Blanco" or color == "Negro" 
						  or color == "Gris")) self.costoPorTalle()
						   + self.costoPorTalle() * 0.10 
						   else self.costoPorTalle()

	// Esto es un error GRAVE, lamentablemente te resto muchos puntos esto.
	// Debes usar polimorfismo para los descuentos, aqui deberia estar el
	// metodo descuento() y tener cuando es su descuento.
	// nunca debes preguntar a un objeto quien es para saber algo a lo patovica.
	// Siempre pedile lo que necesitas de ella.
	method tipoDeRemera() = "Lisa"

}

class RemeraBordada inherits RemeraLisa {

	var property bordados = []

	override method costoTotal() = super() + self.costoExtraPorBordado()

	method costoExtraPorBordado() = if (bordados.size().between(1, 2)) 20 else if (bordados.size() > 2) bordados.size() * 10

	// Esto es un error GRAVE, lamentablemente te resto muchos puntos esto.
	// Debes usar polimorfismo para los descuentos, aqui deberia estar el
	// metodo descuento() y tener cuando es su descuento.
	// nunca debes preguntar a un objeto quien es para saber algo a lo patovica.
	// Siempre pedile lo que necesitas de ella.
	override method tipoDeRemera() = "Bordada"

}

class RemeraEstampada inherits RemeraLisa {

	var property alto = 0
	var property ancho = 0
	var property empresa

	override method costoTotal() = super() + self.costoDeSublimado() + self.costoDeDerechosDeAutor()

	method costoDeSublimado() {
		return alto * ancho * 0.5
	}

	method costoDeDerechosDeAutor() {
		return empresa.costoDerechosDeAutor()
	}

	// Esto es un error GRAVE, lamentablemente te resto muchos puntos esto.
	// Debes usar polimorfismo para los descuentos, aqui deberia estar el
	// metodo descuento() y tener cuando es su descuento.
	// nunca debes preguntar a un objeto quien es para saber algo a lo patovica.
	// Siempre pedile lo que necesitas de ella.
	override method tipoDeRemera() = "Estampa"

}

// Buena onda en crear la Empresa.
class Empresa {

	var property costoDerechosDeAutor = 0

}

