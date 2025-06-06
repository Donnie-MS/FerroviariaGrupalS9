import vagones.*


class Deposito {
  const property locomotoras = #{}
  const property formaciones = #{}
  method vagonesMasPesadosDeFormaciones() = formaciones.filter({ f => not f.vagones().isEmpty()}).map({ f => f.vagonMasPesado()}).asSet() 

  method necesitaConductor() = formaciones.any({formacion => formacion.esCompleja()})
  method agregarFormacion(unaFormacion) {formaciones.add(unaFormacion)}
  method agregarLocomotoraA(unaFormacion) {
    if (not unaFormacion.puedeMoverse() && self.hayLocomotoraApta(unaFormacion) ) {
        const locomotoraApta = self.locomotoras().find({ l =>l.cuantoPuedeArrastrar() >= unaFormacion.cuantoKilosDeEmpujeFaltan() })
        unaFormacion.agregarLocomotora(locomotoraApta)
        locomotoras.remove(locomotoraApta)
    }
  }
  method hayLocomotoraApta(unaFormacion) =  self.locomotoras().any({l =>l.cuantoPuedeArrastrar() >= unaFormacion.cuantoKilosDeEmpujeFaltan() })
}