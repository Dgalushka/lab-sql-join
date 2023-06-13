use sakila;

-- 1. List the number of films per category
SELECT COUNT(DISTINCT FC.FILM_ID) NUMBER_OF_FILMS, C.NAME CATEGORY_NAME FROM sakila.film F
JOIN sakila.film_category FC
ON F.FILM_ID = FC.FILM_ID
JOIN SAKILA.CATEGORY C
ON FC.CATEGORY_ID = C.CATEGORY_ID
GROUP BY C.NAME
ORDER BY COUNT(DISTINCT FC.FILM_ID) DESC;

-- 2. Display the first and the last names, as well as the address, of each staff member.
SELECT first_name, last_name, a.address FROM sakila.staff S
LEFT JOIN sakila.address A
USING(address_id);

-- 3. Display the total amount rung up by each staff member in August 2005.
SELECT FIRST_NAME, LAST_NAME, SUM(AMOUNT) AMOUNT FROM SAKILA.STAFF S
LEFT JOIN SAKILA.PAYMENT P
USING(STAFF_ID)
WHERE PAYMENT_DATE REGEXP '^2005-05'
GROUP BY STAFF_ID;

-- 4. List all films and the number of actors who are listed for each film.
SELECT TITLE AS FILM_TITLE, COUNT(DISTINCT ACTOR_ID) AS NUMBER_OF_ACTORS FROM FILM_ACTOR FA
JOIN SAKILA.FILM F
USING(FILM_ID)
GROUP BY FILM_ID
ORDER BY COUNT(DISTINCT ACTOR_ID) DESC;

-- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.

SELECT first_name, Last_Name, sum(amount) Amount_Paid FROM payment p
JOIN Customer C
USING(customer_ID)
GROUP BY Customer_ID 
ORDER BY Last_Name ASC;

