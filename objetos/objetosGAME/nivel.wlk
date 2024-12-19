import movimiento.*
import wollok.game.*
import chefs.*
import ingredientes.*
import escenario.*
import menu.*
import clientes.*
import pantalla.*

object nivel {
    method configurate(){
        //CONFIG
        game.title("Overcooked")
        game.height(20)
        game.width(40)
        game.cellSize(40)
        game.boardGround("piso5.png")

        //DINERO
        game.addVisual(marcadorDeDinero) //Funciona?
        marcadorDeDinero.text()//Funciona?

        //RELOJ
        game.addVisual(reloj)
        game.onTick(1000, "tiempo", {reloj.mostrar()})

        //MUSICA
        musica.loop()
        game.schedule(500,{musica.play()})

        //MESADAS SIMPLES
        //y=2
        const mesadaSimple2 = #{4,6,10,14,18,20,22,24,26,28}
        (2..30).forEach({x =>
            if(mesadaSimple2.contains(x))
                {game.addVisual(new MesadaSimple(position = game.at(x, 2)))}
            })
        //y=4
        const mesadaSimple4 = #{14,18,28}
        (12..30).forEach({x =>
            if(mesadaSimple4.contains(x))
                {game.addVisual(new MesadaSimple(position = game.at(x, 4)))}
            })
        //y=6
        const mesadaSimple6 = #{4,14,18,28}
        (2..30).forEach({x =>
            if(mesadaSimple6.contains(x))
                {game.addVisual(new MesadaSimple(position = game.at(x, 6)))}
            })
        //y=8
        const mesadaSimple8 = #{14,16,18,28}
        (2..30).forEach({x =>
            if(mesadaSimple8.contains(x))
                {game.addVisual(new MesadaSimple(position = game.at(x, 8)))}
            })
        //y=10
        const mesadaSimple10 = #{28}
        (2..30).forEach({x =>
            if(mesadaSimple10.contains(x))
                {game.addVisual(new MesadaSimple(position = game.at(x, 10)))}
            })
        //y=12
        const mesadaSimple12 = #{28}
        (2..30).forEach({x =>
            if(mesadaSimple12.contains(x))
                {game.addVisual(new MesadaSimple(position = game.at(x, 12)))}
            })
        //y=14
        const mesadaSimple14 = #{14,18,28}
        (2..30).forEach({x =>
            if(mesadaSimple14.contains(x))
                {game.addVisual(new MesadaSimple(position = game.at(x, 14)))}
            })
        //y=16
        const mesadaSimple16 = #{4,14,18,28}
        (2..30).forEach({x =>
            if(mesadaSimple16.contains(x))
                {game.addVisual(new MesadaSimple(position = game.at(x, 16)))}
            })


        //MESADAS SIMPLES DE FRENTE
/*         const mesadaFrente12 = #{14,16,18}
        (14..18).forEach({x =>
            if(mesadaFrente12.contains(x))
                {game.addVisual(new MesadaSimpleFrente(position = game.at(x, 12)))}
            }) */

/*         const mesadaFrente16 = #{6,12}
        (14..18).forEach({x =>
            if(mesadaFrente16.contains(x))
                {game.addVisual(new MesadaSimpleFrente(position = game.at(x, 16)))}
            }) */

        game.addVisual(mesadaSimpleFrente1)
        game.addVisual(mesadaSimpleFrente2)
        game.addVisual(mesadaSimpleFrente3)
        game.addVisual(mesadaSimpleFrente4)
        game.addVisual(mesadaSimpleFrente5)


        //MESAS CON SARTEN
/*         const mesaSarten = #{20,22,24,26}
        (20..26).forEach({x =>
            if(mesaSarten.contains(x))
                {game.addVisual(new MesaConSarten(position = game.at(x, 16)))}
        }) */
        game.addVisual(mesaConSarten1)
        game.addVisual(mesaConSarten2)
        game.addVisual(mesaConSarten3)
        game.addVisual(mesaConSarten4)


        //MESAS DE INGREDIENTES
        game.addVisual(mesaLechuga)
        game.addVisual(mesaPan)
        game.addVisual(mesaCarne)
        game.addVisual(mesaTomate)

        //MESAS CON CUCHILLO
/*         const mesaCuchillo = #{8,12}
        (8..12).forEach({x =>
            if(mesaCuchillo.contains(x))
                {game.addVisual(new MesaConCuchillo(position = game.at(x, 2)))}
        }) */
        game.addVisual(mesaConCuchillo1)
        game.addVisual(mesaConCuchillo2)

        //MESA PLATOS
    //    game.addVisual(mesaPlato)

        //PILETA
        game.addVisual(pileta)

        //BASURA
        game.addVisual(basura)

        //RECEPCION
        game.addVisual(recepcion)

	    //PLATOS
        game.addVisual(plato1)
        game.addVisual(plato2)
        game.addVisual(plato3)
        game.addVisual(plato4)
        game.addVisual(plato5)
        game.addVisual(plato6)
        game.addVisual(plato7)
        game.addVisual(plato8)
        game.addVisual(plato9)
        game.addVisual(plato10)
    

        //VIDAS
        game.addVisual(vida1)
        game.addVisual(vida2)
        game.addVisual(vida3)

        game.addVisual(chef1)
    //    game.addVisual(chef2)

        //CHEF 1
	    keyboard.left().onPressDo { chef1.imagen("chef8izq.png") }
    	keyboard.right().onPressDo { chef1.imagen("chef8der.png") }

        //CHEF 2
	/*    keyboard.a().onPressDo { chef2.imagen("chef8izq.png") }
	    keyboard.d().onPressDo { chef2.imagen("chef8der.png") }*/

        //GO
        game.addVisual(go)
        game.schedule(2000, {game.removeVisual(go)})

        game.addVisual(fin)

    }

    method interacciones(){
        //AGARRAR INGREDIENTES
        game.whenCollideDo(chef1, {mesa =>
            if(chef1.objetoTransportado() == null){
                if (mesa == mesaLechuga) {
                    //game.say(chef1, "tengo una lechuga")
                    lechuga.cortado(false)
                    mesa.generar(chef1, lechuga)

                } else if (mesa == mesaPan) {
                    //game.say(chef1, "tengo un pan")
                    mesa.generar(chef1, pan)

                } else if (mesa == mesaCarne) {
                    //game.say(chef1, "tengo una carne")
                    carne.cortado(false)
                    carne.cocinado(false)
                    mesa.generar(chef1, carne)

                } else if (mesa == mesaTomate) {
                    //game.say(chef1, "tengo un tomate")
                    tomate.cortado(false)
                    mesa.generar(chef1, tomate)
                }
            }
        })


        //QUITAR OBJETO
        game.whenCollideDo(chef1, { elemento =>
            if (tachos.contains(elemento) && chef1.objetoTransportado() != null) {
                //game.say(chef1, "no tengo nada")
                game.removeVisual(chef1.objetoTransportado())

               if(platos.contains(chef1.objetoTransportado())){
                    chef1.objetoTransportado().position(game.at(37,0))
                    chef1.objetoTransportado().enMovimiento(false)
                }
                chef1.quitarObjeto()

            }
        })

        //CORTAR INGREDIENTES
        game.whenCollideDo(chefs.anyOne(), { mesa =>
            if (mesasConCuchillos.contains(mesa) && (ingredientesCortables.contains(chefs.anyOne().objetoTransportado()))){
                chefs.anyOne().objetoTransportado().cortar()
                //game.say(chef1, "Lo corto")
            }
        })

	//AGARRAR PLATO
        game.whenCollideDo(chef1, { plato =>
            if(platos.contains(plato) && chef1.objetoTransportado() == null){
                keyboard.space().onPressDo {
                    if(chef1.position() == plato.position()){
                        chef1.tomarObjeto(plato)
                        plato.enMovimiento(true)
                        movimiento.seguirChef(plato, chef1)
                        game.removeVisual(plato)
                        game.addVisual(plato)
                    }
                }
            }
        })

        //PONER INGREDIENTES EN PLATO
        game.whenCollideDo(chef1, { elemento =>
            if(platos.contains(elemento) && chef1.tieneAlgo()){
                if(chef1.objetoTransportado() == pan || chef1.verificarElemento()){
                    elemento.agregarIngrediente(chef1.objetoTransportado())
                    //game.say(chef1, "Lo deje en el plato!")
                    game.removeVisual(chef1.objetoTransportado())
                    elemento.mostrarPlato()
                    chef1.objetoTransportado().sinPreparar(true)
                    chef1.quitarObjeto()
                }
            }
        })

        /*game.whenCollideDo(Chef1, {elemento =>
            if(platos)
        })*/

        /*game.whenCollideDo(chef1, { objeto =>
            if (todasLasMesadas.contains(objeto) ){
                return true
            }
        })
        game.whenCollideDo(chef2, { objeto =>
            if (todasLasMesadas.contains(objeto) ){
                return true
            }
        })*/

        //COCINAR INGREDIENTES
        game.whenCollideDo(chef1, {mesa =>
            if(mesasConSarten.contains(mesa) && chef1.objetoTransportado() != null){
                if(chef1.objetoTransportado().esCocinable()){
                    chef1.objetoTransportado().cocinar()
                    //game.say(chef1, "Lo cocino")
                }
            }
        })

        //ENTREGAR PLATO
        game.whenCollideDo(chef1, {mesa =>
            if(recepciones.contains(mesa) && platos.contains(chef1.objetoTransportado())){
                chef1.objetoTransportado().enMovimiento(false)
                chef1.quitarObjeto()
            }
        })

        game.whenCollideDo(recepcion, {plato =>
           if(platos.contains(plato)){
                if(generarPedido.esCorrecto(plato)){
                    //game.say(chef1,"Pedido entregado!")
                    game.onTick(500, "entregando", {plato.irse()})
                    plato.irse()
                    //game.say(plato, "entregando")
                    generarPedido.hallar(plato).entregada(true)
                    generarPedido.hallar(plato).cambiarImagen()
                    game.sound("entregaExitosa.mp3").play()
                    marcadorDeDinero.agregarDinero(generarPedido.hallar(plato).recompensa())
                    game.schedule(2000, {game.removeVisual(generarPedido.hallar(plato))
                                         generarPedido.hallar(plato).entregada(false)
                                         generarPedido.hallar(plato).cambiarImagen()
                                         generarPedido.quitar(plato)})
     //               game.schedule(10000, {mesaPlato.devolverPlato(plato)})

                } else{
                    //game.say(chef1,"Pedido incorrecto!")
                    game.sound("error2.mp3").play()
		    plato.position(game.at(37,0))
                    game.removeVisual(plato)
                    chef1.perderVidas()
                    vidas.get(chef1.vidas()).perderVida()
                    marcadorDeDinero.restarDinero(50)
                }
           }
        })

        //APOYAR PLATO
        /*game.whenCollideDo(chef1, {mesa =>
            keyboard.b().onPressDo{
                if((mesadasSimplesFrente.contains(mesa) || mesadasSimples.contains(mesa)) && chef1.objetoTransportado() != null){
                    if(platos.contains(chef1.objetoTransportado()) ){
                        mesa.apoyarPlato(chef1.objetoTransportado())
                    }
                    else {game.say(chef2,"trghewhert")}
                }
            }
        })*/

        //LAVAR PLATOS
        /*game.whenCollideDo(chef1, {mesa =>
        if(mesa == pileta && platos.contains(chef1.objetoTransportado())){
            pileta.lavar(chef1.objetoTransportado())
        }
        })*/

        //GENERAR PEDIDOS
        generarPedido.mostrarPedidos()
    }

    method crearMesadasSimples(posiciones, y){
        posiciones.forEach({posicion =>
            const mesadaSimple = new MesadaSimple(position = game.at(posicion, y))})
    }

    method crearMesadasFrente(posiciones, y){
        posiciones.forEach({posicion =>
            const mesadaSimpleFrente = new MesadaSimpleFrente(position = game.at(posicion, y))})
    }

    method crearMesadasSarten(posiciones, y){
        posiciones.forEach({posicion =>
            const mesaConSarten = new MesaConSarten(position = game.at(posicion, y))})
    }

    method crearMesaCuchillo(posiciones, y){
        posiciones.forEach({posicion =>
            const mesaConCuchillo = new MesaConCuchillo(position = game.at(posicion, y))})
    }

    method crearMenuAdulto(ordenes, posicionesX){
        posicionesX.forEachWithIndex({posicion, index =>
            const menuAdulto = new MenuAdulto(position = game.at(posicion, 17), orden = ordenes.get(index))})
    }

        method crearMenuJoven(ordenes, posicionesX){
        posicionesX.forEachWithIndex({posicion, index =>
            const menuJoven = new MenuJoven(position = game.at(posicion, 17), orden = ordenes.get(index))})
    }

        method crearMenuAnciano(ordenes, posicionesX){
        posicionesX.forEachWithIndex({posicion, index =>
            const menuAnciano = new MenuAnciano(position = game.at(posicion, 17), orden = ordenes.get(index))})
    }

}
