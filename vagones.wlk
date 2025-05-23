
class Formacion {
   const property vagones = []

   method agregarAFormacion(unVagon) {vagones.add(unVagon)}
   method eliminarDeFormacion(unVagon) {vagones.remove(unVagon)}

   method cantMaximaPasajeros() = vagones.sum({vagon => vagon.cantMaximaPasajeros()})
   method cantPasajeros() = vagones.sum({vagon => vagon.pasajeros()})
   method cantVagonesPopulares() = self.vagonesPopulares().size()
   method vagonesPopulares() = vagones.filter({vagon => vagon.cantMaximaPasajeros() > 50})

   method esCarguero() = vagones.all({vagon => vagon.cantMaximaCarga() >= 1000})

   method dispersionDePeso() = self.vagonMasPesado().pesoMaximo() - self.vagonMasLiviano().pesoMaximo() 
   method vagonMasPesado() = vagones.max({vagon => vagon.pesoMaximo()})
   method vagonMasLiviano() = vagones.min({vagon => vagon.pesoMaximo()})

   method cantBanios() = vagones.count({vagon => vagon.tieneBanio()})
   
   method hacerMantenimiento() {vagones.forEach({vagon => vagon.hacerMantenimiento()})}

   method estaEquilibrada() = (self.vagonConMasPasajeros() - self.vagonConMenosPasajeros()) >= 20
   method vagonConMasPasajeros() = self.vagonConPasajeros().max({vagon => vagon.pasajeros()})
   method vagonConMenosPasajeros() = self.vagonConPasajeros().min({vagon => vagon.pasajeros()})
   method vagonConPasajeros() = vagones.filter({vagon => vagon.pasajeros() > 0})
   //vagones con pasajeros devuelve una lista con vagones que no esten vacios

}

class VagonPasajeros{
   var property largo
   var property ancho
   var property tieneBanio
   var property estaOrdenado
   var property pasajeros = 0
   method pasajerosPorMetroDeLargo() = if (ancho > 0 and ancho <= 3) 8 else 10
   method cantMaximaPasajeros()= largo * self.pasajerosPorMetroDeLargo() - if(not estaOrdenado) 15 else 0
   method cantMaximaCarga()=if(tieneBanio)300 else 800
   method pesoMaximo()= 2000 + 80 * self.cantMaximaPasajeros() + self.cantMaximaCarga()
   method hacerMantenimiento() {
      if (not estaOrdenado) {
         estaOrdenado = true
         pasajeros += 15
      }
   }
}
class VagonCarga{
   var property cargaMaxIdeal
   var property cantMaderasSueltas
   method pasajeros() = 0
   method cantMaximaCarga()= 0.max(cargaMaxIdeal - 400 * cantMaderasSueltas)
   method pesoMaximo()= 1500 + self.cantMaximaCarga()
   method tieneBanio()=false
   method cantMaximaPasajeros()= 0
   method hacerMantenimiento() {cantMaderasSueltas = (cantMaderasSueltas - 2).max(0)}
}
class VagonDormitorio{
   var property compartimientos
   var property camas
   var property pasajeros = 0
   method cantMaximaPasajeros()= compartimientos * camas
   method tieneBanio() = true
   method cantMaximaCarga()= 1200
   method pesoMaximo()=4000 +80* self.cantMaximaPasajeros() + self.cantMaximaCarga()
   method hacerMantenimiento() {}
}

