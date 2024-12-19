//Archvio para chef, tipos de chefs
import wollok.game.*
import nivel.*
import movimiento.*
import pantalla.*
import ingredientes.*

class Chef inherits ObjetoMovible{
    var property dinero = 0
    var property objetoTransportado = null
    var property vidas = 3

   method tomarObjeto(_objeto){
        if(objetoTransportado == null){
            objetoTransportado = _objeto
        }
   }

   method verificarElemento() =
     ingredientesCortables.any({ingrediente => ingrediente == objetoTransportado && ingrediente.cortado()})

/*    method apoyarObjeto(_objeto){
     if(objetoTransportado != null){
            objetoTransportado = null
            _objeto.position(game.at(5,5))
            game.addVisual(_objeto)
        }
   } */

   method quitarObjeto() {
        objetoTransportado = null
   }

    method tieneAlgo(){
        return objetoTransportado != null
   }

   method perderVidas(){
      vidas = vidas - 1
      if(vidas == 0){
          fin.juegoTerminado(false)
      }
   }


}

const chef1 = new Chef(position = game.at(7,8), imagen = "chef8der.png")
//const chef2 = new Chef(position = game.at(24,8), imagen = "chef8izq.png")
const chefs = [chef1]


class Vidas{
     const vacia = "vidaVacia.png"
     var property imagen = "vidaLlena.png"
     method image() = imagen
     var property position

     method perderVida(){
          imagen = vacia
     }
}

const vida1 = new Vidas(position = game.at(33,17))
const vida2 = new Vidas(position = game.at(35,17))
const vida3 = new Vidas(position = game.at(37,17))

const vidas = [vida1, vida2, vida3]