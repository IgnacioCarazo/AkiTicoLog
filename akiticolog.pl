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

%mi personaje/famositico
mi(["mi"|S],S).
personaje(["personaje"|S],S).
personaje(["famositico"|S],S).

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
atributo(color,["macho"|S],S).
atributo(color,["celeste"|S],S).
atributo(color,["rojo"|S],S).
atributo(color,["negros"|S],S).
atributo(color,["azules"|S],S).
atributo(color,["cafes"|S],S).
atributo(color,["verdes"|S],S).
atributo(color,["celestes"|S],S).
atributo(color,["rojos"|S],S).

%edades y estaturas
atributo(["20"|S],S).
atributo(["21"|S],S).
atributo(["22"|S],S).
atributo(["23"|S],S).
atributo(["24"|S],S).
atributo(["25"|S],S).
atributo(["26"|S],S).
atributo(["27"|S],S).
atributo(["28"|S],S).
atributo(["29"|S],S).
atributo(["30"|S],S).
atributo(["31"|S],S).
atributo(["32"|S],S).
atributo(["33"|S],S).
atributo(["34"|S],S).
atributo(["35"|S],S).
atributo(["36"|S],S).
atributo(["37"|S],S).
atributo(["38"|S],S).
atributo(["39"|S],S).
atributo(["40"|S],S).
atributo(["41"|S],S).
atributo(["42"|S],S).
atributo(["43"|S],S).
atributo(["44"|S],S).
atributo(["45"|S],S).
atributo(["46"|S],S).
atributo(["47"|S],S).
atributo(["48"|S],S).
atributo(["49"|S],S).
atributo(["50"|S],S).
atributo(["51"|S],S).
atributo(["52"|S],S).
atributo(["53"|S],S).
atributo(["54"|S],S).
atributo(["55"|S],S).
atributo(["56"|S],S).
atributo(["57"|S],S).
atributo(["58"|S],S).
atributo(["59"|S],S).
atributo(["60"|S],S).
atributo(["61"|S],S).
atributo(["62"|S],S).
atributo(["63"|S],S).
atributo(["64"|S],S).
atributo(["65"|S],S).



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
atributo(["modelo"|S],S).

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
% profesion, color de ojos, sexo)
famositico("Hanna Gabriels","35","alajuela","negro","boxeadora","verdes","mujer").
famositico("Keylor Navas","33","sanjose","negro","futbolista","negros","hombre").
famositico("Alvaro Saborio","38","alajuela","negro","futbolista","negros","hombre").
famositico("Edgar Silva","55","guanacaste","negro","periodista","cafes","hombre").
famositico("Nane Miller", "26","sanjose","macho","influencer","verdes","mujer").
famositico("Mauricio Hoffman","37", "sanjose", "macho", "periodista","negros","hombre").
famositico("Mauricio 'El Chunche' Montero", "57","alajuela","negro", "futbolista", "negros","hombre").
famositico("Debi Nova", "40", "sanjose","cafe","cantante","azules","mujer").
famositico("Maribel Guardia", "61", "sanjose", "negro", "actriz", "negros","mujer").
famositico("Johanna Solano","30", "sanjose","cafe","modelo", "cafes", "mujer").
famositico("Bryan Ruiz", "35","sanjose","negro","futbolista","negros","hombre").

% por medio de la ListaAtributos que se obtiene conforme se van
% preguntando las preguntas compara los famositicos dentro de la base de
% datos con esos atributos y obtiene el famositico que los cumple y de
% no cumplirlo le avisa al usuario que esos atributos no pertenecen a
% nadie de la base de datos

get_famositico(Famositico,[Pelo|ListaAtributos]) :-
     get_famositico(Famositico,Pelo,ListaAtributos).

get_famositico(Famositico,[Pelo|ListaAtributos]) :-
     not(get_famositico(Famositico,Pelo,ListaAtributos)),
     write_ln("No he podido adivinar tu personaje. Es probable que no esta en mi base de datos, vuelve a intentarlo de nuevo con alguien mas!"), false.

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
% NO SE USO
oracion(S0, S) :-
    negacion_afirmacion(S0,S).

% una oracion con un si o no y luego diciendo que es
% por ejemplo: si, es boxeadora o no, es actriz
% NO SE USO
oracion(S0, S) :-
    negacion_afirmacion(S0,S1),
    sintagma_nominal(S1,S2),
    sintagma_verbal(S2,S).

%esta oracion permite que sea solo verbo atributo
%por ejemplo: tiene 35, es boxeadora, etc.
oracion(S0,S) :-
     sintagma_verbal(S0,S).

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

% nombre/atributo
% por ejemplo: pelo fafe, ojos celestes
sintagma_nominal(S0, S) :-
    nombre(S0,S1),
    atributo(color,S1,S).

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
% encuentre en el input del usuario se decide que buscar
% por ejemplo:
% en la oracion "ella nacio en alajuela" se busca una palabra clave, en
% este caso "nacio". Como la palabra clave es nacio busca si dentro del
% input del usuario hay algun dato (alguna provincia en este caso), que
 buscar_data("es", L, Sexo) :-
    atributo([Sexo,_],_),
    buscar_palabra(Sexo, L),
    !.

buscar_data("tiene", L, Edad) :-
    atributo([Edad,_],_),
    buscar_palabra(Edad, L),
    !.

buscar_data("nacio", L, Lugar) :-
    nombre([Lugar|_],_),
    buscar_palabra(Lugar, L),
    !.

buscar_data("tiene", L, Atributo) :-
    carac_fisicas_clave(Caracteristica),
    buscar_palabra(Caracteristica, L),
    atributo_fisico(Caracteristica, L, Atributo),
    !.

buscar_data("es", L, Profesion) :-
    atributo([Profesion|_],_),
    buscar_palabra(Profesion, L),
    !.

%atributo_fisico
atributo_fisico("ojos", L, Atributo) :-
    atributo(color,[Atributo|_],_),
    buscar_palabra(Atributo, L).

atributo_fisico("pelo", L, Atributo) :-
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

% funciona como la funcion miembro, busca un elemento dentro de una
% lista
buscar_palabra(Elemento, [Elemento|_]).

buscar_palabra(Elemento, [_|Lista]) :-
    buscar_palabra(Elemento, Lista).

% concatena listas
concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]) :-
    concatenar(L1,L2,L3).

% verifica que la oracion cumpla los estandares de BNF
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
    write_ln("Escribe 'exit' para cerrar AkiTicoLog."),
    write_ln(""),
    write_ln("Hola, soy AkiTicoLog y puedo adivinar un famositico en el que estes pensando."),write_ln(""),
    write_ln("Piensa en un famositico."),write_ln(""),
    read(Input),
    verifica_input(Input).



pregunta1(ListaAnterior) :-
    write_ln("Tu personaje es hombre o mujer?"),write_ln(""),
    read(Input),
    split_string(Input," ","",L),
    verificar_oracion(L),
    determinar_dato_a_buscar(L, Palabra, Atributo),
    concatenar([Atributo],ListaAnterior,ListaAtributos),
    pregunta2(ListaAtributos).



pregunta2(ListaAnterior) :-
    write_ln(""),
    write_ln("Mmm interesante..."),
    write_ln("Que edad tiene tu personaje?"),
    read(Input),
    split_string(Input," ","",L),
    verificar_oracion(L),
    determinar_dato_a_buscar(L, Palabra, Atributo),
    concatenar([Atributo],ListaAnterior,ListaAtributos),
    pregunta3(ListaAtributos).


pregunta3(ListaAnterior) :-
    write_ln("      "),
    write_ln("Aun no es suficiente para adivinar"),
    write_ln("Dime cual es la profesion de tu famositico."), write_ln(""),
    read(Input),
    split_string(Input," ","",L),
    verificar_oracion(L),
    determinar_dato_a_buscar(L, Palabra, Atributo),
    concatenar([Atributo],ListaAnterior,ListaAtributos),
    pregunta4(ListaAtributos).


pregunta4(ListaAnterior) :-
    write_ln(""),
    write_ln("En que provincia nacio la persona en la que estas pensando?"), write_ln(""),
    read(Input),
    split_string(Input," ","",L),
    verificar_oracion(L),
    determinar_dato_a_buscar(L, Palabra, Atributo),
    concatenar([Atributo],ListaAnterior,ListaAtributos),
    pregunta5(ListaAtributos).

pregunta5(ListaAnterior) :-
    write_ln(""),
    write_ln("Todavia necesito alguna caracteristica fisica"),
    write_ln("De que color son los ojos de tu personaje?"), write_ln(""),
    read(Input),
    split_string(Input," ","",L),
    verificar_oracion(L),
    determinar_dato_a_buscar(L, Palabra, Atributo),
    concatenar([Atributo],ListaAnterior,ListaAtributos),
    pregunta6(ListaAtributos).


pregunta6(ListaAnterior) :-
    write_ln(""),
    write_ln("Mejor dime el color del pelo tambien."), write_ln(""),
    read(Input),
    split_string(Input," ","",L),
    verificar_oracion(L),
    determinar_dato_a_buscar(L, Palabra, Atributo),
    concatenar([Atributo],ListaAnterior,ListaAtributos),
    get_famositico(Famositico, ListaAtributos), write_ln(""),
    write("Estas pensando en "),
    write(Famositico),
    write("?"), write_ln("").
