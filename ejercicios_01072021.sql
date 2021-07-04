--Lista de peliculas con sus datos, ademas de categoria e idioma
select 
	film.film_id,
	title,
	description,
	release_year,
	language.name as language,
	category.name as category,
	rating

from film
	left join language
		on film.language_id = language.language_id 
	left join film_category
		on film.film_id = film_category.film_id
	inner join category
		on film_category.category_id =category.category_id 
	
--Lista de actores con sus peliculas 
select 
	actor.actor_id,
	first_name,
	last_name,
	title,
	rating
from
	actor
left join film_actor
	on actor.actor_id = film_actor.actor_id 
inner join film
	on film_actor.film_id = film.film_id 
order by first_name, last_name ;

--Lista de inventarios por tienda (cuantas copias de cada pelicula)
select
	title,	
	store_id,
	count(title) as Cantidad 
from inventory
left join film
	on film.film_id = inventory.film_id 
group  by store_id, title
order by title ;

--Lista de pagos por cliente(montos y fecha )
select 
	first_name,
	last_name,
	amount,
	payment_date
from customer
inner join payment
	on payment.customer_id = customer.customer_id

; 

--Lista de pagos por cliente(montos totales por cliente)
select 
	first_name,
	last_name,
	sum(amount)
from customer
inner join payment
	on payment.customer_id = customer.customer_id
group by first_name , last_name
order by first_name, last_name
;





