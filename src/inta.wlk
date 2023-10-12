import semillas.*
import parcelas.*

object inta {
	const parcelas = []
	
	method totalDePlantas() = parcelas.sum({parcela => parcela.cantidadDePlantas()})
	method cantidadDeParcelas() = parcelas.size()
	method promedioPlantas() {
		return self.totalDePlantas() / self.cantidadDeParcelas()
	}
	
	method parcelasConMasDe4Plantas() {
		return parcelas.filter({parcela => parcela.cantidadDePlantas() > 4 })
	} 
	
	method parcelaMasAutosustentable(){
		return self.parcelasConMasDe4Plantas().max({parcela => parcela.porcentajePlantasBienAsociadas()})
	}
}