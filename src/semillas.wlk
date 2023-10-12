import parcelas.*

class Plantas {
	const anioDeObtencion
	const property altura
	
	
	method horasDeSol()
	
	method esFuerte() {
		return self.horasDeSol() >= 10
	}
	
	method daNuevasSemillas(){
		return self.esFuerte() or self.condicionAlternativa()	
	}
	
	method espacio()
	
	method condicionAlternativa()
	
	method esIdeal(unaParcela)
}

class Menta inherits Plantas {
	
	override method horasDeSol() = 6
	
	override method espacio() {
		return altura * 3
	}
	
	override method condicionAlternativa() {
		return altura > 0.4
	}
	
	override method esIdeal(unaParcela) {
		return unaParcela.superficie() > 6
	}
	
}

class Soja inherits Plantas {
	override method horasDeSol() = if(altura< 0.5){6}else if(altura < 1){7}else(9)
	
	override method espacio() = altura / 2
	
	override method condicionAlternativa() = anioDeObtencion > 2007 and altura >= 1
	
	override method esIdeal(unaParcela) = self.horasDeSol() == unaParcela.horasDeSol()
}

class Quinoa inherits Plantas {
 	const property horasDeSol // esto hace solo el override del método 
	
	override method espacio() = 0.5
	
	override method condicionAlternativa() =  anioDeObtencion < 2005
	
	override method esIdeal(unaParcela) = unaParcela.plantasBajitas()
}

class SojaTrangenica inherits Soja {
	override method daNuevasSemillas() = false
	
	override method esIdeal(unaParcela) = unaParcela.cantidadMaxima() == 1
}

class HierbaBuena inherits Menta {
	override method espacio() = super() * 2
}

