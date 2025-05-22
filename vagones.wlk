class VagonPasajeros{
   var property largo
   var property ancho
   var property tieneBanio
   var property estaOrdenado
   method pasajerosPorMetroDeLargo() = if (ancho > 0 and ancho <= 3) 8 else 10
   method cantMaximaPasajeros()= ancho * self.pasajerosPorMetroDeLargo - if(not estaOrdenado) 15 else 0
   method cantMaximaCarga()=if(tieneBanio)300 else 800
   method pesoMaximo()= 2000 + 80 * self.cantMaximaPasajeros() + self.cantMaximaCarga()

}
class VagonCarga{
   var property cargaMaxIdeal
   var property cantMaderasSueltas
   method cantMaximaCarga()= 0.max(cargaMaxIdeal - 400 * cantMaderasSueltas)
   method pesoMaximo()= 1500 + self.cantMaximaCarga()
   method tieneBanio()=false
   method cantMaximaPasajeros()= 0

}
class VagonDormitorio{
    var property compartimientos
    var property camas
    method cantMaximaPasajeros()= compartimientos * camas
    method tieneBanio()=true
    method cantMaximaCarga()= 1200
    method pesoMaximo()=4000 +80* self.cantMaximaPasajeros() + self.cantMaximaCarga()
}