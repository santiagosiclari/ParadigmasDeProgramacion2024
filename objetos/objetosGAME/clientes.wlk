import menu.*
import chefs.*
import nivel.*
//Archivo para clientes, tipos de clientes
import wollok.game.*

class Clientes{ //No se usa
    method hacerPedido()

/*     method recibirPedido(plato){
        if(plato.completo() //plato con todos los ingredientes de un menu
        && Clientes.hacerPedido().ingredientes() == plato.emplatado()){ //plato con los ingredientes del tipo de cliente
            chef1.dinero() + self.hacerPedido().recompensa()
        } else{
            chef1.say(chef1,"Falta x ingrediente")
        }
    } */ // No se usa

}

object generarPedido{

    var property pedido1 = null
    var property pedido2 = null
    var property pedido3 = null

    var property pedidosDisponibles = #{pedido1, pedido2, pedido3}

    method pedidoAleatorio(orden){
        if(orden == 1){
            pedido1 = pedidos.filter({elemento => elemento.orden() == orden}).anyOne()
            return pedido1
        } else if(orden == 2){
            pedido2 = pedidos.filter({elemento => elemento.orden() == orden}).anyOne()
            return pedido2
        } else {
            pedido3 = pedidos.filter({elemento => elemento.orden() == orden}).anyOne()
            return pedido3
        }
    }

    method generar(){
        if(pedido1 == null){
            self.pedidoAleatorio(1)
            game.addVisual(pedido1)
        } else if(pedido2 == null){
            self.pedidoAleatorio(2)
            game.addVisual(pedido2)
        } else if(pedido3 == null){
            self.pedidoAleatorio(3)
            game.addVisual(pedido3)
        }
        pedidosDisponibles = #{pedido1, pedido2, pedido3}
    }

    method esCorrecto(plato){
        return pedidosDisponibles.any({elemento => elemento != null &&
                                     elemento.ingredientes() == plato.emplatado()})
    }

    method hallar(plato){
        return pedidosDisponibles.find({elemento => elemento.ingredientes() == plato.emplatado()})
    }

    method quitar(plato){
        if(pedido1 == self.hallar(plato)){
            pedido1 = null
        } else if(pedido2 == self.hallar(plato)){
            pedido2 = null
        } else if(pedido3 == self.hallar(plato)){
            pedido3 = null
        }

        /*if(pedido1 == null){
            game.say(chef2, "nada" + pedido2.nombre() + pedido3.nombre())
        } else if(pedido2 == null){
            game.say(chef2, pedido1.nombre() + "nada" + pedido3.nombre())
        } else if(pedido3 == null){
            game.say(chef2, pedido1.nombre() + pedido2.nombre() + "nada")
        }*/
    }

    method mostrarPedidos(){
        game.schedule(2000, {self.generar()
                            game.onTick(10000, "generar", {self.generar()})})
    }

    method borrarPedidos(){
        game.removeVisual(pedido1)
        game.removeVisual(pedido2)
        game.removeVisual(pedido3)
    }

    method borrarPlatos(){
        game.removeVisual(plato1)
        game.removeVisual(plato2)
        game.removeVisual(plato3)
        game.removeVisual(plato4)
        game.removeVisual(plato5)
        game.removeVisual(plato6)
        game.removeVisual(plato7)
        game.removeVisual(plato8)
        game.removeVisual(plato9)
        game.removeVisual(plato10)
    }
}