import Text.Show.Functions ()

----Ejemplos ----
baradero :: Ciudad
baradero =
  Ciudad
    { nombre = "Baradero",
      anioFundacion = 1615,
      atracciones = ["Parque del Este", "Museo Alejandro Barbich"],
      costoVida = 150
    }

nullish :: Ciudad
nullish =
  Ciudad
    { nombre = "Nullish",
      anioFundacion = 1800,
      atracciones = [],
      costoVida = 140
    }

caleta :: Ciudad
caleta =
  Ciudad
    { nombre = "Caleta",
      anioFundacion = 1901,
      atracciones = ["El Gorosito", "Faro Costanera"],
      costoVida = 120
    }

maipu :: Ciudad
maipu = Ciudad{
    nombre = "Maipu",
    anioFundacion = 1878,
    atracciones = ["Fortin Kakel"],
    costoVida = 115
}

azul :: Ciudad
azul = Ciudad{
    nombre = "Azul",
      anioFundacion = 1832,
      atracciones = ["Teatro Espanol", "Parque Municipal Sarmiento", "Costanera Cacique Catriel"],
      costoVida = 190
}

----Punto 1----

data Ciudad = Ciudad
  { nombre :: String,
    anioFundacion :: Int,
    atracciones :: [String],
    costoVida :: Int
  }
  deriving (Eq, Show, Read)

--Valor de una ciudad
valorCiudad :: Ciudad -> Int
valorCiudad ciudad
  | verificarAnio ciudad = diferenciaAnio ciudad
  | verificarAtraccionCero ciudad = 2 * costoVida ciudad
  | otherwise = 3 * costoVida ciudad

verificarAnio :: Ciudad -> Bool
verificarAnio ciudad = anioFundacion ciudad < 1800

diferenciaAnio :: Ciudad -> Int
diferenciaAnio ciudad = 5 * (1800 - anioFundacion ciudad)

verificarAtraccionCero :: Ciudad -> Bool
verificarAtraccionCero ciudad = length (atracciones ciudad) == 0

----Punto 2 ----
--Atraccion Copada
atraccionCopada :: Ciudad -> Bool
atraccionCopada ciudad = any empiezaConVocal (atracciones ciudad)

empiezaConVocal :: String -> Bool
empiezaConVocal [] = False
empiezaConVocal (x : _) = x `elem` "aeiouAEIOU"

--Ciudad sobria
ciudadSobria :: Ciudad -> Int -> Bool
ciudadSobria ciudad cantidadDeLetras = all (`tieneMasDeXLetras` cantidadDeLetras) (atracciones ciudad) && (atracciones ciudad /= [])

tieneMasDeXLetras :: String -> Int -> Bool
tieneMasDeXLetras atraccion x = length atraccion > x

--Ciudad con nombre raro
nombreRaro :: Ciudad -> Bool
nombreRaro ciudad = tieneMasDe5Letras (nombre ciudad)

tieneMasDe5Letras :: String -> Bool
tieneMasDe5Letras nombre = length nombre < 5

----Punto 3 ----
type Evento = Ciudad -> Ciudad

--Sumar una nueva atraccion
nuevaAtraccion :: String -> Evento
nuevaAtraccion atraccion = incrementoDelCostoDeVida . agregoAtraccion atraccion

agregoAtraccion :: String -> Evento
agregoAtraccion atraccion ciudad = ciudad {atracciones = atraccion : atracciones ciudad}

incrementoDelCostoDeVida :: Ciudad -> Ciudad
incrementoDelCostoDeVida ciudad = ciudad {costoVida = costoVida ciudad * 120 `div` 100}

--Crisis
crisis :: Evento
crisis ciudad = ciudad {costoVida = diezPorciento (costoVida ciudad), atracciones = cerrarAtraccion ciudad}

diezPorciento :: Int -> Int
diezPorciento x = x * 90 `div` 100

cerrarAtraccion :: Ciudad -> [String]
cerrarAtraccion ciudad
  | null (atracciones ciudad) = []
  | otherwise = init (atracciones ciudad)

--Remodelacion

remodelacion :: Int -> Evento
remodelacion porcentajeIncremento ciudad = ciudad {nombre = agregarNew ciudad, costoVida = incrementarCosto porcentajeIncremento ciudad}

agregarNew :: Ciudad -> String
agregarNew ciudad = "New " ++ nombre ciudad

incrementarCosto :: Int -> Ciudad -> Int
incrementarCosto porcentaje ciudad = costoVida ciudad * (100 + porcentaje) `div` 100

--Reevaluacion

reevaluacion :: Int -> Evento
reevaluacion letrasAsuperar ciudad
  | ciudadSobria ciudad letrasAsuperar = ciudad {costoVida = costoVida ciudad * 110 `div` 100}
  | otherwise = ciudad {costoVida = costoVida ciudad - 3}

----Punto 4 ----
--Transformacion
transformacion :: Int -> Int -> Evento
transformacion porcentajeIncremento letrasAsuperar = (crisis . reevaluacion letrasAsuperar . remodelacion porcentajeIncremento)

--Modelar anio
data Anio = UnAnio
  { anios :: Int,
    eventos :: [Evento]
  }
  deriving (Show)

paso2022 :: Anio
paso2015 :: Anio
paso2023 :: Anio
paso2021 :: Anio
paso2022 = UnAnio {anios = 2022, eventos = [crisis, remodelacion 5, reevaluacion 7]}

paso2015 = UnAnio {anios = 2015, eventos = []}

paso2023 = UnAnio {anios = 2023, eventos = [crisis, agregoAtraccion "parque", remodelacion 10, remodelacion 20]} --Se usa 5.1

paso2021 = UnAnio {anios = 2021, eventos = [crisis, agregoAtraccion "playa"]} --Se usa 5.3

--Anios Pasan

aniosPasan :: Anio -> Ciudad -> Ciudad
aniosPasan unAnio ciudad
  | hayEventos unAnio == 0 = ciudad
  | otherwise = aplicarEventos unAnio ciudad

hayEventos :: Anio -> Int
hayEventos unAnio = length (eventos unAnio)

aplicarEventos :: Anio -> Ciudad -> Ciudad
aplicarEventos unAnio ciudad = foldl (\ciudad' evento -> evento ciudad') ciudad (eventos unAnio)

--4.2 algo mejor
type CriterioDeComparacion = Criterio -> Bool
type Criterio = Ciudad -> Int

cantidadDeAtracciones :: Criterio
cantidadDeAtracciones ciudad = length (atracciones ciudad)

costoDeVida :: Criterio
costoDeVida = costoVida

algoMejor :: Ciudad -> Evento -> CriterioDeComparacion
algoMejor ciudad evento = comparoCriterio evento ciudad (>)

comparoCriterio :: Evento -> Ciudad -> (Int -> Int -> Bool) -> CriterioDeComparacion
comparoCriterio evento ciudad signo criterio = signo (criterio (evento ciudad)) (criterio ciudad)

--------------------------Auxiliares Pto 4--------------------------------------
aplicarEventosCriterio :: Ciudad -> [Evento] -> Ciudad
aplicarEventosCriterio ciudad listaDeEventos = foldl (\ciudad' evento -> evento ciudad') ciudad listaDeEventos

obtenerLista :: Anio -> Ciudad -> (Ciudad -> Evento -> Bool) ->[Evento]
obtenerLista anio ciudad criterio = filter (criterio ciudad) (eventos anio)
----------------------------------------------------------------
--4.3 Costo de vida que suba
costoDeVidaSube :: Anio -> Ciudad -> Ciudad
costoDeVidaSube anio ciudad = aplicarEventosCriterio ciudad (obtenerLista anio ciudad eventoSubeCostoVida)

eventoSubeCostoVida :: Ciudad -> Evento -> Bool
eventoSubeCostoVida ciudad evento = algoMejor ciudad evento costoVida

--4.4 Costo de vida que baje
costoDeVidaBaje :: Anio -> Ciudad -> Ciudad
costoDeVidaBaje anio ciudad = aplicarEventosCriterio ciudad (obtenerLista anio ciudad eventoBajaCostoVida)

eventoBajaCostoVida :: Ciudad -> Evento -> Bool
eventoBajaCostoVida ciudad evento = comparoCriterio evento ciudad (<) costoVida

--4.5 Valor que suba
valorQueSuba :: Anio -> Ciudad -> Ciudad
valorQueSuba anio ciudad = aplicarEventosCriterio ciudad (obtenerLista anio ciudad eventoSubeValor)

eventoSubeValor :: Ciudad -> Evento -> Bool
eventoSubeValor ciudad evento = comparoCriterio evento ciudad (>) valorCiudad

--5.1 Eventos ordenados
--Recursividad
eventosOrdenados :: Anio -> Ciudad -> Bool
eventosOrdenados anio ciudad = ordenadasCostoVida (ciudadesVivenEventos ciudad (eventos anio))

ordenadasCostoVida :: [Ciudad] -> Bool
ordenadasCostoVida [ciudad] = True
ordenadasCostoVida (ciudad1:ciudad2:ciudades) = costoVida ciudad1 < costoVida ciudad2 && ordenadasCostoVida (ciudad2:ciudades)

ciudadesVivenEventos :: Ciudad -> [Evento] -> [Ciudad]
ciudadesVivenEventos ciudad [evento] = [evento ciudad]
ciudadesVivenEventos ciudad (evento:eventos) = evento ciudad: ciudadesVivenEventos ciudad eventos

--5.2 Ciudades ordenadas

listaCiudad1 :: [Ciudad]
listaCiudad1 = [caleta, nullish, baradero, azul]

listaCiudad2 :: [Ciudad]
listaCiudad2 = [caleta, azul, baradero]

ciudadesOrdenadas :: Evento -> [Ciudad] -> Bool
ciudadesOrdenadas evento ciudades = (estanOrdenados . aplicoEventos evento) ciudades

aplicoEventos :: Evento -> [Ciudad] -> [Ciudad]
aplicoEventos evento ciudades = map evento ciudades

estanOrdenados :: [Ciudad] -> Bool
estanOrdenados ciudades =  ordenadasCostoVida ciudades

--5.3 Años ordenados
listaAnios1 :: [Anio]
listaAnios1 = [paso2021, paso2022, paso2023]

listaAnios2 :: [Anio]
listaAnios2 = [paso2022, paso2021, paso2023]

------------------Correccion-----------------------
aniosOrdenados :: [Anio] -> Ciudad -> Bool
aniosOrdenados [] _ = True -- Lista vacía
aniosOrdenados [_] _ = True -- Un solo elemento -> ordenada
aniosOrdenados (anio1:anio2:aniosN) ciudad =
  costoVida ciudad1 <= costoVida ciudad2 && aniosOrdenados (anio2 : aniosN) ciudad2
  where
    (ciudad1, ciudad2) = (aplicarEventos anio1 ciudad, aplicarEventos anio2 ciudad)

---- Punto 6
--6.1 - Una serie de eventos interminables
anio2024 :: Evento -> Anio
anio2024 evento = UnAnio {anios = 2024, eventos = eventosInfinitos}
  where
    eventosInfinitos = evento : eventosInfinitos

--6.2 Eventos Ordenados
{- La lista de eventos del año 2024 es infinta por lo que eventosOrdenados nunca terminaria de evaluar la lista de eventos, en el caso en el que los eventos esten ordenados.
En cambio, si algun elemento de la lista no esta ordenado, es decir, devuelve Falso, eventosOrdenados dejaria de ejecutar devolviendo False gracias a la "lazy evaluation", la cual evalua
argumentos a medida de que lo necesite. -}

--6.3 Ciudades Ordenadas
--Si, hay resultado posible ya que solo evalua un evento con una lista de ciudades. Por mas que el año 2024 tenga una lista infinita de eventos, la funcion ciudadesOrdenadas tomaria solo el primer evento. Esto es debido a que Haskell no evalua expresiones hasta que sea necesario. Esto se denomina lazy evaluation.

--6.4 Años Ordenados
--Si, puede haber un resultado. Ya que la funcion aniosOrdenados tiene definida como primer condicion que si la lista de años recibida tiene un solo año entonces esta ordenada. Al enviarle solo el año 2024 la lista estara ordenada. Esto es debido a la evaluacion perezosa de Haskell que significa que las expresiones no se evaluan hasta ser necesario. En este caso no es necesario evaluar anio2024. Por ende se cumple.
--Ahora si se le envian dos o mas años, siendo el año 2024 uno de ellos, entonces ahi no dara resultado. Ya que es necesario analizar anio2024 para determinar el costo de vida pero la lista es infinita.
