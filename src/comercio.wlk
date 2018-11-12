import pedido.*
import remera.*
import remera.*

// No esta bueno que tenga los pedidos aca.
// Deberian estar solamente en sucursal
// De hecho, te queda el problema de que hay duplicidad de
// pedidos en ambas clases.
class Comercio {

	var property sucursales = []
	var property pedidos = #{}

	method registrarPedido(pedido) {
		pedidos.add(pedido)
	}

	method totalFacturadoPorComercio() = sucursales.sum{ sucursal => sucursal.costoTotalFacturadoPorSucursal() }

	method totalFacturadoPorSucursal(sucursal) = sucursal.costoTotalFacturadoPorSucursal()

	// ESto no retorna el total de remeras, retorna una lista de remeras.
	// esto debio tener un size al final.
	method totalDeRemerasEnComercio() {
		return pedidos.flatMap{ pedido => pedido.remeras() }
	}

	// Aca estaria bien, pero el problema que tenes es que remera
	// No entiende el mensaje colores(), solo color()
	method remerasDeColor() {
		return self.totalDeRemerasEnComercio().flatMap{ remera => remera.colores() }
	}

	method cantidadDeRemerasDeColor(color) = self.remerasDeColor().count{ colorDeRemera => colorDeRemera == color }

	method pedidoMasCaroDeComercio() = sucursales.max{ sucursal => sucursal.pedidoMasCaroDeSucursal() }

	// Estas mezclando cosas aca.
	// map retorna una nueva coleccion, por lo que si la usas con un bloque
	// que usa el metodo size, el cual no retorna nada, dara errores siempre.
	// No debias usar variables, solamente un map en donde preguntabas el talle.
	method tallesDeRemerasEnComercio() {
		var tallesTotales = []
		self.totalDeRemerasEnComercio().map{ remera => tallesTotales.add(remera.talle())}
		return tallesTotales
	}

	// Esto devuelve una lista de remeras.
	method tallesSinPedidos() {
		var talles = new Range(32, 48)
		return pedidos.flatMap{ pedido => pedido.remeras() }
	}

	method sucursalQueMasFacturo() {
		return sucursales.max{ sucursal => sucursal.costoTotalFacturadoPorSucursal() }
	}

	// Incompleto.
	method sucursalQueVendioTodosLosTalles() {
		var sucursalesQueVendieron = []
	}

}

