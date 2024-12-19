import wollok.game.*
import chefs.*
import escenario.*
import menu.*
import nivel.*

class ObjetoMovible{
    var property imagen
    method image() = imagen
    var property position
    var property enMovimiento = true

    method move(nuevaPosicion){
        if(enMovimiento){
            self.position(nuevaPosicion)
        }
    }
}

object movimiento{

//ESTO SE IRIA DE ACA

    method flechas(personaje){
        keyboard.up().onPressDo { if(personaje.position().y()==11 && personaje.position().x()>=13 && personaje.position().x()<=18){/*Nada*/} else{ personaje.move(personaje.position().up(1))} }
	    keyboard.down().onPressDo {if(personaje.position().y()==10 && personaje.position().x()>=13 && personaje.position().x()<=18){/*Nada*/} else{ personaje.move(personaje.position().down(1))} }
	    keyboard.left().onPressDo { if(personaje.position().x()==19 && personaje.position().y()<10 && personaje.position().y()>11){/*Nada*/} else{ personaje.move(personaje.position().left(1))}  }
        keyboard.right().onPressDo { if(personaje.position().x()==13 && personaje.position().y()<10 && personaje.position().y()>11){/*Nada*/} else{ personaje.move(personaje.position().right(1))} }
    }

    method wasd(personaje){
        keyboard.w().onPressDo { if(personaje.position().y()==11 && personaje.position().x()>=13 && personaje.position().x()<=18){/*Nada*/} else{ personaje.move(personaje.position().up(1))}  }
	    keyboard.s().onPressDo { if(personaje.position().y()==10 && personaje.position().x()>=13 && personaje.position().x()<=18){/*Nada*/} else{ personaje.move(personaje.position().down(1))} }
	    keyboard.a().onPressDo { if(personaje.position().x()==19 && personaje.position().y()<10 && personaje.position().y()>11){/*Nada*/} else{ personaje.move(personaje.position().left(1))}  }
	    keyboard.d().onPressDo { if(personaje.position().x()==13 && personaje.position().y()<10 && personaje.position().y()>11){/*Nada*/} else{ personaje.move(personaje.position().right(1))} }
    } 

//HASTA ACA (Abajo esta mejorado)

    method seguirChef(elemento, chef){
        keyboard.up().onPressDo { elemento.move(chef.position()) }
	    keyboard.down().onPressDo { elemento.move(chef.position()) }
	    keyboard.left().onPressDo { elemento.move(chef.position()) }
	    keyboard.right().onPressDo { elemento.move(chef.position()) }
    }
}


//MOVIMIENTO MEJORADO


    const zonasRestringidas = [
        [0,0,3,19],
        [30,0,39,19],
        [4,0,29,1],
        [4,18,29,19],
        [14,12,19,17],
        [14,2,19,9]
    ]
/*
    method estaRestringido (x,y){
        return zonasRestringidas.any{zona ->
            x>=zona[0] && x<=zona[2] && y>=zona[1] && y<=zona[3]
        }
    }

    method intentarMover(personaje,nuevaPos){
        if(!estaRestringido(nuevaPos.x(),nuevaPos.y())){
            personaje.move(nuevaPos)
        }
    }
    
    method flechas(personaje){
        keyboard.up().onPressDo{
            intentarMover(personaje,personaje.position().up(1))
       }
       keyboard.down().onPressDo{
            intentarMover(personaje,personaje.position().down(1))
       }
       keyboard.left().onPressDo{
            intentarMover(personaje,personaje.position().left(1))
       }
       keyboard.right().onPressDo{
            intentarMover(personaje,personaje.position().right(1))
       }
    }
    method wasd(personaje){
        keyboard.w().onPressDo{
            intentarMover(personaje,personaje.position().up(1))
       }
       keyboard.s().onPressDo{
            intentarMover(personaje,personaje.position().down(1))
       }
       keyboard.a().onPressDo{
            intentarMover(personaje,personaje.position().left(1))
       }
       keyboard.d().onPressDo{
            intentarMover(personaje,personaje.position().right(1))
       }
    }

*/