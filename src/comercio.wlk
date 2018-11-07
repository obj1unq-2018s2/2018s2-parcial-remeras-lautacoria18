class Comercio {
	
	var property sucursales= []
	var property pedidos = #{}
	
	
	method registrarPedido(pedido) {pedidos.add(pedido)}
	
	method totalFacturadoPorComercio()= 
				sucursales.sum{sucursal => sucursal.costoTotalFacturadoPorSucursal()}
				
	method totalFacturadoPorSucursal(sucursal)= sucursal.costoTotalFacturadoPorSucursal()
	
	
	method totalDeRemerasEnComercio() {
		var remerasTotalesComercio=[]
		
	sucursales.foreach{sucursal =>  remerasTotalesComercio.add(sucursal.totalDeRemeras()) }
	
	return remerasTotalesComercio
	}
	
	
	method cantidadDeRemerasDeColor(color) = 
	self.totalDeRemerasEnComercio().count{remera => remera.color() == color}
	
	
	method pedidoMasCaroDeComercio()=  sucursales.max{sucursal => sucursal.pedidoMasCaroDeSucursal()}	


	method tallesDeRemerasEnComercio(){
	
		var tallesTotales= []
	
				self.totalDeRemerasEnComercio().foreach{remera => tallesTotales.add(remera.talle())}
				
				return tallesTotales
				
				}

	method  tallesSinPedidos(){
		
		var talles= new Range  (32, 48)
		var tallesSinPedir= []
		
		talles.foreach{ talle=> if (not(talles.contains(talle))) tallesSinPedir.add(talle)}
		
		return tallesSinPedir
		
	}	
	
	
	method sucursalQueMasFacturo() {
		
		
		return sucursales.max{sucursal=> sucursal.costoTotalFacturadoPorSucursal()}
		
		
	}
	
	method sucursalQueVendioTodosLosTalles() {
		var sucursalesQueVendieron= []	
		
		
		
		
		
	}


}
