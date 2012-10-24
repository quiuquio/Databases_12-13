/*query esercitazione nulero 3*/

--1) qual'e' il contenuto della tabella persona?

select * from persona;

--2) Selezionare i cognomi delle persone nella BD senza eliminare i doppioni
select cognome from persona;

--3) Selezionare i cognomi delle persone ordinati in ordine alfabetico (ALL)
select cognome from persona
    order by  cognome ASC;
--4) Definire l'insieme dei cognomi delle persone mantenuti nel DB
select distinct cognome from persona;
--5) Selezionare le persone di nome John mantenute nel DB
-- ei file i nomi ed i cognomi sono invertiti...
select distinct nome, cognome from persona
    where cognome = 'John';
-- 6)selezionare i cognomi delle persone 
--uguale a prima.....

--7) Selezionare le persone mantenute nel DB che sono attori
select nome, cognome from persona,partecipazione
    where id_attore = id_persona;
--8)Definire la lista di tutte le interpretazioni, precisando il nome dell'attore, cognome, 
-- ruolo e titolo del film (in forma tabellare)
select distinct cognome, nome, ruolo, titolo from persona, partecipazione, film
    where id_attore = id_persona AND
        film.id_film = partecipazione.id_film;
--9) definire la lista di tutte le interpretazioni, precisando nome attore, cognome dell'attore
-- il ruolo e il titolo. Questa volta il risultato dovra' essere nella forma concatenata
select distinct nome || ' ' || cognome || ' ha interpretato il ruolo di ' || ruolo || ' nel film ' || titolo
    from persona, partecipazione, film
    where id_attore = id_persona AND
        film.id_film = partecipazione.id_film;

--10) quali sono i titoli dei film di genere drammatico
select titolo from film
    where genere = 'Drammatico';

--11) quali film (titolo) sono stati proiettati nel 2002?

select distinct titolo from film, proiezioni
    where film.id_film = proiezioni.id_film and giorno > '2001/12/31' AND giorno < '2003/1/1';
--12) elencare i titoli dei film diretti da 'Lars von Trier' (nomi e cognomi sono invertiti...)
select titolo from film, persona
    where id_regista = id_persona and nome = 'von Trier' and cognome = 'Lars'; 
--13)elencare i film (titolo) proiettati al cinema 'Le Fontanelle'
select distinct titolo from film, proiezioni, cinema
    where proiezioni.id_film = film.id_film and cinema.id_cinema = proiezioni.id_cinema and nome = 'S.Angelo';