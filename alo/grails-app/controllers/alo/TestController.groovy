package alo

class TestController {
	def mapService
	def geocodeTest() {
		
		def address = params.address
		
		if (!address) address = '1600 Amphitheatre Pkwy, Mountain View, CA 94043'
		
		def point = mapService.getLatLong(address)	
		//render "latitude = ${point.lat}"
		////render "longitude = ${point.lng}" 
		
		render(view:'/index',model:[point:point])
	}
    def index() { }
}
