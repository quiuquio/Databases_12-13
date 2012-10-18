drop schema if exists mondiali2010 cascade;
create schema mondiali2010;
set search_path to mondiali2010;


create table stadio(
	nome varchar(40) primary key,
	citta varchar(40),
	capienza integer
);

create table squadra(
	nazione varchar(40) primary key,
	confederazione varchar(40),
	data_qualifica date,
	sponsor varchar(40)
);

create table partita(
	stadio varchar(40) references stadio(nome) on delete restrict on update cascade,
	data date,
	squadra1 varchar(40) not null references squadra(nazione) on delete restrict on update cascade,
	squadra2 varchar(40) not null references squadra(nazione) on delete restrict on update cascade,
	goal1 integer not null,
	goal2 integer not null,
	spettatori INTEGER,
	primary key(stadio, data)
);

\copy stadio from D://stadi.txt
\copy squadra from D://squadra.txt
\copy partita from D://partita.txt