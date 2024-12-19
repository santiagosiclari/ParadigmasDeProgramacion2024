import wollok.game.*
import chefs.*
import nivel.*
import movimiento.*
import menu.*

class Ingredientes inherits ObjetoMovible{
    var property sinPreparar = true
    const property esCortable
    const property esCocinable
}

class IngredientesCortables inherits Ingredientes {
    var property cortado = false
    var property imagenCortada

    /* method actualizarImagen(){
        imagen = self.imagen()
    } */

    method cortar(){
        if(sinPreparar){
            sinPreparar = false
            cortado = true
            imagen = imagenCortada
        }
    }
}

const pan = new Ingredientes(imagen = "panChiquito.png",
                            position = game.at(4,10),
                            esCortable = false,
                            esCocinable = false)


const lechuga = new IngredientesCortables(imagen = "lechugaChiquita.png",
                                         imagenCortada = "lechugaCortada1.png",
                                         position = game.at(4,8),
                                         esCortable = true,
                                         esCocinable = false)

const tomate = new IngredientesCortables(imagen = "tomateChiquito.png",
                                        imagenCortada = "tomateCortado1.png",
                                        position = game.at(4,14),
                                        esCortable = true,
                                        esCocinable = false)

const ingredientesCortables = [lechuga, tomate, carne]

class Hamburguesa inherits IngredientesCortables{
    var property cocinado = false
    //var property tiempoCoccion
    //var property imagenQuemada
    var property imagenCocinada

    method cocinar(){
        if(!cocinado && cortado){ //que arranque el tiempo cuando empieza a cocinar
            cocinado = true
            imagen = imagenCocinada
        }

    }
}

const carne = new Hamburguesa (imagen = "carne.png",
                              imagenCortada = "carneChiquita.png",
                              imagenCocinada = "carneCocida1.png",
                              position = game.at(4,12),
                              esCortable = true,
                              esCocinable = true)