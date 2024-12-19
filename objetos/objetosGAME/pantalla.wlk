import clientes.*
import wollok.game.*
import chefs.*
import escenario.*
import menu.*
import nivel.*

object go{
    method image() = "go.png"
    var property position = game.at(15,8)
}

object pantalla{
    method empezar(){
        game.width()
        game.height()
		game.addVisual(inicio)
		keyboard.x().onPressDo({nivel.configurate()})game.clear() //Elegir letras
		keyboard.p().onPressDo({game.stop()}) //Elegir letras
    }

    method cambiarPantalla(){
        game.clear()
        game.addVisual(fin)
        keyboard.r().onPressDo({self.empezar()}) //Elegir letras
    }
}

object inicio {
	const property position = game.origin()
	var property imagen = ""

    method mostrarMenu(){
        game.say(self, "Bienvenidos a Overcooked")
        //self.seleccionarJugadores()
        //self.seleccionarNivel()
    }

	method actualizar() {
		imagen = self.imagen()
	}
}

object fin{
    const property position = game.origin()
    var property gana = null
    var property imagen = null

    method image() = imagen

    method imagen() =
        if(gana){
            imagen = "victoria2.png"
        } else{
            imagen = "derrota3.png"
        }

    method juegoTerminado(victoria){
        if(victoria){
            game.sound("ganar.mp3").play()
        } else {
            game.sound("perder.mp3").play()
        }
        gana = victoria
        self.imagen()
        musica.stop()
        game.removeTickEvent("generar")
        generarPedido.borrarPedidos()
        generarPedido.borrarPlatos()
        game.addVisual(self)
        if(gana){
            dineroFinal.text()
        }
    }
}

object dineroFinal{
    method position() = game.at(15,10)
    method textColor() = paleta.rojo()
    method text() = "Dinero: " + marcadorDeDinero.dinero().toString() + "$"
}