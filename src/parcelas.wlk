import semillas.*

class Parcela {
	const ancho
	const largo
	const property horasDeSol 
	const plantas = []
	
	method superficie() {
		return ancho * largo
	}
	
	method cantidadMaxima() {
		return if(ancho>largo){self.superficie() /5}else{self.superficie() / 3 + largo}			
	}
	
	method complicaciones() {
		return plantas.any({p => p.horasDeSol() < horasDeSol})
	}
	
	method cantidadDePlantas() = plantas.size()
	method plantarUnaPlanta(unaPlanta){
		if(self.cantidadDePlantas() == self.cantidadMaxima()){
			self.error("La parcela está completa, no se puede plantar más")
		}
		if(horasDeSol + 2 < unaPlanta.horasDeSol()){
			self.error("La planta que se quiere plantar no tolera la cantidad de horas de sol en la parcela")
		}
		plantas.add(unaPlanta)
	}
	
	method plantasBajitas(){
		return plantas.all({p => p.altura() <= 1.5})
	}	
	
	method seAsociaBien(unaPlanta) 
	method cantPlantasBienAsociadas() = plantas.count({planta => self.seAsociaBien(planta)})
	method porcentajePlantasBienAsociadas() = (self.cantPlantasBienAsociadas() / self.cantidadDePlantas()) * 100 
}

class Ecologica inherits Parcela {
	override method seAsociaBien(unaPlanta) = not self.complicaciones() and unaPlanta.esIdeal(self) // le pasamos self(cada instancia de cada parcela ecologica)
}

class Industrial inherits Parcela {
	override method seAsociaBien(unaPlanta) = self.cantidadDePlantas() >= 2 and unaPlanta.esFuerte()  
}

