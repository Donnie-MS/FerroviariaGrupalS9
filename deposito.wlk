import vagones.*



class Deposito {
  const property deposito = #{}
  const property locomotoras = #{}
  
  method formacionVagonesMasPEsados(){

      self.deposito().filter({ f => not f.vagones().isEmpty()}).map({ f => f.vagonMasPesado() })

  }
  method necesitaDirector() = self.deposito().any({ f => self.esCompleja(f) })
  
  method esCompleja(unaFormacion) = ((unaFormacion.vagones().size() + unaFormacion.locomotoras().size()) > 8) || (unaFormacion.pesoMaximoFormacion() > 80000)
  
  method agregarLocomotora(unaFormacion) {
    if (not unaFormacion.puedeMoverse() && self.hayLocomotoraApta(unaFormacion) ) 
      {
        const locomotoraApta = self.locomotoras().find(
        { l =>l.cuantoPuedeArrastrar() >= unaFormacion.cuantoKilosDeEmpujeFaltan() })
        unaFormacion.agregarAFormacion(locomotoraApta)
        locomotoras.remove(locomotoraApta)
      }
  }
  method hayLocomotoraApta(unaFormacion) =  self.locomotoras().any({l =>l.cuantoPuedeArrastrar() >= unaFormacion.cuantoKilosDeEmpujeFaltan() })
}