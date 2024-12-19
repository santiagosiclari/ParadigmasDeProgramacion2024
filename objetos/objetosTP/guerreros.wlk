import armas.*
import region.*
import zonas.*

class GrupoGuerreros{
    const property guerreros = #{}

    method agregar(guerrero){
        guerreros.add(guerrero)
    }
    method cantElementos(nombreElem) =
        guerreros.sum({guerrero => guerrero.obtenerElementos(nombreElem)})
}

class Item{
    const property nombre
    var property cantidad

    method agregarAElementos(guerrero){
        cantidad.times({x => guerrero.elementos().add(nombre)})
    }
}

//CLASE GUERREROS
class Guerreros{
    var property vida
    var property armas = #{}
    var property elementos = []

    method cambiarVida(nuevaVida){
        if(nuevaVida.between(0, 100)){
            vida = nuevaVida
        } else{
            self.error("Numero fuera del rango numerico")
        }
    }

    method tieneArmas() = self.cantidadDeArmas() > 0

    method cargarArma(_arma){
        armas.add(_arma)
        _arma.asignarPortador(self)
    }

    method quitarArmas(){
        armas.clear()
    }

    method cantidadDeArmas() = armas.size()

    method cantidadDeElementos() = elementos.size()

    method sumatoriaArmas() = armas.sum({arma => arma.calcularPoder()})

    method obtenerElementos(elemento) = elementos.count{elem => elem == elemento}

}

object tomBombadil{
    const property vida = 100
    const property poder = 10000000

    method cambiarVida(nuevaVida) = vida

    method calcularPoder(){
        return poder
    }
    method tieneArmas() = true
}


//SUBCLASES DE GUERREROS
class Hobbit inherits Guerreros {
    method calcularPoder() {
        return vida + self.cantidadDeElementos() * self.sumatoriaArmas()
    }
}

class Enano inherits Guerreros {
    const factor
    method calcularPoder() = vida + factor * self.sumatoriaArmas()
}

class Elfo inherits Guerreros {
    var destrezaBase = 2
    const destrezaPropia

    method cambiarDestrezaBase(nuevaDestreza) {
        destrezaBase = nuevaDestreza
    }

    method calcularPoder() = vida + (destrezaBase + destrezaPropia) * self.sumatoriaArmas()
}

class Humano inherits Guerreros {
    const limitadorDePoder

    method calcularPoder() = vida + self.sumatoriaArmas() / limitadorDePoder
}

class Maiar inherits Guerreros {
    method getFactor() {
        if(vida < 10){
            return 300
        } else{
            return 15
        }
    }
    method calcularPoder() = vida * self.getFactor() + 2 * self.sumatoriaArmas()
}

class Gollum inherits Hobbit {
    override method calcularPoder() = super() / 2
}