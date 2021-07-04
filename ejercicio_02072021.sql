create database movies

create table if not exists languages(
	id serial primary key not null,
	name varchar(30)
);

create table if not exists ratings(
	id serial primary key not null,
	code int2
);

create table if not exists reviews(
	id serial primary key not null,
	description varchar(30)
);

create table if not exists films(
	id serial primary key not null,
	title varchar(50) not null,
	description varchar(250) not null,
	release_year date,
	language_id int4,
	lenght int2,
	rating_id int4,
	review_id int4,
	
	constraint fk_films
		foreign key(language_id) references languages(id),
		foreign key(rating_id) references ratings(id),
		foreign key(review_id) references reviews(id)
);