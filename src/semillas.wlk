
class Plantas {
	const anioDeObtencion
	const altura
	
	
	method horasDeSol()
	
	method esFuerte() {
		return self.horasDeSol() >= 10
	}
	
	method daNuevasSemillas(){
		return self.esFuerte() or self.condicionAlternativa()	
	}
	
	method espacio()
	
	method condicionAlternativa()
}

class Menta inherits Plantas {
	
	override method horasDeSol() = 6
	
	override method espacio() {
		return altura * 3
	}
	
	override method condicionAlternativa() {
		return altura > 0.4
	}
	
}

class Soja inherits Plantas {
	override method horasDeSol() = if(altura< 0.5){6}else if(altura < 1){7}else(9)
	
	override method espacio() = altura / 2
	
	override method condicionAlternativa() = anioDeObtencion > 2007 and altura >= 1
}

class Quinoa inherits Plantas {
 	const property horasDeSol // esto hace solo el override del método 
	
	override method espacio() = 0.5
	
	override method condicionAlternativa() =  anioDeObtencion < 2005
}

class SojaTrangenica inherits Soja {
	override method daNuevasSemillas() = false
}

class HierbaBuena inherits Menta {
	override method espacio() = super() * 2
}