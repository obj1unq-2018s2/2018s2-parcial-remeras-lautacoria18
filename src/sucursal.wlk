class Sucursal {
	var property pedidos= []
	var property cantidadParaElDescuento= 0
	var property empresasConConvenio= []

	method costoTotalFacturadoPorSucursal() = pedidos.sum{pedido => pedido.precioTotal()}

	method totalDeRemeras() {
		
			return pedidos.flatMap{pedido =>  pedido.remeras() }}
			

	method pedidoMasCaroDeSucursal() = pedidos.max{pedido => pedido.precioTotal()}



}




