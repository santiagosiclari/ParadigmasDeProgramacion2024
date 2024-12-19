import movimiento.*
//Archivo para niveles
import wollok.game.*
import chefs.*
import menu.*
import pantalla.*

//Mesadas Simples Frente
class MesasSimples{
    const property position
    var property platoApoyado = null

    //Apoyar plato
    method apoyarPlato(platoMano){
        if(platoApoyado != null){
            platoMano.enMovimiento(false)
            platoApoyado = platoMano
            game.addVisual(platoApoyado)
            game.say(chef1, "Plato apoyado correctamente.")
            chef1.quitarObjeto()
        } else {
            game.say(chef1, "Estoy ocupada")
        }
    }

    method mesadaVacia(){
        return platoApoyado == null
    }
}

// MESAS SIMPLES DE FRENTE
class MesadaSimpleFrente inherits MesasSimples{
    method image() = "mesadaSimpleFrente.png"
}

//Mesas Simples de Frente ordenadas de izq a der -> de abajo a arriba
//y=12
const mesadaSimpleFrente1 = new MesadaSimpleFrente(position = game.at(14,12))
const mesadaSimpleFrente2 = new MesadaSimpleFrente(position = game.at(16,12))
const mesadaSimpleFrente3 = new MesadaSimpleFrente(position = game.at(18,12))
//y=16
const mesadaSimpleFrente4 = new MesadaSimpleFrente(position = game.at(6,16))
const mesadaSimpleFrente5 = new MesadaSimpleFrente(position = game.at(12,16))

const mesadasSimplesFrente = [mesadaSimpleFrente1, mesadaSimpleFrente2, mesadaSimpleFrente3,
                                mesadaSimpleFrente4, mesadaSimpleFrente5]

//MESADAS SIMPLES
class MesadaSimple inherits MesasSimples{
    method image() = "mesadaSimple.png"
}

    const posSimples2 = [4, 6, 10, 14, 18, 20, 22, 24, 26, 28]
    const posSimples4 = [14,18,28]
    const posSimples6 = [4,14,18,28]
    const posSimples8 = [14,16,18,28]
    const posSimples10 = [28]
    const posSimples12 = [28]
    const posSimples14 = [14,18,28]
    const posSimples16 = [4,14,18,28]

//Mesas Simples ordenadas de izquierda a derecha -> de abajo a arriba.
//y=2

const mesadaSimple1 = new MesadaSimple(position = game.at(4,2))
const mesadaSimple2 = new MesadaSimple(position = game.at(6,2))
const mesadaSimple3 = new MesadaSimple(position = game.at(10,2))
const mesadaSimple4 = new MesadaSimple(position = game.at(14,2))
const mesadaSimple5 = new MesadaSimple(position = game.at(18,2))
const mesadaSimple6 = new MesadaSimple(position = game.at(20,2))
const mesadaSimple7 = new MesadaSimple(position = game.at(22,2))
const mesadaSimple8 = new MesadaSimple(position = game.at(24,2))
const mesadaSimple9 = new MesadaSimple(position = game.at(26,2))
const mesadaSimple10 = new MesadaSimple(position = game.at(28,2))
//y=4
const mesadaSimple11 = new MesadaSimple(position = game.at(14,4))
const mesadaSimple12 = new MesadaSimple(position = game.at(18,4))
const mesadaSimple13 = new MesadaSimple(position = game.at(28,4))
//y=6
const mesadaSimple14 = new MesadaSimple(position = game.at(4,6))
const mesadaSimple15 = new MesadaSimple(position = game.at(14,6))
const mesadaSimple16 = new MesadaSimple(position = game.at(18,6))
const mesadaSimple17 = new MesadaSimple(position = game.at(28,6))
//y=8
const mesadaSimple18 = new MesadaSimple(position = game.at(14,8))
const mesadaSimple19 = new MesadaSimple(position = game.at(16,8))
const mesadaSimple20 = new MesadaSimple(position = game.at(18,8))
const mesadaSimple21 = new MesadaSimple(position = game.at(28,8))
//y=10
const mesadaSimple22 = new MesadaSimple(position = game.at(28,10))
//y=12
const mesadaSimple23 = new MesadaSimple(position = game.at(28,12))
//y=14
const mesadaSimple24 = new MesadaSimple(position = game.at(14,14))
const mesadaSimple25 = new MesadaSimple(position = game.at(18,14))
const mesadaSimple26 = new MesadaSimple(position = game.at(28,14))
//y=16
const mesadaSimple27 = new MesadaSimple(position = game.at(4,16))
const mesadaSimple28 = new MesadaSimple(position = game.at(14,16))
const mesadaSimple29 = new MesadaSimple(position = game.at(18,16))
const mesadaSimple30 = new MesadaSimple(position = game.at(28,16))

const mesadasSimples = [mesadaSimple1, mesadaSimple2, mesadaSimple3, mesadaSimple4, mesadaSimple5,
    mesadaSimple6, mesadaSimple7, mesadaSimple8, mesadaSimple9, mesadaSimple10,
    mesadaSimple11, mesadaSimple12, mesadaSimple13, mesadaSimple14, mesadaSimple15,
    mesadaSimple16, mesadaSimple17, mesadaSimple18, mesadaSimple19, mesadaSimple20,
    mesadaSimple21, mesadaSimple22, mesadaSimple23, mesadaSimple24, mesadaSimple25,
    mesadaSimple26, mesadaSimple27, mesadaSimple28, mesadaSimple29, mesadaSimple30]

/* const mesadasSimp = [mesadaSimple2, mesadaSimple4, mesadaSimple6, mesadaSimple8, mesadaSimple10, mesadaSimple12, mesadaSimple14, mesadaSimple16]
const allMesadas = mesadasSimp + mesadasSimplesFrente

const todasLasMesadas = mesadasSimples + mesadasSimplesFrente */ //No se usa

// MESAS CON SARTEN
class MesaConSarten {
    method image() = "mesaConSarten.png"
    const property position
}

const posSarten = [20,22,24,26]

const mesaConSarten1 = new MesaConSarten(position = game.at(20,16))
const mesaConSarten2 = new MesaConSarten(position = game.at(22,16))
const mesaConSarten3 = new MesaConSarten(position = game.at(24,16))
const mesaConSarten4 = new MesaConSarten(position = game.at(26,16))

const mesasConSarten = [mesaConSarten1, mesaConSarten2, mesaConSarten3, mesaConSarten4]

// MESAS DE INGREDIENTES
class MesaDeIngrediente {
    const imagen
    const imagenIngrediente
    method image() = imagen
    const property position

    method generar(chef, ingrediente){
        chef.tomarObjeto(ingrediente)
	    ingrediente.sinPreparar(true)
        ingrediente.imagen(imagenIngrediente)
        ingrediente.position(position)
        game.addVisual(ingrediente)
    }
}

const mesaLechuga = new MesaDeIngrediente(imagen = "mesaLechuga.png", 
                                         imagenIngrediente = "lechugaChiquita.png",
                                         position = game.at(4,8))
const mesaPan = new MesaDeIngrediente(imagen = "mesaPan.png", 
                                     imagenIngrediente = "panChiquito.png",
                                     position = game.at(4,10))
const mesaCarne = new MesaDeIngrediente (imagen = "mesaCarne3.png",
                                        imagenIngrediente = "carne.png",
                                        position = game.at(4,12))
const mesaTomate = new MesaDeIngrediente (imagen = "mesaTomate2.png", 
                                         imagenIngrediente = "tomateChiquito.png",
                                         position = game.at(4,14))

const mesasConIngredientes = [mesaLechuga, mesaPan, mesaCarne, mesaTomate]

class MesaConCuchillo {
    method image() = "mesaConCuchillo.png"
    const property position
}
const posCuchillos = [8,12]

const mesaConCuchillo1 = new MesaConCuchillo(position = game.at(8,2))
const mesaConCuchillo2 = new MesaConCuchillo(position = game.at(12,2))

const mesasConCuchillos = [mesaConCuchillo1,mesaConCuchillo2]

//RECEPCIÓN
object recepcion {
    method image() = "recepcion2.png"
    const property position = game.at(28,8)
}

const recepciones = [recepcion]

//MESA DE LOS PLATOS
/*object mesaPlato {
    method image() = "mesaPlatos3.png"
    const property position = game.at(28,6)

    method devolverPlato(plato){
        plato.limpio(false)
        plato.vaciar()
        plato.cambiarImagen()
        plato.position(self.position())
        game.addVisual(plato)
    }
}*/

// PILETA
object pileta {
    method image() = "pileta.png"
    const property position = game.at(8,16)

    method lavar(plato){
        plato.limpio(true)
        plato.cambiarImagen()
    }
}

// BASURA
object basura{
    method image() = "basura.png"
    method position() = game.at(4,4)
}

const tachos = [basura]

object musica {
	const music = game.sound("musicaItaliana.mp3")

	method loop() {music.shouldLoop(true)}
	method play() {music.play()}
	method stop() {music.stop()}
}

object paleta{
    const property verde = "00FF00FF"
    const property rojo = "FF0000FF"
}

object marcadorDeDinero{
     var property dinero = 0

     var property  position = game.at(1,18)

     method agregarDinero(monto){
            dinero += monto
          if(dinero >= 500){
            //game.say(chef2, "ganamos")
            fin.juegoTerminado(true)
          }
     }

     method restarDinero(monto){
          dinero -= monto
     }

     method text() = "Dinero: " + dinero.toString() + "$"
     method textColor() = paleta.rojo()
}

object reloj{
    var  property contador = 150
    var property position = game.at(1,16)
    method text() = "Tiempo: " + contador.toString()
    method textColor() = paleta.rojo()
    method mostrar(){
        contador = contador - 1
        self.text()
        if(contador == 0){
            fin.juegoTerminado(false)
        }
    }
}
