object nave {
  const pasajeros = #{neo, morfeo, trinity}

  method cantidadPasajeros() = pasajeros.size()
  method pasajeroConMasVitalidad() = pasajeros.max({p => p.vitalidad()})
  method pasajeroConMenosVitalidad() = pasajeros.min({p => p.vitalidad()})
  method estaEquilibrada() {
    return 
        self.pasajeroConMasVitalidad().vitalidad()
        < 
        self.pasajeroConMenosVitalidad().vitalidad() * 2
  }
  method elegidoEstaEnNave() = pasajeros.any({p => pasajeros.esElegido()})
  
  method chocar() {
    return 
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
  }
  method acelerar() {
    return
        pasajeros.filter({p => not p.esElegido()}).forEach({p => p.saltar()})
  }
}

object neo {
  var energia = 100
  
  method energia() = energia
  method saltar() {
    energia = energia * 0.5
  }
  method vitalidad() = energia * 0.1

  method esElegido() = true
}

object morfeo {
  var vitalidad = 8
  var estaDescansado = false
  
  method vitalidad() = vitalidad
  method saltar() {
    vitalidad = (vitalidad - 1).max(0)
    estaDescansado = not estaDescansado
  }
  method esElegido() = false
}

object trinity {
  const vitalidad = 0
  
  method saltar() {}
  method esElegido() = false
}

