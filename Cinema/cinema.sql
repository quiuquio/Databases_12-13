drop schema if exists prova cascade;

create schema prova;
set search_path to prova;

create table persona(
	id_persona integer primary key,
	nome varchar(40) not null,
	cognome varchar(40) not null
);
create table film(
	id_film integer primary key,
	id_regista integer REFERENCES persona(id_persona) on delete set null,
	titolo varchar(40),
	genere varchar(40),
	anno integer check( anno > 0 OR anno IS NULL )
);
create table partecipazione(
	id_attore integer references persona(id_persona) on delete cascade,
	id_film integer references film(id_film) on delete cascade,
	ruolo varchar(40),
	primary key( id_attore, id_film )
);
create table cinema(
	id_cinema integer primary key,
	nome varchar(40) not null,
	indirizzo varchar(40)
);
create table proiezioni(
	id_cinema integer references cinema(id_cinema) on delete cascade,
	id_film integer references film(id_film) on delete cascade,
	giorno date,
	primary key(id_cinema, id_film, giorno)
);

insert into cinema(id_cinema, nome, indirizzo) values(02, 'S.Angelo', 'Via Lucida 6 Perugia');
insert into cinema(id_cinema, nome, indirizzo) values(01, 'Zenith', 'Via Bonfigli 11 Perugia');
insert into cinema(id_cinema, nome, indirizzo) values(03, 'Multisala Clarici', 'Corso Cavour 84 Foligno');
insert into cinema(id_cinema, nome, indirizzo) values(04, 'Multiplex Giometti', 'Strada Centova Perugia');

/*
\i D://cinema.sql;
 */

/* copia le tavole dai file. I backslash vanno backslashed..*/
\copy persona from D://persona.txt
\copy film from D://film.txt
\copy partecipazione from D://partecipazione.txt
\copy proiezioni from D://proiezione.txt

/*Cncelliamo quel razzista di john travolta*/

delete from persona where nome='Travolta' and cognome='John';





 