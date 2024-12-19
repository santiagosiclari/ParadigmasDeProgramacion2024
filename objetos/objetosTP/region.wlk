import armas.*
import guerreros.*
import zonas.*

class Region{
    var property camino = []

    method puedeAtravesar(guerrero) =
        camino.all{ zona => zona.puedeAtravesarSolo(guerrero)
    }

    method puedeAtravesarGrupo(grupo) =
        grupo.guerreros().all({guerrero => self.puedeAtravesar(guerrero)})

    method consecuencias(guerrero) =
        camino.map{zona => zona.efecto(guerrero)}

    method consecuenciasGrupo(grupo){
        grupo.guerreros().forEach{guerrero => self.consecuencias(guerrero)}
    }

    method definirCamino(origen, destino){
        camino.add(origen)
        camino.add(destino)
    }
}