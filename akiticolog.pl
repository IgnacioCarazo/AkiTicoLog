%objetos
nombre(["pelo"|S], S).
nombre(["ojos"|S],S).

%lugares de nacimiento
nombre(["alajuela"|S], S).
nombre(["sanjose"|S], S).
nombre(["cartago"|S], S).
nombre(["guanacaste"|S], S).
nombre(["heredia"|S], S).
nombre(["puntarenas"|S], S).
nombre(["limon"|S], S).

%mi personaje
mi(["mi"|S],S).
personaje(["personaje"|S],S).

%verbos
verbo(singular,["vive"|S], S).
verbo(singular,["tiene"|S], S).
verbo(singular, ["nacio"|S], S).
verbo(singular, ["es"|S],S).
verbo(singular, ["fue"|S],S).
verbo(singular, ["mide"|S],S).

%colores
atributo(color,["negro"|S],S).
atributo(color,["cafe"|S],S).
atributo(color,["azul"|S],S).
atributo(color,["verde"|S],S).
atributo(color,["celeste"|S],S).
atributo(color,["rojo"|S],S).
atributo(color,["negros"|S],S).
atributo(color,["azules"|S],S).
atributo(color,["cafes"|S],S).
atributo(color,["verdes"|S],S).
atributo(color,["celestes"|S],S).
atributo(color,["rojos"|S],S).

%edades y estaturas
atributo(["35"|S],S).
atributo(["1.87m"|S],S).

%sexo
atributo(["hombre"|S],S).
atributo(["mujer"|S],S).

%profesiones
atributo(["futbolista"|S],S).
atributo(["comediante"|S],S).
atributo(["boxeadora"|S],S).
atributo(["actriz"|S],S).
atributo(["cantante"|S],S).
atributo(["presidente"|S],S).
atributo(["influencer"|S],S).
atributo(["periodista"|S],S).

%si y no
negacion_afirmacion(["si"|S],S).
negacion_afirmacion(["no"|S],S).
negacion_afirmacion(["si,"|S],S).
negacion_afirmacion(["no,"|S],S).


%articulos
determinante(["en"|S],S).
determinante(["el"|S],S).
determinante(["la"|S],S).
determinante(["los"|S],S).

%pronombres
determinante(pronombre,femenino, ["ella"|S], S).
determinante(pronombre,masculino, ["el"|S], S).

%palabras clave
palabras_clave("nacio").
palabras_clave("murio").
palabras_clave("estatura").
palabras_clave("murio").
palabras_clave("tiene").
palabras_clave("dedica").
palabras_clave("es").
carac_fisicas_clave("pelo").
carac_fisicas_clave("ojos").

% famositico(nombre,edad,lugar de nacimiento, color de pelo,
% profesion, color de ojos)
% ##############POR AHORA SOLO ESTAN CORRECTOS LOS DATOS DE HANNAH, LOS
% DEMAS SON PARA PROBAR.###############
famositico("Hanna Gabriels","35","alajuela","negro","boxeadora","verdes","mujer").
famositico("Keylor Navas","33","sanjose","negro","futbolista","negros","hombre").
famositico("Alvaro Saborio","38","alajuela","negro","futbolista","negros","hombre").
famositico("Edgar Silva","55","guanacaste","negro","periodista","cafes","hombre").
famositico("Nane Miller", "26","sanjose","macho","influencer","verdes","mujer").
famositico("Mauricio Hoffman","37", "sanjose", "macho", "periodista","negros","hombre").
famositico("Mauricio 'El Chunche' Montero", "57",).

get_famositico(Famositico,[Pelo|ListaAtributos]) :-
     not(get_famositico(Famositico,Pelo,ListaAtributos)),
     write_ln("En la base de datos no se prese").


get_famositico(Famositico, Pelo, [Ojos|ListaAtributos]) :-
    get_famositico(Famositico,Pelo,Ojos,ListaAtributos).

get_famositico(Famositico, Pelo, Ojos, [ProvinciaNacimiento|ListaAtributos]) :-
    get_famositico(Famositico,Pelo,Ojos,ProvinciaNacimiento,ListaAtributos).

get_famositico(Famositico, Pelo, Ojos, ProvinciaNacimiento, [Profesion|ListaAtributos]) :-
    get_famositico(Famositico, Pelo, Ojos, ProvinciaNacimiento, Profesion, ListaAtributos).

get_famositico(Famositico, Pelo, Ojos, ProvinciaNacimiento, Profesion, [Edad|ListaAtributos]) :-
    get_famositico(Famositico, Pelo, Ojos, ProvinciaNacimiento, Profesion, Edad, ListaAtributos).

get_famositico(Famositico, Pelo, Ojos, ProvinciaNacimiento, Profesion, Edad, [Sexo|ListaAtributos]) :-
    famositico(Famositico,Edad,ProvinciaNacimiento,Pelo,Profesion,Ojos,Sexo).


% una oracion pronombre/verbo/determinante/objeto/atributo del objeto
% por ejemplo: ella tiene el pelo cafe.
oracion(S0, S) :-
    sintagma_nominal(S0,S1),
    sintagma_verbal(S1,S).


% una oracion que puede solamente ser si o no
% por ejemplo: si.

oracion(S0, S) :-
    negacion_afirmacion(S0,S).

% una oracion con un si o no y luego diciendo que es
% por ejemplo: si, es boxeadora o no, es actriz

oracion(S0, S) :-
    negacion_afirmacion(S0,S1),
    sintagma_nominal(S1,S2),
    sintagma_verbal(S2,S).


% pronombre
sintagma_nominal(S0, S) :-
    determinante(pronombre,_, S0,S).

% mi personaje
sintagma_nominal(S0, S) :-
    mi(S0,S1),
    personaje(S1,S).




% determinante/objeto/atributo
% por ejemplo: el pelo cafe, el pelo azul, etc
sintagma_nominal(S0, S) :-
    determinante(S0,S1),
    nombre(S1,S2),
    atributo(S2,S).

sintagma_nominal(S0, S) :-
    determinante(S0,S1),
    nombre(S1,S2),
    atributo(color,S2,S).


% determinante/objeto
% por ejemplo: el pelo, en alajuela, etc
sintagma_nominal(S0, S) :-
    determinante(S0,S1),
    nombre(S1,S).

% verbo/atributo
% por ejemplo: es futbolista, fue actriz, tiene 35, etc
sintagma_verbal(S0, S) :-
    verbo(singular, S0, S1),
    atributo(S1, S).

% verbo/sintagma nominal
% por ejemplo: vive en alajuela, tiene el pelo cafe
sintagma_verbal(S0, S) :-
    verbo(singular, S0, S1),
    sintagma_nominal(S1, S).


% buscar_data se basa en que dependiendo de la palabra clave que se
% encuentre en el input del usuario se decide que buscar dentro de los
% famositicos
% por ejemplo: en la oracion "ella nacio en alajuela" se busca una
% palabra clave, en este caso "nacio". Como la palabra clave es nacio
% busca si dentro del input del usuario hay algun dato (alguna edad),
% que tambien tengan los famositicos

buscar_data("es", L, Sexo) :-
    famositico(_,_,_,_,_,_,Sexo),
    buscar_palabra(Sexo, L),
    !.

buscar_data("tiene", L, Edad) :-
    famositico(_,Edad,_,_,_,_,_),
    buscar_palabra(Edad, L),
    !.

buscar_data("nacio", L, Lugar) :-
    famositico(_,_,Lugar,_,_,_,_),
    buscar_palabra(Lugar, L),
    !.

buscar_data("tiene", L, Atributo) :-
    carac_fisicas_clave(Caracteristica),
    buscar_palabra(Caracteristica, L),
    atributo_fisico(Caracteristica, L, Atributo),
    !.

buscar_data("es", L, Profesion) :-
    famositico(_,_,_,_,Profesion,_,_),
    buscar_palabra(Profesion, L),
    !.


%atributo_fisico
atributo_fisico("ojos", L, Atributo) :-
    famositico(_,_,_,_,_,Atributo,_),
    atributo(color,[Atributo|_],_),
    buscar_palabra(Atributo, L).

atributo_fisico("pelo", L, Atributo) :-
    famositico(_,_,_,Atributo,_,_,_),
    atributo(color,[Atributo|_],_),
    buscar_palabra(Atributo, L).


% si encuentra una palabra clave llama a buscar_data.
determinar_dato_a_buscar(L, Palabra, Atributo) :-
    buscar_palabra_clave(L, Palabra),
    buscar_data(Palabra, L, Atributo).


% busca la palabra clave en la lista con las palabras ingresadas por el
% usuario basandose en las palabras clave que hay en la base de datos
buscar_palabra_clave(L, Palabra) :-
    palabras_clave(Palabra),
    buscar_palabra(Palabra, L),
    !.

buscar_palabra(Elemento, [Elemento|_]).

buscar_palabra(Elemento, [_|Lista]) :-
    buscar_palabra(Elemento, Lista).

% se usa para verificar que los atributos ingresados pertenezcan a algun
% famositico dentro de la base de datos
verificar_datos(L, Palabra, Atributo) :-
    determinar_dato_a_buscar(L, Palabra, Atributo),!.

verificar_datos(L, Palabra, Atributo) :-
    not(determinar_dato_a_buscar(L, Palabra, Atributo)),
    write("La base de datos no presenta a nadie con esas caracteristicas, vuelva a intentar"), false.

concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]) :-
    concatenar(L1,L2,L3).

verificar_oracion(L) :-
    oracion(L,[]),!.

verificar_oracion(L) :-
    not(oracion(L,[])),
    write_ln(""),
    write_ln("La oracion no es reconocida por AkiTicoLog, vuelva a intentar"),
    write_ln(""), false.

verifica_input("listo") :-
    write_ln(""),
    pregunta1([]).

verifica_input("no he decidido") :-
    write_ln(""),
    write_ln("Tomate tu tiempo y escribe 'listo' cuando estes listo."),
    write_ln(""),
    read(Input),
    verifica_input(Input).

verifica_input("exit") :-
    write_ln(""),
    write_ln("Hasta luego!"),
    write_ln("").



akiticolog() :-
    write_ln("Escribe 'listo' para iniciar."),
    write_ln("Escribe 'no he decidido' si necesitas mas tiempo."),
    write_ln("Escribe 'exit' en cualquier momento para terminar el programa."),
    write_ln(""),
    write_ln("Hola, soy AkiTicoLog y puedo adivinar un famositico en el que estes pensando."),write_ln(""),
    write_ln("Piensa en un famositico."),write_ln(""),
    read(Input),
    verifica_input(Input).



pregunta1(ListaAnterior) :-
    write_ln("Tu personaje es hombre o mujer?"),write_ln(""),
    read(Input),
    split_string(Input," ","",L),
    write_ln(L),
    verificar_oracion(L),
    determinar_dato_a_buscar(L, Palabra, Atributo),
    write_ln(Palabra),
    write_ln(Atributo),
    concatenar([Atributo],ListaAnterior,ListaAtributos),
    write(ListaAtributos),
    pregunta2(ListaAtributos).



pregunta2(ListaAnterior) :-
    write_ln("      "),
    write_ln("Mmm interesante..."),
    write_ln("Que edad tiene tu personaje?"),
    read(Input),
    split_string(Input," ","",L),
    write_ln(L),
    verificar_oracion(L),
    determinar_dato_a_buscar(L, Palabra, Atributo),
    write_ln(Palabra),
    write_ln(Atributo),
    concatenar([Atributo],ListaAnterior,ListaAtributos),
    write(ListaAtributos),
    pregunta3(ListaAtributos).


pregunta3(ListaAnterior) :-
    write_ln("      "),
    write_ln("Aun no es suficiente para adivinar"),
    write_ln("Dime cual es la profesion de tu famositico."),
    read(Input),
    split_string(Input," ","",L),
    write_ln(L),
    verificar_oracion(L),
    determinar_dato_a_buscar(L, Palabra, Atributo),
    write_ln(Palabra),
    write_ln(Atributo),
    concatenar([Atributo],ListaAnterior,ListaAtributos),
    write(ListaAtributos),
    pregunta4(ListaAtributos).


pregunta4(ListaAnterior) :-
    write_ln("      "),
    write_ln("En que provincia nacio a persona en la que estas pensando?"),
    read(Input),
    split_string(Input," ","",L),
    write_ln(L),
    verificar_oracion(L),
    determinar_dato_a_buscar(L, Palabra, Atributo),
    write_ln(Palabra),
    write_ln(Atributo),
    concatenar([Atributo],ListaAnterior,ListaAtributos),
    write_ln(ListaAtributos),
    pregunta5(ListaAtributos).

pregunta5(ListaAnterior) :-
    write_ln("      "),
    write_ln("Todavia necesito alguna caracteristica fisica"),
    write_ln("De que color son los ojos de tu personaje?"),
    read(Input),
    split_string(Input," ","",L),
    write_ln(L),
    verificar_oracion(L),
    determinar_dato_a_buscar(L, Palabra, Atributo),
    write_ln(Palabra),
    write_ln(Atributo),
    concatenar([Atributo],ListaAnterior,ListaAtributos),
    write_ln(ListaAtributos),
    pregunta6(ListaAtributos).


pregunta6(ListaAnterior) :-
    write_ln("      "),
    write_ln("Dime el color del cabello tambien."),
    read(Input),
    split_string(Input," ","",L),
    verificar_oracion(L),
    determinar_dato_a_buscar(L, Palabra, Atributo),
    concatenar([Atributo],ListaAnterior,ListaAtributos),
    get_famositico(Famositico, ListaAtributos),
    write("Estas pensando en "),
    write(Famositico).









% ###por ahora esta fallando con las estaturas entonces estoy pensando
% en quitar ese atributo de los famositicos###

% idea: Pregunta 1: Formar una
% lista con los famositicos que cumplen con el atributo ingresado por el
% usuario. Pregunta 2: A partir de la lista formada en la pregunta 1,
% dejar solo los famositicos que tambien cumplan con el atributo
% ingresado por el usuario en la pregunta 2. Pregunta 3: A partir de la
% lista formada en la pregunta 2, repetir los pasos y dejar en la lista
% solo a los famositicos que cumplan con los atributos. De esta forma
% solo estarian en la lista los famositicos que cumplan con los 3
% diferentes atributos ingresados.

% Seguir esta secuencia por todas las preguntas necesarias hasta tener
% una lista de longitud = 1, que significa que solo hay un famositico
% que cumple con todos esos atributos ingresados.
