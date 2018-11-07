import pedido.*
import remera.*
import remera.*
class Comercio {
	
	var property sucursales= []
	var property pedidos = #{}
	
	
	method registrarPedido(pedido) {pedidos.add(pedido)}
	
	method totalFacturadoPorComercio()= 
				sucursales.sum{sucursal => sucursal.costoTotalFacturadoPorSucursal()}
				
	method totalFacturadoPorSucursal(sucursal)= sucursal.costoTotalFacturadoPorSucursal()
	
	
	method totalDeRemerasEnComercio() {
		
		
	
	 return pedidos.flatMap{pedido =>  pedido.remeras() }
	
	}
	
	method remerasDeColor() {
		
		return self.totalDeRemerasEnComercio().flatMap{remera => remera.colores()}
	}
	
	method cantidadDeRemerasDeColor(color) = 
	self.remerasDeColor().count{colorDeRemera => colorDeRemera == color}
	
	
	method pedidoMasCaroDeComercio()=  sucursales.max{sucursal => sucursal.pedidoMasCaroDeSucursal()}	


	method tallesDeRemerasEnComercio(){
	
		var tallesTotales= []
	
				self.totalDeRemerasEnComercio().map{remera => tallesTotales.add(remera.talle())}
				
				return tallesTotales
				
				}

	method  tallesSinPedidos(){
		
		var talles= new Range  (32, 48)
	
		
		
		return pedidos.flatMap{pedido =>  pedido.remeras() }
		
		
	}	
	
	
	method sucursalQueMasFacturo() {
		
		
		return sucursales.max{sucursal=> sucursal.costoTotalFacturadoPorSucursal()}
		
		
	}
	
	method sucursalQueVendioTodosLosTalles() {
		var sucursalesQueVendieron= []	
		
		
		
		
		
	}


}
