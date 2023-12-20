nro(1).
nro(2).
nro(3).
nro(4).
nro(5).
nro(6).
nro(7).
nro(8).

% pieza(nombre,color,ubicacionY,ubicacionX).
pieza(torre, negra, 2,1).
pieza(torre, negra, 3,4).
pieza(reina, negra, 5,5).
pieza(reina,negra,10,10).

% Encontrar los casilleros libres, es decir las posiciones del tablero donde no hay ninguna ficha

casilleroLibre(UbiY,UbiX):-
    nro(UbiX),
    nro(UbiY),
    not(pieza(_,_,UbiY,UbiX)).

% Detectar si hay información errónea, como ser un casillero ocupado por dos piezas a la vez, una pieza en un casillero inválido,
% algun elemento extraño en un casillero.

infoErronea(UbiY,UbiX):-
    pieza(Pieza1,_,UbiY,UbiX),
    pieza(Pieza2,_,UbiY,UbiX),
    Pieza2 \= Pieza1.

infoErronea(UbiY, UbiX) :-
    not(nro(UbiY)), not(nro(UbiX)),
    pieza(_,_,UbiY,UbiX).

% El movimiento de la torre es en líneas rectas, ya sea por filas o columnas.
% Encontrar todos los casilleros a los que puede moverse la torre de una posicion dada.
% Tienen que estar libres u ocupados por una pieza del otro color.
% (No hace falta contemplar que tenga el camino libre, sólo el casillero de llegada)
% No se puede mover al mismo casillero donde está originalmente la torre. 

casilleroLibreColor(Color,UbiY,UbiX):-
    nro(UbiX),
    nro(UbiY),
    not(pieza(_,Color,UbiY,UbiX)).

moverTorre(UbiYActual, UbiXActual, UbiYDestino, UbiXDestino):-
    pieza(torre,Color,UbiYActual,UbiXActual), %Verifica si la torre existe y de que color es
    UbiYDestino \= UbiYActual, % Verifica si se mueve verticalmente
    casilleroLibreColor(Color,UbiYDestino,UbiXDestino), %verifica que el casillero de llegada no haya una pieza de su color
    not(infoErronea(UbiYDestino, UbiXDestino)). %verifica si es un movimiento erroneo.

moverTorre(UbiYActual, UbiXActual, UbiYDestino, UbiXDestino):-
    pieza(torre,Color,UbiYActual,UbiXActual),
    UbiXDestino \= UbiXActual, % Verifica si se mueve horizontalmente
    casilleroLibreColor(Color,UbiYDestino,UbiXDestino),
    not(infoErronea(UbiYDestino, UbiXDestino)).
