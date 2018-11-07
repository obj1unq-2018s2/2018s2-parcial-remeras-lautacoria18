class Sucursal {
	var property pedidos= []
	var property cantidadParaElDescuento= 0
	var property empresasConConvenio= []

	method costoTotalFacturadoPorSucursal() = pedidos.sum{pedido => pedido.precioTotal()}

	method totalDeRemeras() {
		var remerasTotales=[]
			pedidos.foreach{pedido =>  remerasTotales.add(pedido.remeras()) }
			return remerasTotales}

	method pedidoMasCaroDeSucursal() = pedidos.max{pedido => pedido.precioTotal()}



}




