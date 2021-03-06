# ALL USERS
DELIMITER &&
CREATE PROCEDURE GET_USER()
BEGIN
SELECT * FROM user;
END &&
DELIMITER ;
CALL GET_USER();



# MUMBAI USERS
DELIMITER &&
CREATE PROCEDURE MUMBAI_USER()
BEGIN
SELECT user_id, first_name, last_name, city FROM user
WHERE City='Mumbai';
END &&
DELIMITER ;
CALL MUMBAI_USER();



# STAFF WITH GOOD REVIEWS
DELIMITER &&
CREATE PROCEDURE GOOD_STAFF()
BEGIN
SELECT s.first_name, s.last_name, s.staff_id, f.service FROM staff s
LEFT JOIN feedback f
ON f.Staff_id = s.staff_id
WHERE Service='Good';
END &&
DELIMITER ;
CALL GOOD_STAFF();



# GOOD FOOD
DELIMITER &&
CREATE PROCEDURE GOOD_FOOD()
BEGIN
SELECT f.menu_id, f.menu_name,
d.menu_id,d.menu_name,
a.service
FROM food_menu f
INNER JOIN feedback a ON f.menu_id = a.menu_id
INNER JOIN feedback a ON d.menu_id = a.menu_id;
END &&
DELIMITER ;
CALL GOOD_FOOD();




# GIVES LIST OF NON VEG FOOD ITEMS WITH TOTAL COUNT
DELIMITER &&
CREATE PROCEDURE NONVEG_FOOD()
BEGIN
SELECT menu_id, menu_name FROM food_menu
WHERE type = 'Non-Veg'
GROUP BY menu_name
UNION ALL
SELECT 'Total',count(menu_id) FROM food_menu
WHERE type = 'Non-Veg';
END &&
DELIMITER ;
CALL NONVEG_FOOD();




# GIVES LIST OF VEG FOOD ITEMS WITH TOTAL COUNT
DELIMITER &&
CREATE PROCEDURE VEG_FOOD()
BEGIN
SELECT menu_id, menu_name FROM food_menu
WHERE type = 'Veg'
GROUP BY menu_name
UNION ALL
SELECT 'Total',count(menu_id) FROM food_menu
WHERE type = 'Veg' ;
END &&
DELIMITER ;
CALL VEG_FOOD();




# GIVES LIST OF ALL RESTAURANTS AND MENU THEY SERVE
DELIMITER &&
CREATE PROCEDURE GET_MENU_RESTAURANT()
BEGIN
SELECT f.Restaurant_id, f.Menu_name AS Food_items, f.Type, f.Price,
d.Menu_name AS Beverages, d.Type, d.Price
FROM food_menu f
JOIN drinks_menu d ON f.Restaurant_id = d.Restaurant_id;
END &&
DELIMITER ;
CALL GET_MENU_RESTAURANT();