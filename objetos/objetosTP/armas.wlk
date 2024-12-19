import guerreros.*

class Armas {
    var portador = null
    method asignarPortador(nuevoPortador) {
        portador = nuevoPortador
    }
}

class Espada inherits Armas{
    const property multiplicador
    const property origen

    method cumpleMultiplicador(_multiplicador) = multiplicador.between(1, 20)

    method calcularPoder() {
        if(self.cumpleMultiplicador(multiplicador)){

            if(origenesDeMayorValor.contains(origen)){
                return multiplicador * origen.valor()
            }
            else {
                return multiplicador * 10 * portador.cantidadDeArmas()
            }

        } else{
            self.error("Numero fuera del rango numerico")
        }
    }
}

object elfico {
    method valor() = 25
}

object enano {
    method valor() = 20
}

object humano {
    method valor() = 15
}

class Otros {
    method valor() = 10
}

const hobbitiano = new Otros()
const maiarino = new Otros()
const gollumiano = new Otros()

const origenesDeMayorValor = [elfico, enano, humano]

class Baculo inherits Armas {
    const poder
    method calcularPoder() = poder
}

class Daga inherits Espada{
    override method calcularPoder() {
        return super() / 2 multiplicador //No sé por qué con esta linea funciona
    }
}

class Hacha inherits Armas {
    const mango
    const hoja
    method calcularPoder() = mango * hoja
}

