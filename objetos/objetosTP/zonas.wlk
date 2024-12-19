import armas.*
import guerreros.*

class RequerimientoElemento{
    var property cantidad
    var property nombreElem

    method cumpleRequerimiento(grupo) =
        grupo.cantElementos(nombreElem) >= cantidad
}

class RequerimientoGuerrero{
    var property minimo = 0
    method criterio(guerrero)

    method cumpleRequerimiento(grupo) =
        grupo.guerreros().any{guerrero => self.criterio(guerrero)}
}

object requerimientoArmas inherits RequerimientoGuerrero{
    override method criterio(guerrero) = guerrero.cantidadDeArmas() > minimo
}

object requerimientoPoder inherits RequerimientoGuerrero{
    override method criterio(guerrero) = guerrero.calculaPoder() > minimo
}

object requerimientoVida inherits RequerimientoGuerrero{
    override method criterio(guerrero) = guerrero.vida() > minimo
}

class Zona {
    method puedeAtravesarSolo(guerrero) = true

    method puedeAtravesarG(grupo) =
        grupo.all{guerrero => self.puedeAtravesarSolo(guerrero)}

    method efecto(guerrero){}
}

class ZonaNeutra inherits Zona{
    var property poderMin = 1500
    override method puedeAtravesarSolo(guerrero) = guerrero.calcularPoder() > poderMin
}

class ZonaEnemiga inherits Zona{
    var property danio = 10
    override method puedeAtravesarSolo(guerrero) = guerrero.tieneArmas()
    override method efecto(guerrero){
        guerrero.vida() - danio
    }
}

object lebennin inherits ZonaNeutra {
    override method puedeAtravesarSolo(guerrero) = guerrero.calcularPoder() > 1500

}

object minasTirith inherits ZonaEnemiga{
    override method puedeAtravesarSolo(guerrero) = guerrero.tieneArmas()
    override method efecto(guerrero){
        guerrero.cambiarVida(guerrero.vida() - 10)
    }

}

object lossarnach inherits Zona{
    override method efecto(guerrero){
        guerrero.cambiarVida(guerrero.vida() + 1)
    }
}

