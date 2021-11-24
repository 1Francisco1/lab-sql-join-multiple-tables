-- LAB SQL JOIN
-- 1.List number of films per category.
select name as category , count(title) from category a
join film_category b on a.category_id = b.category_id
join film c on b.film_id = c.film_id
group by name;

-- 2.Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address from staff a
join address b on a.address_id = b.address_id;

-- 3.Display the total amount rung up by each staff member in August of 2005.
select a.staff_id, sum(amount) from staff a
join payment b on a.staff_id = b.staff_id
group by a.staff_id;


-- 4.List each film and the number of actors who are listed for that film.
select title , count(first_name) as listed_actors from film a
join film_actor b on a.film_id = b.film_id
join actor c on b.actor_id = c.actor_id
group by title;

-- 5.Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select sum(amount), first_name, last_name from payment as a
join customer b on a.customer_id = b.customer_id
group by first_name, last_name;


-- Lab | SQL Joins on multiple tables

-- 1.Write a query to display for each store its store ID, city, and country.
select store_id, city, country from store as a
join address as b on a.address_id = b.address_id
join city c on b.city_id = c.city_id
join country d on c.country_id = d.country_id;

-- 2.Write a query to display how much business, in dollars, each store brought in.
select a.store_id, sum(amount) from store a
join staff b on a.manager_staff_id = b.staff_id
join payment c on b.staff_id = c.staff_id
group by a.store_id;

-- 3.What is the average running time of films by category?
select name, round(avg(length),2) from category a
join film_category b on a.category_id = b.category_id
join film c on b.film_id = c.film_id
group by name;

-- 4.Which film categories are longest?
select name, avg(length) from category a
join film_category b on a.category_id = b.category_id
join film c on b.film_id = c.film_id
group by name
order by avg(length) desc;

-- 5.Display the most frequently rented movies in descending order.
select title, count(rental_id) from film a
join inventory b on a.film_id = b.film_id
join rental c on b.inventory_id = c.inventory_id
group by title
order by count(rental_id) desc;

-- 6.List the top five genres in gross revenue in descending order.
select name, sum(amount) from category a
join film_category b on a.category_id = b.category_id
join inventory c on b.film_id = c.film_id
join staff d on c.store_id = d.store_id
join payment e on d.staff_id = e.staff_id
group by name
order by sum(amount) desc
limit 5;

-- 7.Is "Academy Dinosaur" available for rent from Store 1?
select title, store_id from film a
join inventory b on a.film_id = b.film_id
where title = 'Academy Dinosaur' and store_id = 1;