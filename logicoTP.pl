% Punto 1 - Modelado
% Civilizaciones
civilizacion(romanos).
civilizacion(incas).

% Tecnologías
tecnologia(herreria).
tecnologia(forja).
tecnologia(emplumado).
tecnologia(laminas).
tecnologia(fundicion).
tecnologia(punzon).
tecnologia(horno).
tecnologia(malla).
tecnologia(placas).
tecnologia(molino).
tecnologia(collera).
tecnologia(arado).

% Jugadores
jugador(ana).
jugador(beto).
jugador(carola).
jugador(dimitri).

% Jugadores y sus civilizaciones
jugUsaCivil(ana, romanos).
jugUsaCivil(beto, incas).
jugUsaCivil(carola, romanos).
jugUsaCivil(dimitri, romanos).

% Tecnologías desarrolladas por jugadores
desarrollo(ana, herreria).
desarrollo(ana, forja).
desarrollo(ana, emplumado).
desarrollo(ana, laminas).
desarrollo(beto, herreria).
desarrollo(beto, forja).
desarrollo(beto, fundicion).
desarrollo(carola, herreria).
desarrollo(dimitri, herreria).
desarrollo(dimitri, fundicion).

% Punto 2 - Experto en metales

desarrollaHerreriaForja(Jugador) :-
    desarrollo(Jugador, herreria),
    desarrollo(Jugador, forja).

expertoEnMetales(Jugador) :-
    desarrollaHerreriaForja(Jugador),
    desarrollo(Jugador, fundicion).

expertoEnMetales(Jugador) :-
    desarrollaHerreriaForja(Jugador),
    jugUsaCivil(Jugador, romanos).

% Punto 3 - Civilizacion Popular
civilizacionPopular(Civilizacion) :-
    jugUsaCivil(Jugador1, Civilizacion),
    jugUsaCivil(Jugador2, Civilizacion),
    Jugador1 \= Jugador2.

% Punto 4 - Alcance global
alcanceGlobal(Tecnologia) :-
    tecnologia(Tecnologia),
    forall(jugador(Jugador), desarrollo(Jugador, Tecnologia)).

% Punto 5 - Civilizacion Lider
alcanceTecnologia(Civilizacion, Tecnologia) :-
    jugUsaCivil(Jugador, Civilizacion),
    desarrollo(Jugador, Tecnologia).

civilizacionLider(Civilizacion) :-
    civilizacion(Civilizacion),
    forall((desarrollo(_, Tecnologia)) ,alcanceTecnologia(Civilizacion, Tecnologia)).

% Punto 6 - Modelado
% Unidades de cada jugador
unidadesQueTiene(ana, jinete(caballo)).
unidadesQueTiene(ana, piquero(conEscudo, 1)).
unidadesQueTiene(ana, piquero(sinEscudo, 2)).
unidadesQueTiene(beto, campeon(100)).
unidadesQueTiene(beto, campeon(80)).
unidadesQueTiene(beto, piquero(conEscudo, 1)).
unidadesQueTiene(beto, jinete(camello)).
unidadesQueTiene(carola, piquero(sinEscudo, 3)).
unidadesQueTiene(carola, piquero(conEscudo, 2)).

% Punto 7 - Unidad con más vida arreglar porcentaje
vida(jinete(camello), 80).
vida(jinete(caballo), 90).
vida(campeon(Vida), Vida).
vida(piquero(sinEscudo, 1), 50).
vida(piquero(sinEscudo, 2), 65).
vida(piquero(sinEscudo, 3), 70).

vida(piquero(conEscudo, Nivel), VidaNueva) :- 
    vida(piquero(sinEscudo, Nivel), VidaOriginal),
    porcentaje(VidaOriginal, VidaNueva).

porcentaje(VidaOriginal,VidaNueva):-
    VidaNueva is VidaOriginal*1.1.

unidadConMasVida(Jugador, UnidadVidaMayor) :-
    jugador(Jugador), 
    vida(UnidadVidaMayor, Vida1), 
   	unidadesQueTiene(Jugador,UnidadVidaMayor), 
    forall((unidadesQueTiene(Jugador, OtraUnidad), OtraUnidad \= UnidadVidaMayor), 
           (vida(OtraUnidad, OtraVida), OtraVida =< Vida1)).

vidaMayor(Jugador, UnidadVidaMayor, VidaMaxima)  :-
    unidadConMasVida(Jugador,UnidadVidaMayor),    
    vida(UnidadVidaMayor, VidaMaxima). 

%Punto 8 - Unidad gana a otra

ganaSiempre(jinete(_), campeon(_)).
ganaSiempre(campeon(_), piquero(_, _)).
ganaSiempre(piquero(_, _), jinete(_)).
ganaSiempre(jinete(camello), jinete(caballo)).

unidadGana(Unidad1, Unidad2) :-
    ganaSiempre(Unidad1, Unidad2).

unidadGana(Unidad1, Unidad2) :- %Ya esta bien
    ganaSiempre(Unidad1, Unidad2),
    vida(Unidad1, Vida1),
    vida(Unidad2, Vida2),
    Vida1 > Vida2.

%Punto 9 - jugador puede sobrevivir a un asedio / Bien

contarElementos(Jugador, Unidad, Cant) :-
    findall(Unidad, unidadesQueTiene(Jugador, Unidad), Elemento),
    length(Elemento, Cant).

sobreviveAsedio(Jugador) :-
    jugador(Jugador),
    contarElementos(Jugador, piquero(conEscudo,_), CantConEscudo),
    contarElementos(Jugador, piquero(sinEscudo,_), CantSinEscudo),
    CantConEscudo > CantSinEscudo.

%Punto 10 - Árbol de tecnologías
dependeDe(emplumado, herreria).
dependeDe(punzon, emplumado).
dependeDe(forja, herreria).
dependeDe(fundicion, forja).
dependeDe(horno, fundicion).
dependeDe(laminas, herreria).
dependeDe(malla, laminas).
dependeDe(placas, malla).
dependeDe(collera, molino).
dependeDe(arado, collera).

dependeDeRecursivo(TecBase, TecBase). % Caso base: una tecnología depende de sí misma.
dependeDeRecursivo(TecBase, TecDep) :- 
    dependeDe(TecBase, TecIntermedia), 
    dependeDeRecursivo(TecIntermedia, TecDep).

puedeDesarrollar(Jugador, Tecnologia) :-
    tecnologia(Tecnologia),
    not(desarrollo(Jugador, Tecnologia)), % El jugador no debe haber desarrollado la tecnología.
    forall(dependeDeRecursivo(Tecnologia, Dependencia), desarrollo(Jugador, Dependencia)).
