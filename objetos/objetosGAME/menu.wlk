//Archivo de menu y materiales
import wollok.game.*
import chefs.*
import nivel.*
import ingredientes.*
import movimiento.*

class Menu{
    const property ingredientes
    const property recompensa
    const property tiempoDisponible
    var property imagen = imagenSinEntregar
    const property imagenSinEntregar
    const property imagenEntregada
    const property orden
    var property position
    var property entregada = false
    var property nombre

    method image() = imagen

    method cambiarImagen() {
        if (entregada) {
            imagen = imagenEntregada
        } else {
            imagen = imagenSinEntregar
        }
    }

    method moverse() {
        position = position.left(1)
    }

    /* method crearMenu(numero){
       pedidos.add(numero.times{nombre += self.cantidad(3)})
    }

    */
}

class MenuAdulto inherits Menu(imagenSinEntregar = "menuCompleto1.png",
                              imagenEntregada = "menuCompletoEntregada.png",
                              ingredientes = #{pan, carne, lechuga, tomate},
                              recompensa = 200,
                              tiempoDisponible = 50000,
                              nombre = "menuAdulto"){}

class MenuJoven inherits Menu(imagenSinEntregar = "menuHamburguesaSola1.png",
                             imagenEntregada = "menuHamburguesaSolaEntregada1.png",
                             ingredientes = #{pan, carne},
                             recompensa = 50,
                             tiempoDisponible = 3000,
                             nombre = "menuJoven"){}

class MenuAnciano inherits Menu(imagenSinEntregar = "MenuHamburguesaConLechuga1.png",
                               imagenEntregada = "MenuHamburguesaConLechugaEntregada.png",
                               ingredientes = #{pan, carne, lechuga},
                               recompensa = 100,
                               tiempoDisponible = 30000,
                               nombre = "menuAnciano"){}

//Buscar una forma para generar los objetos con un method

const posMenu = [5,10,17]
const ordenes = [1,2,3]

const menuAdulto1 = new MenuAdulto(position = game.at(5,17), orden = 1)
const menuAdulto2 = new MenuAdulto(position = game.at(10,17), orden = 2)
const menuAdulto3 = new MenuAdulto(position = game.at(15,17), orden = 3)
const menuJoven1 = new MenuJoven(position = game.at(5,17), orden = 1)
const menuJoven2 = new MenuJoven(position = game.at(10,17), orden = 2)
const menuJoven3 = new MenuJoven(position = game.at(15,17), orden = 3)
const menuAnciano1 = new MenuAnciano(position = game.at(5,17), orden = 1)
const menuAnciano2 = new MenuAnciano(position = game.at(10,17), orden = 2)
const menuAnciano3 = new MenuAnciano(position = game.at(15,17), orden = 3)

const pedidos = #{menuAdulto1, menuAdulto2, menuAdulto3 ,menuJoven1, menuJoven2, menuJoven3, menuAnciano1, menuAnciano2, menuAnciano3}

class Plato inherits ObjetoMovible{
    var property emplatado = #{} //ingredientes que contiene un plato
    var property limpio = true

    method completo(menu) = self.emplatado().all(menu.ingredientes())

    method agregarIngrediente(ingrediente){
        emplatado.add(ingrediente)
    }

    method cambiarImagen(){
        if(limpio){
            imagen = "plato2.png"
        } else {
            imagen = "platoSucio.png"
        }
    }

    method vaciar(){
        emplatado = #{}
    }

    method mostrarPlato(){
        if (emplatado == #{pan}){
            imagen = "platoConPan.png"
        } else if (emplatado == #{lechuga}){
            imagen = "platoConLechuga1.png"
        } else if (emplatado == #{carne}){
            imagen = "platoConHamburguesa.png"
        } else if (emplatado == #{tomate}){
            imagen = "platoConTomate1.png"
        } else if (emplatado == #{pan, lechuga}){
            imagen = "panConLechuga.png"
        } else if (emplatado == #{pan, tomate}){
            imagen = "panConTomate.png"
        } else if (emplatado == #{pan, carne}){
            imagen = "panConHamburguesa.png"
        } else if (emplatado == #{lechuga, carne}){
            imagen = "platoConHamburguesaYLechuga.png"
        } else if (emplatado == #{lechuga, tomate}){
            imagen = "platoConTomateYLechuga.png"
        } else if (emplatado == #{carne, tomate}){
            imagen = "platoConHamburguesaYTomate.png"
        } else if (emplatado == #{pan, lechuga, tomate}){
            imagen = "panConLechugaYTomate.png"
        } else if (emplatado == #{pan, lechuga, carne}){
            imagen = "panConHamburguesaYLechuga.png"
        } else if (emplatado == #{pan, tomate, carne}){
            imagen = "panConHamburguesaYTomate.png"
        } else if (emplatado == #{lechuga, tomate, carne}){
            imagen = "platoConCompletaSinPan.png"
        } else if (emplatado == #{pan, lechuga, tomate, carne}){
            imagen = "hamburguesaCompleta.png"
        }
    }

    method irse(){
        position = position.right(1)
    }
}

const plato1 = new Plato(imagen = "plato2.png",
                        position = game.at(20,2))

const plato2 = new Plato(imagen = "plato2.png",
                        position = game.at(22,2))

const plato3 = new Plato(imagen = "plato2.png",
                        position = game.at(24,2))

const plato4 = new Plato(imagen = "plato2.png",
                        position = game.at(26,2))

const plato5 = new Plato(imagen = "plato2.png",
                        position = game.at(28,4))

const plato6 = new Plato(imagen = "plato2.png",
                        position = game.at(28,6))

const plato7 = new Plato(imagen = "plato2.png",
                        position = game.at(28,12))

const plato8 = new Plato(imagen = "plato2.png",
                        position = game.at(28,14))

const plato9 = new Plato(imagen = "plato2.png",
                        position = game.at(18,4))

const plato10 = new Plato(imagen = "plato2.png",
                        position = game.at(18,6))

const platos = [plato1, plato2, plato3, plato4, plato5, plato6, plato7, plato8, plato9, plato10]
