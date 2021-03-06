import comercio.*
import remera.*
import comercio.*

class Pedido {

	// Esto solo debia ser una remera y contener tambien una constante
	// que indica cuantas remeras tiene el pedido.
	var property remeras = []
	var property sucursal

	method precioBase() {
		return remeras.sum{ remera => remera.costoTotal() }
	}

	method hayDescuento() = remeras.size() >= sucursal.cantidadParaElDescuento()

	method empresasConConvenioDeSucursal() = sucursal.empresasConConvenio()

	method hayConvenioEnRemeraDeEstampa() = self.empresasConConvenioDeSucursal().contains(remeras.head().empresa())

	// Devuelta, Esto es un error GRAVE, no repetirlo en el parcial.
	method porcentajeDeDescuento() = if (remeras.all{ remera => remera.tipoDeRemera() == "Bordada" }) 2 else if (remeras.all{ remera => remera.tipoDeRemera() == "Estampa" } and self.hayConvenioEnRemeraDeEstampa()) 20 else 10

	method descuentoAAplicar() = if (self.hayDescuento()) self.precioBase() * self.porcentajeDeDescuento() / 100 else 0

	method precioTotal() = self.precioBase() - self.descuentoAAplicar()

}

