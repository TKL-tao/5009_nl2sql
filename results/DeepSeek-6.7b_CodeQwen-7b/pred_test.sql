SELECT count(*) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Manager ,  Captain FROM club
SELECT Manager ,  Captain FROM club
SELECT Name FROM club WHERE Manufacturer != "Nike"
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT DISTINCT Country FROM player WHERE Earnings  >  1200000
SELECT Country FROM player WHERE Earnings  >  1200000
SELECT Country FROM player WHERE Wins_count  >  2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count  >  2 ORDER BY Earnings DESC LIMIT 1
SELECT T2.Name ,  T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID
SELECT T2.Name ,  T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T2.Wins_count  >  2
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T2.Club_ID HAVING T2.Wins_count  >  2
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Manager  =  "Sam Allardyce"
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Manager  =  "Sam Allardyce"
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T1.Club_ID ORDER BY avg(T2.Earnings) DESC
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID GROUP BY T1.Name ORDER BY avg(T2.Earnings) DESC
SELECT Manufacturer ,  COUNT(*) FROM club GROUP BY Manufacturer
SELECT count(*) ,  Manufacturer FROM club GROUP BY Manufacturer
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING count(*)  >  1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING count(*)  >  1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*)  >  1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*)  >  1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Country FROM player WHERE Earnings  >  1400000 INTERSECT SELECT Country FROM player WHERE Earnings  <  1100000
SELECT Country FROM player WHERE Earnings  >  1400000 INTERSECT SELECT Country FROM player WHERE Earnings  <  1100000
SELECT count(DISTINCT Country) FROM player
SELECT count(DISTINCT Country) FROM player
SELECT Earnings FROM player WHERE Country  =  "Australia" OR Country  =  "Zimbabwe"
SELECT Earnings FROM player WHERE Country  =  "Australia" OR Country  =  "Zimbabwe"
SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >  2 INTERSECT SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >  3
SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >  2 INTERSECT SELECT T1.customer_id ,  T1.customer_first_name ,  T1.customer_last_name FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >=  3
SELECT T1.order_id ,  T1.order_status_code ,  count(*) FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id
SELECT count(*) ,  T1.order_status_code ,  T1.order_id FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id
SELECT date_order_placed FROM orders WHERE date_order_placed  =  (SELECT min(date_order_placed) FROM orders) UNION SELECT date_order_placed FROM orders GROUP BY date_order_placed HAVING count(*)  >  1
SELECT date_order_placed FROM orders ORDER BY date_order_placed LIMIT 1 UNION SELECT date_order_placed FROM orders WHERE order_id IN (SELECT order_id FROM order_items GROUP BY order_id HAVING count(*)  >  1)
SELECT customer_first_name ,  customer_middle_initial ,  customer_last_name FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM orders)
SELECT customer_first_name ,  customer_last_name ,  customer_middle_initial FROM customers EXCEPT SELECT t1.customer_first_name ,  t1.customer_last_name ,  t1.customer_middle_initial FROM customers AS t1 JOIN orders AS t2 ON t1.customer_id  =  t2.customer_id
SELECT product_id ,  product_name ,  product_price ,  product_color FROM products WHERE product_id NOT IN (SELECT product_id FROM order_items GROUP BY product_id HAVING count(*)  >=  2)
SELECT T1.product_id ,  T1.product_name ,  T1.product_price ,  T1.product_color FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  <  2
SELECT T1.order_id ,  T1.date_order_placed FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >=  2
SELECT T1.order_id ,  T1.date_order_placed FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >=  2
SELECT T1.product_id ,  T1.product_name ,  T1.product_price FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.product_id ,  T1.product_name ,  T1.product_price FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.order_id ,  sum(T2.product_price) FROM order_items AS T1 JOIN products AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.order_id ORDER BY sum(T2.product_price) LIMIT 1
SELECT T1.order_id ,  sum(T3.product_price) FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id JOIN products AS T3 ON T2.product_id  =  T3.product_id GROUP BY T1.order_id ORDER BY sum(T3.product_price) LIMIT 1
SELECT payment_method_code FROM customer_payment_methods GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM customer_payment_methods GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.gender_code ,  count(*) FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.gender_code
SELECT T1.gender_code ,  count(*) FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.gender_code
SELECT count(*) ,  T1.gender_code FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.gender_code
SELECT count(*) ,  T1.gender_code FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.gender_code
SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name ,  T2.payment_method_code FROM customers AS T1 JOIN customer_payment_methods AS T2 ON T1.customer_id  =  T2.customer_id
SELECT T1.customer_first_name ,  T1.customer_middle_initial ,  T1.customer_last_name ,  T2.payment_method_code FROM customers AS T1 JOIN customer_payment_methods AS T2 ON T1.customer_id  =  T2.customer_id
SELECT T2.invoice_status_code ,  T2.invoice_date ,  T1.shipment_date FROM shipments AS T1 JOIN invoices AS T2 ON T1.invoice_number  =  T2.invoice_number
SELECT T2.invoice_status_code ,  T1.shipment_date ,  T2.invoice_date FROM shipments AS T1 JOIN invoices AS T2 ON T1.invoice_number  =  T2.invoice_number
SELECT T5.product_name ,  T1.shipment_date FROM shipments AS T1 JOIN shipment_items AS T2 ON T1.shipment_id  =  T2.shipment_id JOIN order_items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN products AS T5 ON T3.product_id  =  T5.product_id
SELECT T5.product_name ,  T1.shipment_date FROM shipments AS T1 JOIN shipment_items AS T2 ON T1.shipment_id  =  T2.shipment_id JOIN order_items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN products AS T5 ON T3.product_id  =  T5.product_id
SELECT T3.shipment_tracking_number ,  T3.shipment_date ,  T3.invoice_number ,  T3.order_id ,  T3.shipment_id ,  T4.order_item_status_code FROM shipment_items AS T1 JOIN shipments AS T3 ON T1.shipment_id  =  T3.shipment_id JOIN order_items AS T4 ON T1.order_item_id  =  T4.order_item_id
SELECT T3.shipment_tracking_number ,  T3.shipment_date ,  T4.order_item_status_code FROM shipment_items AS T1 JOIN shipments AS T2 ON T1.shipment_id  =  T2.shipment_id JOIN order_items AS T4 ON T1.order_item_id  =  T4.order_item_id WHERE T2.shipment_date  >  "2018-03-01"
SELECT T1.product_name ,  T1.product_color FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id JOIN shipment_items AS T3 ON T2.order_item_id  =  T3.order_item_id
SELECT T3.product_name ,  T3.product_color FROM `shipment_items` AS T1 JOIN `order_items` AS T2 ON T1.order_item_id  =  T2.order_item_id JOIN `products` AS T3 ON T2.product_id  =  T3.product_id
SELECT DISTINCT T1.product_name ,  T1.product_price ,  T1.product_description FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id JOIN orders AS T3 ON T2.order_id  =  T3.order_id JOIN customers AS T4 ON T3.customer_id  =  T4.customer_id WHERE T4.gender_code  =  "Female"
SELECT DISTINCT T4.product_name ,  T4.product_price ,  T4.product_description FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id JOIN products AS T4 ON T3.product_id  =  T4.product_id WHERE T1.gender_code  =  "Female"
SELECT invoice_status_code FROM invoices WHERE invoice_number NOT IN (SELECT invoice_number FROM shipments)
SELECT invoice_status_code FROM invoices WHERE invoice_number NOT IN (SELECT invoice_number FROM shipments)
SELECT T1.order_id ,  T1.date_order_placed ,  sum(T2.product_price) FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id JOIN products AS T3 ON T2.product_id  =  T3.product_id GROUP BY T1.order_id
SELECT T1.order_id ,  T1.date_order_placed ,  T4.total_amount FROM orders AS T1 JOIN shipments AS T2 ON T1.order_id  =  T2.order_id JOIN invoices AS T3 ON T2.invoice_number  =  T3.invoice_number JOIN customer_payment_methods AS T4 ON T1.customer_id  =  T4.customer_id
SELECT count(DISTINCT customer_id) FROM orders
SELECT count(DISTINCT customer_id) FROM orders
SELECT count(DISTINCT order_item_status_code) FROM order_items
SELECT count(DISTINCT order_item_status_code) FROM order_items
SELECT count(DISTINCT payment_method_code) FROM customer_payment_methods
SELECT count(DISTINCT payment_method_code) FROM customer_payment_methods
SELECT login_name ,  login_password FROM customers WHERE phone_number LIKE '+12%'
SELECT login_name ,  login_password FROM customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM products WHERE product_name LIKE '%Dell%'
SELECT product_price ,  product_size FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)
SELECT product_price ,  product_size FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)
SELECT count(*) FROM products WHERE product_id NOT IN (SELECT product_id FROM order_items)
SELECT count(*) FROM products WHERE product_id NOT IN (SELECT product_id FROM order_items)
SELECT count(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_payment_methods)
SELECT count(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_payment_methods)
SELECT order_status_code ,  date_order_placed FROM orders
SELECT order_status_code ,  date_order_placed FROM orders
SELECT address_line_1 ,  town_city ,  county FROM customers WHERE country  =  "USA"
SELECT address_line_1 ,  town_city ,  county FROM customers WHERE country  =  "USA"
SELECT T1.customer_first_name ,  T4.product_name FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id JOIN products AS T4 ON T3.product_id  =  T4.product_id
SELECT T1.customer_first_name ,  T4.product_name FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN order_items AS T3 ON T2.order_id  =  T3.order_id JOIN products AS T4 ON T3.product_id  =  T4.product_id
SELECT count(*) FROM shipment_items
SELECT count(DISTINCT order_item_id) FROM shipment_items
SELECT avg(product_price) FROM products
SELECT avg(product_price) FROM products
SELECT avg(T1.product_price) FROM products AS T1 JOIN order_items AS T2 ON T1.product_id = T2.product_id
SELECT avg(T2.product_price) FROM order_items AS T1 JOIN products AS T2 ON T1.product_id  =  T2.product_id
SELECT email_address ,  town_city ,  county FROM customers GROUP BY gender_code ORDER BY count(*) LIMIT 1
SELECT T1.email_address ,  T1.town_city ,  T1.county FROM customers AS T1 JOIN orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.gender_code ORDER BY count(*) LIMIT 1
SELECT T3.date_order_placed FROM customers AS T1 JOIN customer_payment_methods AS T2 ON T1.customer_id  =  T2.customer_id JOIN orders AS T3 ON T1.customer_id  =  T3.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2
SELECT T3.date_order_placed FROM customers AS T1 JOIN customer_payment_methods AS T2 ON T1.customer_id  =  T2.customer_id JOIN orders AS T3 ON T1.customer_id  =  T3.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2
SELECT order_status_code FROM orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT order_status_code FROM orders GROUP BY order_status_code ORDER BY count(*) ASC LIMIT 1
SELECT product_id ,  product_description FROM products GROUP BY product_id HAVING count(*)  >  3
SELECT product_id ,  product_description FROM products GROUP BY product_id HAVING count(*)  >  3
SELECT T2.invoice_date ,  T1.invoice_number FROM shipments AS T1 JOIN invoices AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  >=  2
SELECT T2.invoice_date ,  T1.invoice_number FROM shipments AS T1 JOIN invoices AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  >=  2
SELECT shipment_tracking_number ,  shipment_date FROM shipments
SELECT shipment_tracking_number ,  shipment_date FROM shipments
SELECT product_color ,  product_description ,  product_size FROM products WHERE product_price  <  (SELECT max(product_price) FROM products)
SELECT product_color ,  product_description ,  product_size FROM products WHERE product_price != (SELECT max(product_price) FROM products)
SELECT Name FROM director WHERE Age  >  (SELECT avg(Age) FROM director)
SELECT Name FROM director ORDER BY Age DESC LIMIT 1
SELECT count(*) FROM channel WHERE internet LIKE '%bbc%'
SELECT count(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT title FROM program ORDER BY start_year DESC
SELECT T1.Name FROM director AS T1 JOIN program AS T2 ON T1.Director_ID  =  T2.Director_ID GROUP BY T1.Director_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name ,  T1.Age FROM director AS T1 JOIN program AS T2 ON T1.Director_ID  =  T2.Director_ID GROUP BY T1.Director_ID ORDER BY count(*) DESC LIMIT 1
SELECT title FROM program ORDER BY start_year DESC LIMIT 1
SELECT T1.name ,  T1.internet FROM channel AS T1 JOIN program AS T2 ON T1.channel_id  =  T2.channel_id GROUP BY T1.channel_id HAVING count(*)  >  1
SELECT T1.name ,  count(*) FROM channel AS T1 JOIN program AS T2 ON T1.channel_id  =  T2.channel_id GROUP BY T1.channel_id
SELECT count(*) FROM channel WHERE channel_id NOT IN (SELECT channel_id FROM program)
SELECT T1.Name FROM director AS T1 JOIN program AS T2 ON T1.Director_ID  =  T2.Director_ID WHERE T2.Title  =  "Dracula"
SELECT T1.name ,  T1.internet FROM channel AS T1 JOIN director_admin AS T2 ON T1.channel_id  =  T2.channel_id GROUP BY T2.channel_id ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT T4.Name FROM `director` AS T1 JOIN `director_admin` AS T2 ON T1.Director_ID  =  T2.Director_ID JOIN `channel` AS T4 ON T2.Channel_ID  =  T4.Channel_ID WHERE T1.Age  <  40 INTERSECT SELECT T4.Name FROM `director` AS T1 JOIN `director_admin` AS T2 ON T1.Director_ID  =  T2.Director_ID JOIN `channel` AS T4 ON T2.Channel_ID  =  T4.Channel_ID WHERE T1.Age  >  60
SELECT channel_id ,  name FROM channel WHERE channel_id NOT IN (SELECT channel_id FROM director_admin AS T1 JOIN director AS T2 ON T1.director_id  =  T2.director_id WHERE T2.name  =  "Hank Baskett")
SELECT count(*) FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT tv_show_name ,  original_airdate FROM tv_show
SELECT station_name FROM city_channel WHERE affiliation != "ABC"
SELECT Transmitter FROM radio WHERE ERP_kW  >  150 OR ERP_kW  <  30
SELECT Transmitter FROM radio ORDER BY ERP_kW DESC LIMIT 1
SELECT avg(ERP_kW) FROM radio
SELECT affiliation ,  count(*) FROM city_channel GROUP BY affiliation
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT affiliation FROM city_channel GROUP BY affiliation HAVING count(*)  >  3
SELECT city ,  station_name FROM city_channel ORDER BY station_name ASC
SELECT T3.Transmitter ,  T2.City FROM city_channel_radio AS T1 JOIN city_channel AS T2 ON T1.City_channel_ID  =  T2.ID JOIN radio AS T3 ON T1.Radio_ID  =  T3.Radio_ID
SELECT T2.Transmitter ,  T3.Station_name FROM city_channel_radio AS T1 JOIN radio AS T2 ON T1.Radio_ID  =  T2.Radio_ID JOIN city_channel AS T3 ON T1.City_channel_ID  =  T3.ID ORDER BY T2.ERP_kW DESC
SELECT T2.Transmitter ,  count(*) FROM city_channel_radio AS T1 JOIN radio AS T2 ON T1.radio_id  =  T2.radio_id GROUP BY T2.Transmitter
SELECT DISTINCT Transmitter FROM radio WHERE Radio_ID NOT IN (SELECT Radio_ID FROM city_channel_radio)
SELECT Model FROM vehicle WHERE Power  >  6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power  >  6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Name FROM driver WHERE Citizenship  =  'United States'
SELECT Name FROM driver WHERE Citizenship  =  "United States"
SELECT driver_id ,  count(*) FROM vehicle_driver GROUP BY driver_id ORDER BY count(*) DESC LIMIT 1
SELECT driver_id ,  count(*) FROM vehicle_driver GROUP BY driver_id ORDER BY count(*) DESC LIMIT 1
SELECT max(POWER) ,  avg(POWER) FROM vehicle WHERE Builder  =  'Zhuzhou'
SELECT max(POWER) ,  avg(POWER) FROM vehicle WHERE Builder  =  "Zhuzhou"
SELECT vehicle_id FROM vehicle_driver GROUP BY vehicle_id ORDER BY count(*) LIMIT 1
SELECT vehicle_id FROM vehicle_driver GROUP BY vehicle_id ORDER BY count(*) LIMIT 1
SELECT Top_Speed ,  Power FROM vehicle WHERE Build_Year  =  1996
SELECT Top_Speed ,  Power FROM vehicle WHERE Build_Year  =  1996
SELECT Build_Year ,  Model ,  Builder FROM vehicle
SELECT Build_Year ,  Model ,  Builder FROM vehicle
SELECT count(*) FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id WHERE T1.build_year  =  2012
SELECT count(DISTINCT T1.driver_id) FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id WHERE T1.build_year  =  2012
SELECT count(*) FROM driver WHERE racing_series  =  'NASCAR'
SELECT count(*) FROM driver WHERE racing_series  =  "NASCAR"
SELECT avg(Top_Speed) FROM vehicle
SELECT avg(Top_Speed) FROM vehicle
SELECT DISTINCT T2.Name FROM vehicle_driver AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN vehicle AS T3 ON T1.Vehicle_ID  =  T3.Vehicle_ID WHERE T3.Power  >  5000
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID  =  T3.Vehicle_ID WHERE T3.Power  >  5000
SELECT Model FROM vehicle WHERE Total_Production  >  100 OR Top_Speed  >  150
SELECT Model FROM vehicle WHERE Total_Production  >  100 OR Top_Speed  >  150
SELECT Model ,  Build_Year FROM vehicle WHERE Model LIKE "%DJ%"
SELECT Model ,  Build_Year FROM vehicle WHERE Model LIKE "%DJ%"
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Model FROM vehicle EXCEPT SELECT T1.Model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID  =  T2.Vehicle_ID
SELECT T1.vehicle_id ,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id GROUP BY T1.vehicle_id HAVING count(*)  =  2 UNION SELECT vehicle_id ,  model FROM vehicle WHERE builder  =  'Ziyang'
SELECT T1.driver_id ,  T2.model FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.vehicle_id  =  T2.vehicle_id GROUP BY T1.driver_id HAVING count(*)  =  2 UNION SELECT T1.driver_id ,  T2.model FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.vehicle_id  =  T2.vehicle_id WHERE T2.builder  =  "Ziyang"
SELECT T1.vehicle_id ,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id JOIN driver AS T3 ON T2.driver_id  =  T3.driver_id GROUP BY T1.vehicle_id HAVING count(*)  >  2 UNION SELECT T1.vehicle_id ,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id JOIN driver AS T3 ON T2.driver_id  =  T3.driver_id WHERE T3.name  =  'Jeff Gordon'
SELECT T3.vehicle_id ,  T3.model FROM vehicle_driver AS T1 JOIN driver AS T2 ON T1.driver_id  =  T2.driver_id JOIN vehicle AS T3 ON T1.vehicle_id  =  T3.vehicle_id WHERE T2.name  =  "Jeff Gordon" UNION SELECT T3.vehicle_id ,  T3.model FROM vehicle_driver AS T1 JOIN driver AS T2 ON T1.driver_id  =  T2.driver_id JOIN vehicle AS T3 ON T1.vehicle_id  =  T3.vehicle_id GROUP BY T3.vehicle_id HAVING COUNT(*)  >  2
SELECT count(*) FROM vehicle WHERE top_speed  =  (SELECT max(top_speed) FROM vehicle)
SELECT count(*) FROM vehicle WHERE top_speed  =  (SELECT max(top_speed) FROM vehicle)
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT Racing_Series ,  COUNT(*) FROM driver GROUP BY Racing_Series
SELECT Racing_Series ,  COUNT(*) FROM driver GROUP BY Racing_Series
SELECT T1.Name ,  T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID  =  T3.Vehicle_ID WHERE T3.Model  =  'DJ1'
SELECT T1.Name ,  T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID  =  T3.Vehicle_ID WHERE T3.Model  =  'DJ1'
SELECT count(*) FROM `driver` WHERE driver_id NOT IN (SELECT driver_id FROM `vehicle_driver`)
SELECT count(*) FROM `driver` WHERE driver_id NOT IN (SELECT driver_id FROM `vehicle_driver`)
SELECT count(*) FROM exams
SELECT count(*) FROM exams
SELECT DISTINCT subject_code FROM exams ORDER BY subject_code ASC
SELECT DISTINCT subject_code FROM exams ORDER BY subject_code ASC
SELECT exam_name ,  exam_date FROM exams WHERE subject_code != "Database"
SELECT exam_date ,  exam_name FROM exams WHERE subject_code != "Database"
SELECT exam_date FROM exams WHERE subject_code LIKE "%data%" ORDER BY exam_date DESC
SELECT exam_date FROM exams WHERE subject_code LIKE "%data%" ORDER BY exam_date DESC
SELECT TYPE_OF_QUESTION_CODE ,  count(*) FROM Questions GROUP BY TYPE_OF_QUESTION_CODE
SELECT TYPE_OF_QUESTION_CODE ,  count(*) FROM Questions GROUP BY TYPE_OF_QUESTION_CODE
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal"
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal"
SELECT count(DISTINCT Comments) FROM Student_Answers
SELECT count(DISTINCT Comments) FROM Student_Answers
SELECT Student_Answer_Text FROM Student_Answers ORDER BY Student_Answer_Text DESC
SELECT Student_Answer_Text FROM Student_Answers ORDER BY Student_Answer_Text DESC
SELECT T2.First_Name ,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID
SELECT T2.First_Name ,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID
SELECT T2.Email_Adress ,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID ORDER BY T1.Date_of_Answer DESC
SELECT T2.Email_Adress ,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID ORDER BY T1.Date_of_Answer DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY count(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY count(*) LIMIT 1
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID  =  T2.Student_ID GROUP BY T1.Student_ID HAVING count(*)  >=  2
SELECT T2.First_Name FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID GROUP BY T1.Student_ID HAVING count(*)  >=  2
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY count(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY count(*) DESC LIMIT 1
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Last_Name FROM Students WHERE Gender_MFU != "M"
SELECT Gender_MFU ,  count(*) FROM Students GROUP BY Gender_MFU
SELECT Gender_MFU ,  count(*) FROM Students GROUP BY Gender_MFU
SELECT Last_Name FROM Students WHERE Gender_MFU  =  "F" OR Gender_MFU  =  "M"
SELECT Last_Name FROM Students WHERE Gender_MFU  =  "F" OR Gender_MFU  =  "M"
SELECT First_Name FROM Students EXCEPT SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID  =  T2.Student_ID
SELECT First_Name FROM Students EXCEPT SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID  =  T2.Student_ID
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal" INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Absent"
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal" INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Absent"
SELECT TYPE_OF_QUESTION_CODE FROM Questions GROUP BY TYPE_OF_QUESTION_CODE HAVING count(*)  >=  3
SELECT TYPE_OF_QUESTION_CODE FROM Questions GROUP BY TYPE_OF_QUESTION_CODE HAVING COUNT(*)  >=  3
SELECT * FROM Students
SELECT * FROM Students
SELECT count(*) FROM addresses
SELECT count(*) FROM addresses
SELECT address_id ,  address_details FROM addresses
SELECT address_id ,  address_details FROM addresses
SELECT count(*) FROM products
SELECT count(*) FROM products
SELECT product_id ,  product_type_code ,  product_name FROM products
SELECT product_id ,  product_type_code ,  product_name FROM products
SELECT product_price FROM products WHERE product_name  =  "Monitor"
SELECT product_price FROM products WHERE product_name  =  "Monitor"
SELECT min(product_price) ,  avg(product_price) ,  max(product_price) FROM products
SELECT min(product_price) ,  avg(product_price) ,  max(product_price) FROM products
SELECT avg(product_price) FROM products WHERE product_type_code  =  "Clothes"
SELECT avg(product_price) FROM products WHERE product_type_code  =  "Clothes"
SELECT count(*) FROM products WHERE product_type_code  =  "Hardware"
SELECT count(*) FROM products WHERE product_type_code  =  "Hardware"
SELECT product_name FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)
SELECT product_name FROM products WHERE product_price  >  (SELECT avg(product_price) FROM products)
SELECT product_name FROM products WHERE product_type_code  =  "Hardware" AND product_price  >  (SELECT avg(product_price) FROM products WHERE product_type_code  =  "Hardware")
SELECT product_name FROM products WHERE product_type_code  =  "Hardware" AND product_price  >  (SELECT avg(product_price) FROM products WHERE product_type_code  =  "Hardware")
SELECT product_name FROM products WHERE product_type_code  =  "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM products WHERE product_type_code  =  "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_id ,  product_name FROM products WHERE product_type_code  =  "Hardware" ORDER BY product_price LIMIT 1
SELECT product_id ,  product_name FROM products WHERE product_type_code  =  "Hardware" ORDER BY product_price LIMIT 1
SELECT product_name FROM products ORDER BY product_price DESC
SELECT product_name FROM products ORDER BY product_price DESC
SELECT product_name FROM products WHERE product_type_code  =  "Hardware" ORDER BY product_price ASC
SELECT product_name FROM products WHERE product_type_code  =  "Hardware" ORDER BY product_price ASC
SELECT product_type_code ,  count(*) FROM products GROUP BY product_type_code
SELECT product_type_code ,  count(*) FROM products GROUP BY product_type_code
SELECT product_type_code ,  avg(product_price) FROM products GROUP BY product_type_code
SELECT product_type_code ,  avg(product_price) FROM products GROUP BY product_type_code
SELECT product_type_code FROM products GROUP BY product_type_code HAVING count(*)  >=  2
SELECT product_type_code FROM products GROUP BY product_type_code HAVING count(*)  >=  2
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY count(*) DESC LIMIT 1
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM customers
SELECT count(*) FROM customers
SELECT customer_id ,  customer_name FROM customers
SELECT customer_id ,  customer_name FROM customers
SELECT customer_address ,  customer_phone ,  customer_email FROM customers WHERE customer_name  =  "Jeromy"
SELECT customer_address ,  customer_phone ,  customer_email FROM customers WHERE customer_name  =  "Jeromy"
SELECT payment_method_code ,  count(*) FROM customers GROUP BY payment_method_code
SELECT payment_method_code ,  count(*) FROM customers GROUP BY payment_method_code
SELECT payment_method_code FROM customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM customers GROUP BY payment_method_code ORDER BY count(*) ASC LIMIT 1
SELECT customer_name FROM customers GROUP BY payment_method_code ORDER BY count(*) LIMIT 1
SELECT payment_method_code ,  customer_number FROM customers WHERE customer_name  =  "Jeromy"
SELECT payment_method_code ,  customer_number FROM customers WHERE customer_name  =  "Jeromy"
SELECT DISTINCT payment_method_code FROM customers
SELECT DISTINCT payment_method_code FROM customers
SELECT product_id ,  product_type_code FROM products ORDER BY product_name
SELECT product_id ,  product_type_code FROM products ORDER BY product_name
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY count(*) LIMIT 1
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY count(*) ASC LIMIT 1
SELECT count(*) FROM customer_orders
SELECT count(*) FROM customer_orders
SELECT T2.order_id ,  T2.order_date ,  T2.order_status_code FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.customer_name  =  "Jeromy"
SELECT T1.order_id ,  T2.order_date ,  T2.order_status_code FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id WHERE T1.customer_name  =  "Jeromy"
SELECT T1.customer_name ,  T1.customer_id ,  count(*) FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id
SELECT T1.customer_name ,  T1.customer_id ,  count(*) FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id
SELECT T1.customer_id ,  T1.customer_name ,  T1.customer_phone ,  T1.customer_email FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.customer_id ,  T1.customer_name ,  T1.customer_phone ,  T1.customer_email FROM customers AS T1 JOIN customer_orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT order_status_code ,  count(*) FROM customer_orders GROUP BY order_status_code
SELECT order_status_code ,  count(*) FROM customer_orders GROUP BY order_status_code
SELECT order_status_code FROM customer_orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT order_status_code FROM customer_orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_orders)
SELECT count(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_orders)
SELECT product_name FROM products WHERE product_id NOT IN (SELECT product_id FROM order_items)
SELECT product_name FROM products WHERE product_id NOT IN (SELECT product_id FROM order_items)
SELECT count(*) FROM products AS T1 JOIN order_items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_name = "Monitor"
SELECT sum(t2.order_quantity) FROM order_items AS t2 JOIN products AS t1 ON t2.product_id  =  t1.product_id WHERE t1.product_name  =  "Monitor"
SELECT count(DISTINCT t3.customer_id) FROM products AS t1 JOIN order_items AS t2 ON t1.product_id  =  t2.product_id JOIN customer_orders AS t3 ON t2.order_id  =  t3.order_id WHERE t1.product_name  =  "Monitor"
SELECT count(DISTINCT t4.customer_id) FROM order_items AS t1 JOIN products AS t2 ON t1.product_id  =  t2.product_id JOIN customer_orders AS t4 ON t4.order_id  =  t1.order_id JOIN customers AS t3 ON t3.customer_id  =  t4.customer_id WHERE t2.product_name  =  "Monitor"
SELECT count(DISTINCT customer_id) FROM customer_orders
SELECT count(DISTINCT customer_id) FROM customer_orders
SELECT customer_id FROM customers EXCEPT SELECT customer_id FROM customer_orders
SELECT customer_id FROM customers EXCEPT SELECT customer_id FROM customer_orders
SELECT T1.order_date ,  T1.order_id FROM customer_orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id WHERE T2.order_quantity  >  6 OR T2.order_id IN (SELECT order_id FROM order_items GROUP BY order_id HAVING count(*)  >  3)
SELECT T1.order_id ,  T1.order_date FROM customer_orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id WHERE T2.order_quantity  >  6 OR T2.order_id IN (SELECT order_id FROM order_items GROUP BY order_id HAVING count(*)  >  3)
SELECT count(*) FROM building
SELECT count(*) FROM building
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT address FROM building ORDER BY completed_year DESC
SELECT max(Number_of_Stories) FROM building WHERE Completed_Year != 1980
SELECT max(Number_of_Stories) FROM building WHERE Completed_Year != 1980
SELECT avg(Population) FROM region
SELECT avg(Population) FROM region
SELECT Name FROM region ORDER BY Name ASC
SELECT Name FROM region ORDER BY Name ASC
SELECT Capital FROM region WHERE Area  >  10000
SELECT Capital FROM region WHERE Area  >  10000
SELECT Capital FROM region ORDER BY Population DESC LIMIT 1
SELECT Capital FROM region WHERE Population  =  ( SELECT MAX ( Population ) FROM region )
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT T1.Name ,  T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT T1.Name ,  T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT T1.Name FROM region AS T1 JOIN building AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Name HAVING COUNT(*)  >  1
SELECT T1.Name FROM `region` AS T1 JOIN `building` AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Name HAVING COUNT(*)  >  1
SELECT t1.capital FROM `region` AS t1 JOIN `building` AS t2 ON t1.region_id  =  t2.region_id GROUP BY t1.region_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.Capital FROM `region` AS T1 JOIN `building` AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Address ,  T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT T1.Address ,  T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT sum(T1.Number_of_Stories) FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID WHERE T2.Name  =  "Abruzzo"
SELECT T1.Number_of_Stories FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID WHERE T2.Name  =  "Abruzzo"
SELECT Completed_Year ,  COUNT(*) FROM building GROUP BY Completed_Year
SELECT Completed_Year ,  COUNT(*) FROM building GROUP BY Completed_Year
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY count(*) DESC LIMIT 1
SELECT completed_year FROM building GROUP BY completed_year ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Completed_Year FROM building WHERE Number_of_Stories  >  20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories  <  15
SELECT Completed_Year FROM building WHERE Number_of_Stories  >  20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories  <  15
SELECT DISTINCT Address FROM building
SELECT DISTINCT Address FROM building
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Channel_Details FROM Channels ORDER BY Channel_Details ASC
SELECT Channel_Details FROM Channels ORDER BY Channel_Details ASC
SELECT count(*) FROM Services
SELECT count(*) FROM Services
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY count(*) DESC LIMIT 1
SELECT t3.service_id FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id JOIN services AS t3 ON t2.service_id  =  t3.service_id WHERE t1.customer_details  =  "Hardy Kutch"
SELECT t3.service_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id JOIN services AS t3 ON t2.service_id  =  t3.service_id WHERE t1.customer_details  =  "Hardy Kutch"
SELECT T2.Service_Details FROM `Customers_and_Services` AS T1 JOIN `Services` AS T2 ON T1.Service_ID  =  T2.Service_ID GROUP BY T1.Service_ID HAVING count(*)  >  3
SELECT T2.Service_Details FROM `Customers_and_Services` AS T1 JOIN `Services` AS T2 ON T1.Service_ID  =  T2.Service_ID GROUP BY T1.Service_ID HAVING count(*)  >  3
SELECT T1.customer_details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.customer_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id GROUP BY t1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.customer_details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT customer_details FROM customers EXCEPT SELECT t1.customer_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id
SELECT customer_details FROM Customers EXCEPT SELECT T1.customer_details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.customer_id  =  T2.customer_id
SELECT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T2.service_id ORDER BY count(*) LIMIT 1
SELECT DISTINCT t1.customer_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id GROUP BY t1.customer_id ORDER BY count(*) ASC LIMIT 1
SELECT count(DISTINCT Customers_and_Services_Details) FROM Customers_and_Services
SELECT count(*) FROM Customers UNION SELECT count(*) FROM Customers_and_Services UNION SELECT count(*) FROM Services
SELECT customer_details FROM customers WHERE customer_details LIKE "%Kutch%"
SELECT customer_details FROM Customers WHERE customer_details LIKE "%Kutch%"
SELECT t3.service_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id JOIN services AS t3 ON t2.service_id  =  t3.service_id JOIN customer_interactions AS t4 ON t2.customer_id  =  t4.customer_id WHERE t1.customer_details  =  "Hardy Kutch" OR t4.status_code  =  "good"
SELECT T3.Service_Details FROM customers AS T1 JOIN customer_interactions AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN services AS T3 ON T2.Service_ID  =  T3.Service_ID WHERE T1.Customer_Details  =  "Hardy Kutch" OR T2.Status_Code  =  "good"
SELECT t3.service_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id JOIN services AS t3 ON t2.service_id  =  t3.service_id JOIN customer_interactions AS t4 ON t2.customer_id  =  t4.customer_id AND t2.service_id  =  t4.service_id WHERE t1.customer_details  =  "Hardy Kutch" AND t4.status_code  =  "bad"
SELECT t3.service_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id JOIN services AS t3 ON t2.service_id  =  t3.service_id JOIN customer_interactions AS t4 ON t2.customer_id  =  t4.customer_id AND t2.service_id  =  t4.service_id WHERE t1.customer_details  =  "Hardy Kutch" AND t4.status_code  =  "bad"
SELECT T3.Service_Details FROM `Customer_Interactions` AS T1 JOIN `Channels` AS T2 ON T1.Channel_ID  =  T2.Channel_ID JOIN `Services` AS T3 ON T1.Service_ID  =  T3.Service_ID WHERE T2.Channel_Details  =  "15 ij"
SELECT T3.Service_Details FROM `Customer_Interactions` AS T1 JOIN `Channels` AS T2 ON T1.Channel_ID  =  T2.Channel_ID JOIN `Services` AS T3 ON T1.Service_ID  =  T3.Service_ID WHERE T2.Channel_Details  =  "15 ij"
SELECT T2.Customer_Details FROM `Customer_Interactions` AS T1 JOIN `Customers` AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN `Services` AS T3 ON T1.Service_ID  =  T3.Service_ID JOIN `Channels` AS T4 ON T1.Channel_ID  =  T4.Channel_ID WHERE T1.Status_Code  =  "Stuck" AND T3.Service_Details  =  "bad" AND T4.Channel_Details  =  "bad"
SELECT T2.Customer_Details FROM `Customer_Interactions` AS T1 JOIN `Customers` AS T2 ON T1.Customer_ID  =  T2.Customer_ID WHERE T1.Status_Code  =  "Stuck" AND T1.Services_and_Channels_Details  =  "bad"
SELECT count(*) FROM Integration_Platform WHERE Integration_Platform_Details  =  "Success"
SELECT count(*) FROM Integration_Platform WHERE Integration_Platform_Details LIKE "%Success%"
SELECT T1.customer_details FROM Customers AS T1 JOIN Integration_Platform AS T2 ON T1.customer_id  =  T2.customer_interaction_id WHERE T2.integration_platform_details  =  "Failed"
SELECT T1.customer_details FROM Customers AS T1 JOIN Customer_Interactions AS T2 ON T1.customer_id  =  T2.customer_id JOIN Integration_Platform AS T3 ON T2.customer_interaction_id  =  T3.customer_interaction_id WHERE T3.integration_platform_details  =  "Fail"
SELECT service_details FROM services WHERE service_id NOT IN (SELECT service_id FROM customers_and_services)
SELECT service_details FROM services WHERE service_id NOT IN (SELECT service_id FROM customers_and_services)
SELECT Analytical_Layer_Type_Code ,  COUNT(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code ,  count(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Customers_and_Services_Details FROM Customers_and_Services WHERE Customers_and_Services_Details  =  "Unsatisfied"
SELECT Customers_and_Services_Details FROM Customers_and_Services WHERE Customers_and_Services_Details  =  "Unsatisfied"
SELECT count(*) FROM Vehicles
SELECT count(*) FROM Vehicles
SELECT name FROM Vehicles ORDER BY model_year DESC
SELECT name FROM Vehicles ORDER BY model_year DESC
SELECT DISTINCT TYPE_of_powertrain FROM Vehicles
SELECT DISTINCT TYPE_OF_POWERTRAIN FROM Vehicles
SELECT name ,  type_of_powertrain ,  annual_fuel_cost FROM Vehicles WHERE model_year  =  2013 OR model_year  =  2014
SELECT name ,  type_of_powertrain ,  Annual_fuel_cost FROM Vehicles WHERE model_year  =  2013 OR model_year  =  2014
SELECT TYPE_of_powertrain FROM Vehicles WHERE Model_year  =  2014 INTERSECT SELECT TYPE_of_powertrain FROM Vehicles WHERE Model_year  =  2013
SELECT TYPE_of_powertrain FROM Vehicles WHERE Model_year  =  2013 INTERSECT SELECT TYPE_of_powertrain FROM Vehicles WHERE Model_year  =  2014
SELECT TYPE_of_powertrain ,  count(*) FROM Vehicles GROUP BY TYPE_of_powertrain
SELECT TYPE_OF_POWERTRAIN ,  count(*) FROM Vehicles GROUP BY TYPE_OF_POWERTRAIN
SELECT TYPE_OF_POWERTRAIN FROM Vehicles GROUP BY TYPE_OF_POWERTRAIN ORDER BY COUNT(*) DESC LIMIT 1
SELECT TYPE_OF_POWERTRAIN FROM Vehicles GROUP BY TYPE_OF_POWERTRAIN ORDER BY COUNT(*) DESC LIMIT 1
SELECT min(Annual_fuel_cost) ,  max(Annual_fuel_cost) ,  avg(Annual_fuel_cost) FROM Vehicles
SELECT min(Annual_fuel_cost) ,  max(Annual_fuel_cost) ,  avg(Annual_fuel_cost) FROM Vehicles
SELECT name ,  model_year FROM Vehicles WHERE city_fuel_economy_rate  <=  highway_fuel_economy_rate
SELECT name ,  model_year FROM Vehicles WHERE city_fuel_economy_rate  <=  highway_fuel_economy_rate
SELECT TYPE_of_powertrain ,  avg(Annual_fuel_cost) FROM Vehicles GROUP BY TYPE_of_powertrain HAVING count(*)  >=  2
SELECT TYPE_of_powertrain ,  avg(Annual_fuel_cost) FROM Vehicles GROUP BY TYPE_of_powertrain HAVING count(*)  >=  2
SELECT name ,  age ,  membership_credit FROM Customers
SELECT name ,  age ,  membership_credit FROM Customers
SELECT name ,  age FROM customers ORDER BY membership_credit DESC LIMIT 1
SELECT name ,  age FROM customers ORDER BY membership_credit DESC LIMIT 1
SELECT avg(age) FROM customers WHERE membership_credit  >  (SELECT avg(membership_credit) FROM customers)
SELECT avg(age) FROM customers WHERE membership_credit  >  (SELECT avg(membership_credit) FROM customers)
SELECT * FROM discount
SELECT * FROM discount
SELECT T2.name ,  sum(T1.total_hours) FROM Renting_history AS T1 JOIN Vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id
SELECT T2.name ,  sum(T1.total_hours) FROM Renting_history AS T1 JOIN Vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id
SELECT name FROM Vehicles WHERE id NOT IN (SELECT vehicles_id FROM Renting_history)
SELECT name FROM Vehicles WHERE id NOT IN (SELECT vehicles_id FROM Renting_history)
SELECT T1.name FROM Customers AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.customer_id GROUP BY T1.id HAVING count(*)  >=  2
SELECT T1.name FROM Customers AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.customer_id GROUP BY T1.id HAVING count(*)  >=  2
SELECT T2.name ,  T2.Model_year FROM Renting_history AS T1 JOIN Vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name ,  T2.Model_year FROM Renting_history AS T1 JOIN Vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM Renting_history AS T1 JOIN Vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id ORDER BY sum(T1.total_hours) DESC
SELECT T2.name FROM Renting_history AS T1 JOIN Vehicles AS T2 ON T1.vehicles_id  =  T2.id ORDER BY T1.total_hours DESC
SELECT T2.name FROM Renting_history AS T1 JOIN Discount AS T2 ON T1.discount_id  =  T2.id GROUP BY T1.discount_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM Renting_history AS T1 JOIN Discount AS T2 ON T1.discount_id  =  T2.id GROUP BY T1.discount_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name ,  T1.type_of_powertrain FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id  =  T2.vehicles_id GROUP BY T2.vehicles_id HAVING sum(T2.total_hours)  >  30
SELECT T2.name ,  T2.type_of_powertrain FROM Renting_history AS T1 JOIN Vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id HAVING sum(T1.total_hours)  >  30
SELECT TYPE_of_powertrain ,  avg(City_fuel_economy_rate) ,  avg(Highway_fuel_economy_rate) FROM Vehicles GROUP BY TYPE_of_powertrain
SELECT TYPE_OF_POWERTRAIN ,  avg(City_fuel_economy_rate) ,  avg(Highway_fuel_economy_rate) FROM Vehicles GROUP BY TYPE_OF_POWERTRAIN
SELECT avg(amount_of_loan) FROM Student_Loans
SELECT avg(amount_of_loan) FROM Student_Loans
SELECT T1.student_id ,  T1.bio_data FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2 UNION SELECT T1.student_id ,  T1.bio_data FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  <  2
SELECT T1.bio_data ,  T1.student_id FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2 UNION SELECT T1.bio_data ,  T1.student_id FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  <  2
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE '%data%' EXCEPT SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE 'net%'
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE '%data%' EXCEPT SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE 'net%'
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention) AND student_id NOT IN (SELECT student_id FROM Student_Loans)
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention) AND student_id NOT IN (SELECT student_id FROM Student_Loans)
SELECT T1.amount_of_loan ,  T1.date_of_loan FROM Student_Loans AS T1 JOIN Achievements AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2
SELECT T1.amount_of_loan ,  T1.date_of_loan FROM Student_Loans AS T1 JOIN Achievements AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2
SELECT T1.teacher_details ,  T1.teacher_id FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.teacher_details ,  T1.teacher_id FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T1.teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT T2.detention_type_description FROM `Detention` AS T1 JOIN `Ref_Detention_Type` AS T2 ON T1.detention_type_code  =  T2.detention_type_code
SELECT DISTINCT T2.detention_type_description FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code  =  T2.detention_type_code
SELECT T2.address_details ,  T3.address_type_description FROM Students_Addresses AS T1 JOIN Addresses AS T2 ON T1.address_id  =  T2.address_id JOIN Ref_Address_Types AS T3 ON T1.address_type_code  =  T3.address_type_code
SELECT T2.address_details ,  T3.address_type_description FROM Students_Addresses AS T1 JOIN Addresses AS T2 ON T1.address_id  =  T2.address_id JOIN Ref_Address_Types AS T3 ON T1.address_type_code  =  T3.address_type_code
SELECT T1.address_details ,  T2.bio_data FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id  =  T2.student_id
SELECT T1.address_details ,  T2.bio_data FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id  =  T2.student_id
SELECT T1.bio_data ,  T2.date_of_transcript FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data ,  T2.date_of_transcript FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id
SELECT behaviour_monitoring_details ,  count(*) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT behaviour_monitoring_details ,  count(*) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT T2.bio_data ,  T2.student_details FROM Behaviour_Monitoring AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1 INTERSECT SELECT T2.bio_data ,  T2.student_details FROM Behaviour_Monitoring AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.behaviour_monitoring_details HAVING count(*)  =  3
SELECT T2.bio_data ,  T2.student_details FROM Behaviour_Monitoring AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1 INTERSECT SELECT T2.bio_data ,  T2.student_details FROM Behaviour_Monitoring AS T1 JOIN Students AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.behaviour_monitoring_details HAVING count(*)  =  3
SELECT T2.bio_data FROM `Behaviour_Monitoring` AS T1 JOIN `Students` AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING T1.behaviour_monitoring_details  =  (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1)
SELECT T2.bio_data FROM `Behaviour_Monitoring` AS T1 JOIN `Students` AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data ,  T2.event_date FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data ,  T2.event_date FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id
SELECT count(*) ,  T1.event_type_code ,  T2.event_type_description FROM Ref_Event_Types AS T1 JOIN Student_Events AS T2 ON T1.event_type_code  =  T2.event_type_code GROUP BY T1.event_type_code ORDER BY count(*) DESC LIMIT 1
SELECT count(*) ,  T1.event_type_code ,  T1.event_type_description FROM Ref_Event_Types AS T1 JOIN Student_Events AS T2 ON T1.event_type_code  =  T2.event_type_code GROUP BY T1.event_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.achievement_details ,  T2.achievement_type_description FROM Achievements AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code  =  T2.achievement_type_code
SELECT T1.achievement_details ,  T2.achievement_type_description FROM Achievements AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code  =  T2.achievement_type_code
SELECT count(*) FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Achievements AS T3 ON T2.student_id  =  T3.student_id WHERE T3.achievement_id  =  "null"
SELECT count(*) FROM Teachers AS T1 JOIN Classes AS C ON T1.teacher_id  =  C.teacher_id JOIN Achievements AS A ON C.student_id  =  A.student_id WHERE A.achievement_id  =  "null"
SELECT date_of_transcript ,  transcript_details FROM Transcripts
SELECT date_of_transcript ,  transcript_details FROM Transcripts
SELECT achievement_type_code ,  achievement_details ,  date_achievement FROM Achievements
SELECT T1.achievement_type_code ,  T1.achievement_details ,  T1.date_achievement FROM Achievements AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code  =  T2.achievement_type_code
SELECT datetime_detention_start ,  datetime_detention_end FROM Detention
SELECT datetime_detention_start ,  datetime_detention_end FROM Detention
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT bio_data FROM Students WHERE student_details LIKE "%Suite%"
SELECT T2.teacher_details ,  T3.student_details FROM `Classes` AS T1 JOIN `Teachers` AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN `Students` AS T3 ON T1.student_id  =  T3.student_id
SELECT T2.teacher_details ,  T3.student_details FROM Classes AS T1 JOIN Teachers AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Students AS T3 ON T1.student_id  =  T3.student_id
SELECT max(count(*)) ,  teacher_id FROM Classes GROUP BY teacher_id
SELECT teacher_id ,  count(*) FROM Classes GROUP BY teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT max(count(*)) ,  student_id FROM Classes GROUP BY student_id
SELECT student_id ,  count(*) FROM Classes GROUP BY student_id ORDER BY count(*) DESC LIMIT 1
SELECT student_id ,  class_details FROM Classes GROUP BY student_id HAVING count(*)  =  2
SELECT T1.student_id ,  T2.student_details FROM CLASSES AS T1 JOIN STUDENTS AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT T2.detention_type_code ,  T2.detention_type_description FROM `Detention` AS T1 JOIN `Ref_Detention_Type` AS T2 ON T1.detention_type_code  =  T2.detention_type_code GROUP BY T1.detention_type_code ORDER BY count(*) ASC LIMIT 1
SELECT T1.detention_type_code ,  T2.detention_type_description FROM `Detention` AS T1 JOIN `Ref_Detention_Type` AS T2 ON T1.detention_type_code  =  T2.detention_type_code GROUP BY T1.detention_type_code ORDER BY count(*) ASC LIMIT 1
SELECT T1.bio_data ,  T1.student_details FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id WHERE T2.amount_of_loan  >  (SELECT avg(amount_of_loan) FROM Student_Loans)
SELECT T1.bio_data ,  T1.student_details FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id WHERE T2.amount_of_loan  >  (SELECT avg(amount_of_loan) FROM Student_Loans)
SELECT date_of_loan FROM Student_Loans ORDER BY date_of_loan ASC LIMIT 1
SELECT date_of_loan FROM Student_Loans ORDER BY date_of_loan ASC LIMIT 1
SELECT T1.bio_data FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id ORDER BY T2.amount_of_loan LIMIT 1
SELECT T1.bio_data FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id ORDER BY T2.amount_of_loan LIMIT 1
SELECT T2.date_of_transcript FROM Student_Loans AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id ORDER BY T1.amount_of_loan DESC LIMIT 1
SELECT T2.date_of_transcript FROM Student_Loans AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id ORDER BY T1.amount_of_loan DESC LIMIT 1
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Transcripts AS T3 ON T2.class_id  =  T3.student_id ORDER BY T3.date_of_transcript LIMIT 1
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Transcripts AS T3 ON T2.class_id  =  T3.student_id ORDER BY T3.date_of_transcript LIMIT 1
SELECT student_id ,  sum(amount_of_loan) FROM Student_Loans GROUP BY student_id
SELECT student_id ,  sum(amount_of_loan) FROM Student_Loans GROUP BY student_id
SELECT T1.student_id ,  T1.bio_data ,  count(*) FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id
SELECT T1.student_id ,  T1.bio_data ,  count(*) FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id
SELECT count(DISTINCT student_id) FROM Detention
SELECT count(DISTINCT student_id) FROM Detention
SELECT T1.address_type_code ,  T1.address_type_description FROM Ref_Address_Types AS T1 JOIN Students_Addresses AS T2 ON T1.address_type_code  =  T2.address_type_code GROUP BY T1.address_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.address_type_code ,  T1.address_type_description FROM Ref_Address_Types AS T1 JOIN Students_Addresses AS T2 ON T1.address_type_code  =  T2.address_type_code GROUP BY T1.address_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id EXCEPT SELECT T1.bio_data FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id EXCEPT SELECT T1.bio_data FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.date_from ,  T1.date_to FROM Students_Addresses AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT T2.date_from ,  T2.date_to FROM Addresses AS T1 JOIN Students_Addresses AS T2 ON T1.address_id  =  T2.address_id JOIN Students AS T3 ON T2.student_id  =  T3.student_id JOIN Transcripts AS T4 ON T3.student_id  =  T4.student_id GROUP BY T3.student_id HAVING count(*)  =  2
SELECT datetime_detention_start FROM Detention
SELECT datetime_detention_start FROM Detention
SELECT Name FROM Author
SELECT Name FROM Author
SELECT Name ,  Address FROM Client
SELECT Name ,  Address FROM Client
SELECT Title ,  ISBN ,  SalePrice FROM Book
SELECT Title ,  ISBN ,  SalePrice FROM Book
SELECT count(*) FROM Book
SELECT count(*) FROM Book
SELECT count(*) FROM Author
SELECT count(*) FROM Author
SELECT count(*) FROM Client
SELECT count(*) FROM Client
SELECT Name ,  Address FROM Client ORDER BY Name
SELECT Name ,  Address FROM Client ORDER BY Name
SELECT T3.Title ,  T1.Name FROM Author AS T1 JOIN Author_Book AS T2 ON T1.idAuthor  =  T2.Author JOIN Book AS T3 ON T3.ISBN  =  T2.ISBN
SELECT T2.Title ,  T1.Author FROM Author_Book AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN
SELECT T1.idorder ,  T2.name FROM Orders AS T1 JOIN Client AS T2 ON T1.idclient  =  T2.idclient
SELECT T1.idorder ,  T2.name FROM Orders AS T1 JOIN Client AS T2 ON T1.idclient  =  T2.idclient
SELECT T1.Name ,  count(*) FROM `Author` AS T1 JOIN `Author_Book` AS T2 ON T1.idAuthor  =  T2.Author GROUP BY T1.idAuthor
SELECT T1.Name ,  count(*) FROM `Author` AS T1 JOIN `Author_Book` AS T2 ON T1.idAuthor  =  T2.Author GROUP BY T1.idAuthor
SELECT isbn ,  count(*) FROM Books_Order GROUP BY isbn
SELECT isbn ,  sum(amount) FROM Books_Order GROUP BY isbn
SELECT isbn ,  sum(amount) FROM Books_Order GROUP BY isbn
SELECT isbn ,  sum(amount) FROM Books_Order GROUP BY isbn
SELECT T2.Title FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN GROUP BY T1.ISBN ORDER BY count(*) DESC LIMIT 1
SELECT T2.Title FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN GROUP BY T1.ISBN ORDER BY sum(T1.amount) DESC LIMIT 1
SELECT T1.Title ,  T1.PurchasePrice FROM `Book` AS T1 JOIN `Books_Order` AS T2 ON T1.ISBN  =  T2.ISBN GROUP BY T1.ISBN ORDER BY sum(T2.amount) DESC LIMIT 1
SELECT T1.Title ,  T1.PurchasePrice FROM `Book` AS T1 JOIN `Books_Order` AS T2 ON T1.ISBN  =  T2.ISBN GROUP BY T1.ISBN ORDER BY sum(T2.amount) DESC LIMIT 1
SELECT T2.Title FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN
SELECT DISTINCT T2.Title FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN
SELECT T1.Name FROM `Client` AS T1 JOIN `Orders` AS T2 ON T1.IdClient  =  T2.IdClient GROUP BY T1.IdClient HAVING count(*)  >=  1
SELECT DISTINCT T1.Name FROM `Client` AS T1 JOIN `Orders` AS T2 ON T1.IdClient  =  T2.IdClient
SELECT T1.Name ,  count(*) FROM `Client` AS T1 JOIN `Orders` AS T2 ON T1.IdClient  =  T2.IdClient GROUP BY T1.IdClient
SELECT T1.Name ,  count(*) FROM `Client` AS T1 JOIN `Orders` AS T2 ON T1.IdClient  =  T2.IdClient GROUP BY T1.Name
SELECT T1.Name FROM `Client` AS T1 JOIN `Orders` AS T2 ON T1.IdClient  =  T2.IdClient GROUP BY T1.IdClient ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name FROM `Client` AS T1 JOIN `Orders` AS T2 ON T1.IdClient  =  T2.IdClient GROUP BY T1.Name ORDER BY count(*) DESC LIMIT 1
SELECT T3.Name ,  sum(T2.amount) FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T1.IdClient  =  T3.IdClient GROUP BY T1.IdClient
SELECT T1.Name ,  sum(T3.amount) FROM `Client` AS T1 JOIN `Orders` AS T2 ON T1.IdClient  =  T2.IdClient JOIN `Books_Order` AS T3 ON T2.IdOrder  =  T3.IdOrder GROUP BY T1.Name
SELECT T1.Name FROM `Client` AS T1 JOIN `Orders` AS T2 ON T1.IdClient  =  T2.IdClient JOIN `Books_Order` AS T3 ON T2.IdOrder  =  T3.IdOrder GROUP BY T1.Name ORDER BY sum(T3.amount) DESC LIMIT 1
SELECT T1.Name FROM `Client` AS T1 JOIN `Orders` AS T2 ON T1.IdClient  =  T2.IdClient JOIN `Books_Order` AS T3 ON T2.IdOrder  =  T3.IdOrder GROUP BY T1.Name ORDER BY sum(T3.amount) DESC LIMIT 1
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order)
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order)
SELECT Name FROM `Client` WHERE IdClient NOT IN (SELECT IdClient FROM `Orders`)
SELECT Name FROM `Client` WHERE IdClient NOT IN (SELECT IdClient FROM `Orders`)
SELECT max(SalePrice) ,  min(SalePrice) FROM Book
SELECT max(SalePrice) ,  min(SalePrice) FROM Book
SELECT avg(PurchasePrice) ,  avg(SalePrice) FROM Book
SELECT avg(PurchasePrice) ,  avg(SalePrice) FROM Book
SELECT max(SalePrice - PurchasePrice) FROM Book
SELECT max(SalePrice - PurchasePrice) FROM Book
SELECT Title FROM Book WHERE SalePrice  >  (SELECT avg(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice  >  (SELECT avg(SalePrice) FROM Book)
SELECT Title FROM Book ORDER BY SalePrice LIMIT 1
SELECT Title FROM Book WHERE SalePrice  =  (SELECT min(SalePrice) FROM Book)
SELECT Title FROM Book ORDER BY PurchasePrice DESC LIMIT 1
SELECT Title FROM Book ORDER BY PurchasePrice DESC LIMIT 1
SELECT avg(T1.SalePrice) FROM Book AS T1 JOIN Author_Book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "George Orwell"
SELECT avg(T3.SalePrice) FROM `author` AS T1 JOIN `author_book` AS T2 ON T1.idAuthor  =  T2.Author JOIN `book` AS T3 ON T2.ISBN  =  T3.ISBN WHERE T1.Name  =  "George Orwell"
SELECT T1.SalePrice FROM `Book` AS T1 JOIN `Author_Book` AS T2 ON T1.ISBN  =  T2.ISBN JOIN `Author` AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "Plato"
SELECT T1.SalePrice FROM `Book` AS T1 JOIN `Author_Book` AS T2 ON T1.ISBN  =  T2.ISBN JOIN `Author` AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "Plato"
SELECT T1.Title FROM `Book` AS T1 JOIN `Author_Book` AS T2 ON T1.ISBN  =  T2.ISBN JOIN `Author` AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "George Orwell" ORDER BY T1.SalePrice LIMIT 1
SELECT T1.Title FROM `Book` AS T1 JOIN `Author` AS T2 ON T1.Author  =  T2.idAuthor JOIN `Author_Book` AS T3 ON T3.Author  =  T2.idAuthor WHERE T2.Name  =  "George Orwell" ORDER BY T1.SalePrice LIMIT 1
SELECT Title FROM book WHERE Author  =  "Plato" AND SalePrice  <  (SELECT avg(SalePrice) FROM book)
SELECT T1.title FROM book AS T1 JOIN author_book AS T2 ON T1.isbn  =  T2.isbn JOIN author AS T3 ON T2.author  =  T3.idauthor WHERE T3.name  =  "Plato" AND T1.saleprice  <  (SELECT avg(saleprice) FROM book)
SELECT T1.Name FROM `author` AS T1 JOIN `author_book` AS T2 ON T1.idAuthor  =  T2.Author JOIN `book` AS T3 ON T3.ISBN  =  T2.ISBN WHERE T3.Title  =  "Pride and Prejudice"
SELECT T1.Name FROM `author` AS T1 JOIN `author_book` AS T2 ON T1.idAuthor  =  T2.Author JOIN `book` AS T3 ON T3.ISBN  =  T2.ISBN WHERE T3.Title  =  "Pride and Prejudice"
SELECT T3.Title FROM `author` AS T1 JOIN `author_book` AS T2 ON T1.idAuthor  =  T2.Author JOIN `book` AS T3 ON T3.ISBN  =  T2.ISBN WHERE T1.Name LIKE '%Plato%'
SELECT T3.Title FROM `author` AS T1 JOIN `author_book` AS T2 ON T1.idAuthor  =  T2.Author JOIN `book` AS T3 ON T3.ISBN  =  T2.ISBN WHERE T1.Name LIKE "%Plato%"
SELECT count(*) FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN WHERE T2.Title  =  "Pride and Prejudice"
SELECT count(*) FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN WHERE T2.Title  =  "Pride and Prejudice"
SELECT IdOrder FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN WHERE T2.Title  =  "Pride and Prejudice" INTERSECT SELECT IdOrder FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN WHERE T2.Title  =  "The Little Prince"
SELECT idorder FROM Books_Order AS T1 JOIN Book AS T2 ON T1.isbn  =  T2.isbn WHERE T2.title  =  "Pride and Prejudice" INTERSECT SELECT idorder FROM Books_Order AS T1 JOIN Book AS T2 ON T1.isbn  =  T2.isbn WHERE T2.title  =  "The Little Prince"
SELECT T1.isbn FROM Books_Order AS T1 JOIN Orders AS T2 ON T1.idorder  =  T2.idorder JOIN Client AS T3 ON T2.idclient  =  T3.idclient WHERE T3.name  =  "Peter Doe" INTERSECT SELECT T1.isbn FROM Books_Order AS T1 JOIN Orders AS T2 ON T1.idorder  =  T2.idorder JOIN Client AS T3 ON T2.idclient  =  T3.idclient WHERE T3.name  =  "James Smith"
SELECT T1.isbn FROM Books_Order AS T1 JOIN Orders AS T2 ON T1.idorder  =  T2.idorder JOIN Client AS T3 ON T2.idclient  =  T3.idclient WHERE T3.name  =  "Peter Doe" INTERSECT SELECT T1.isbn FROM Books_Order AS T1 JOIN Orders AS T2 ON T1.idorder  =  T2.idorder JOIN Client AS T3 ON T2.idclient  =  T3.idclient WHERE T3.name  =  "James Smith"
SELECT T4.Title FROM Books_Order AS T1 JOIN Orders AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T2.IdClient  =  T3.IdClient JOIN Book AS T4 ON T1.ISBN  =  T4.ISBN WHERE T3.Name  =  "Peter Doe" EXCEPT SELECT T4.Title FROM Books_Order AS T1 JOIN Orders AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T2.IdClient  =  T3.IdClient JOIN Book AS T4 ON T1.ISBN  =  T4.ISBN WHERE T3.Name  =  "James Smith"
SELECT T4.Title FROM Books_Order AS T1 JOIN Orders AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T2.IdClient  =  T3.IdClient JOIN Book AS T4 ON T1.ISBN  =  T4.ISBN WHERE T3.Name  =  "Peter Doe" EXCEPT SELECT T4.Title FROM Books_Order AS T1 JOIN Orders AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T2.IdClient  =  T3.IdClient JOIN Book AS T4 ON T1.ISBN  =  T4.ISBN WHERE T3.Name  =  "James Smith"
SELECT T1.Name FROM `Client` AS T1 JOIN `Orders` AS T2 ON T1.IdClient  =  T2.IdClient JOIN `Books_Order` AS T3 ON T2.IdOrder  =  T3.IdOrder JOIN `Book` AS T4 ON T3.ISBN  =  T4.ISBN WHERE T4.Title  =  "Pride and Prejudice"
SELECT T1.Name FROM `Client` AS T1 JOIN `Orders` AS T2 ON T1.IdClient  =  T2.IdClient JOIN `Books_Order` AS T3 ON T2.IdOrder  =  T3.IdOrder JOIN `Book` AS T4 ON T3.ISBN  =  T4.ISBN WHERE T4.Title  =  "Pride and Prejudice"
SELECT count(*) FROM book
SELECT Title FROM book ORDER BY Title ASC
SELECT Title FROM book ORDER BY Pages DESC
SELECT TYPE ,  Release FROM book
SELECT max(Chapters) ,  min(Chapters) ,  Title FROM book GROUP BY Title
SELECT Title FROM book WHERE TYPE != "Poet"
SELECT avg(Rating) FROM review
SELECT T1.Title ,  T2.Rating FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID
SELECT t2.rating FROM `book` AS t1 JOIN `review` AS t2 ON t1.book_id  =  t2.book_id ORDER BY t1.chapters DESC LIMIT 1
SELECT T2.Rank FROM `book` AS T1 JOIN `review` AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T1.Pages LIMIT 1
SELECT T1.Title FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T2.Rank DESC LIMIT 1
SELECT avg(T2.Readers_in_Million) FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID WHERE T1.Type  =  "Novel"
SELECT TYPE ,  count(*) FROM book GROUP BY TYPE
SELECT TYPE FROM book GROUP BY TYPE ORDER BY COUNT(*) DESC LIMIT 1
SELECT TYPE FROM book GROUP BY TYPE HAVING count(*)  >=  3
SELECT T1.Title FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T2.Rating ASC
SELECT T1.Title ,  T1.Audio FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T2.Readers_in_Million DESC
SELECT count(*) FROM book WHERE book_id NOT IN (SELECT book_id FROM review)
SELECT TYPE FROM book WHERE Chapters  >  75 INTERSECT SELECT TYPE FROM book WHERE Chapters  <  50
SELECT count(DISTINCT TYPE) FROM book
SELECT TYPE ,  Title FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
SELECT count(*) FROM customer
SELECT count(*) FROM customer
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
SELECT Nationality ,  Card_Credit FROM customer
SELECT Nationality ,  Card_Credit FROM customer
SELECT Name FROM customer WHERE Nationality  =  "England" OR Nationality  =  "Australia"
SELECT Name FROM customer WHERE Nationality  =  "England" OR Nationality  =  "Australia"
SELECT avg(card_credit) FROM customer WHERE LEVEL_OF_MEMBERSHIP  >  1
SELECT avg(card_credit) FROM customer WHERE LEVEL_OF_MEMBERSHIP  >  1
SELECT Card_Credit FROM customer ORDER BY Level_of_Membership DESC LIMIT 1
SELECT card_credit FROM customer ORDER BY LEVEL_of_Membership DESC LIMIT 1
SELECT Nationality ,  COUNT(*) FROM customer GROUP BY Nationality
SELECT Nationality ,  COUNT(*) FROM customer GROUP BY Nationality
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM customer WHERE Card_Credit  <  50 INTERSECT SELECT Nationality FROM customer WHERE Card_Credit  >  75
SELECT Nationality FROM customer WHERE Card_Credit  >  50 INTERSECT SELECT Nationality FROM customer WHERE Card_Credit  <  75
SELECT T2.Name ,  T1.Dish_Name FROM customer_order AS T1 JOIN customer AS T2 ON T1.Customer_ID  =  T2.Customer_ID
SELECT T2.Name ,  T1.Dish_Name FROM customer_order AS T1 JOIN customer AS T2 ON T1.Customer_ID  =  T2.Customer_ID
SELECT T2.Name ,  T1.Dish_Name FROM customer_order AS T1 JOIN customer AS T2 ON T1.Customer_ID  =  T2.Customer_ID ORDER BY T1.Quantity DESC
SELECT T2.Name ,  T1.Dish_Name FROM customer_order AS T1 JOIN customer AS T2 ON T1.Customer_ID  =  T2.Customer_ID ORDER BY T1.Quantity DESC
SELECT T2.Name ,  sum(T1.Quantity) FROM customer_order AS T1 JOIN customer AS T2 ON T1.Customer_ID  =  T2.Customer_ID GROUP BY T1.Customer_ID
SELECT T2.name ,  sum(T1.quantity) FROM customer_order AS T1 JOIN customer AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id
SELECT customer_id FROM customer_order GROUP BY customer_id HAVING sum(quantity)  >  1
SELECT T2.Name FROM `customer_order` AS T1 JOIN `customer` AS T2 ON T1.Customer_ID  =  T2.Customer_ID GROUP BY T1.Customer_ID HAVING sum(T1.Quantity)  >  1
SELECT DISTINCT Manager FROM branch
SELECT DISTINCT Manager FROM branch
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order)
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order)
SELECT count(*) FROM member
SELECT Name FROM member ORDER BY Age ASC
SELECT Name ,  Nationality FROM member
SELECT Name FROM member WHERE Nationality != "England"
SELECT Name FROM member WHERE Age  =  19 OR Age  =  20
SELECT Name FROM member ORDER BY Age DESC LIMIT 1
SELECT Nationality ,  COUNT(*) FROM member GROUP BY Nationality
SELECT Nationality FROM `member` GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM `member` GROUP BY Nationality HAVING COUNT(*)  >=  2
SELECT T3.club_name ,  T2.name FROM club_leader AS T1 JOIN club AS T2 ON T1.club_id  =  T2.club_id JOIN member AS T3 ON T1.member_id  =  T3.member_id
SELECT T3.Name FROM club AS T1 JOIN club_leader AS T2 ON T1.Club_ID  =  T2.Club_ID JOIN member AS T3 ON T2.Member_ID  =  T3.Member_ID WHERE T1.Overall_Ranking  >  100
SELECT T3.Name FROM club_leader AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID JOIN member AS T3 ON T1.Member_ID  =  T3.Member_ID WHERE T1.Year_Join  <  2018
SELECT Team_Leader FROM club WHERE Club_Name  =  "Houston"
SELECT Name FROM member WHERE Member_ID NOT IN (SELECT Member_ID FROM club_leader)
SELECT Nationality FROM `member` WHERE Age  >  22 INTERSECT SELECT Nationality FROM `member` WHERE Age  <  19
SELECT avg(T2.Age) FROM club_leader AS T1 JOIN member AS T2 ON T1.Member_ID  =  T2.Member_ID
SELECT club_name FROM club WHERE club_name LIKE '%state%'
SELECT T1.Collection_Subset_Name FROM `Collection_Subsets` AS T1 JOIN `Collection_Subset_Members` AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID GROUP BY T2.Collection_Subset_ID
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT Collecrtion_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name  =  "Top collection"
SELECT T3.Collection_Description FROM `Collection_Subsets` AS T1 JOIN `Collection_Subset_Members` AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID JOIN `Collections` AS T3 ON T2.Collection_ID  =  T3.Collection_ID WHERE T1.Collection_Subset_Name  =  'Top collection'
SELECT T2.document_subset_name FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.document_subset_id  =  T2.document_subset_id
SELECT document_subset_name FROM Document_Subsets
SELECT document_subset_details FROM Document_Subsets WHERE document_subset_name  =  "Best for 2000"
SELECT document_subset_details FROM Document_Subsets WHERE document_subset_name  =  "Best for 2000"
SELECT document_object_id FROM Document_Objects
SELECT document_object_id FROM Document_Objects
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT document_object_id FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT Owner FROM Document_Objects WHERE Description  =  'Braeden Collection'
SELECT t3.owner FROM collections AS t1 JOIN documents_in_collections AS t2 ON t1.collection_id  =  t2.collection_id JOIN document_objects AS t3 ON t2.document_object_id  =  t3.document_object_id WHERE t1.collection_name  =  "Braeden Collection"
SELECT T1.Owner FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Parent_Document_Object_ID  =  T2.Document_Object_ID WHERE T2.Owner  =  "Marlin"
SELECT T1.Owner FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Parent_Document_Object_ID  =  T2.Document_Object_ID WHERE T2.Owner  =  "Marlin"
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID  =  Document_Object_ID
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID  =  Document_Object_ID
SELECT count(*) FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT count(*) FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT document_object_id FROM Document_Objects EXCEPT SELECT parent_document_object_id FROM Document_Objects
SELECT document_object_id FROM Document_Objects WHERE parent_document_object_id != document_object_id
SELECT parent_document_object_id ,  count(*) FROM Document_Objects GROUP BY parent_document_object_id
SELECT count(*) ,  Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT Collection_Name FROM Collections
SELECT Collection_Name FROM Collections
SELECT Collection_Description FROM Collections WHERE Collection_Name  =  "Best"
SELECT Collection_Description FROM Collections WHERE Collection_Name  =  "Best"
SELECT Collection_Name FROM collections WHERE Parent_Collection_ID  =  ( SELECT Collection_ID FROM collections WHERE Collection_Name  =  "Nice" )
SELECT DISTINCT T1.Collection_Name FROM collections AS T1 JOIN collections AS T2 ON T1.Parent_Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  "Nice"
SELECT Collection_Name FROM collections WHERE Parent_Collection_ID != Collection_ID
SELECT Collection_Name FROM collections WHERE Collection_ID NOT IN (SELECT Parent_Collection_ID FROM collections)
SELECT document_object_id FROM Document_Objects GROUP BY document_object_id HAVING count(*)  >  1
SELECT Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING count(*)  >  1
SELECT count(*) FROM Collections WHERE Parent_Collection_ID  =  ( SELECT Collection_ID FROM Collections WHERE Collection_Name  =  "Best" )
SELECT count(*) FROM collections WHERE parent_collection_id  =  (SELECT collection_id FROM collections WHERE collection_name  =  "Best")
SELECT T2.Related_Document_Object_ID FROM `Document_Objects` AS T1 JOIN `Document_Subset_Members` AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID WHERE T1.Owner  =  "Ransom"
SELECT T1.Related_Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID WHERE T2.Owner  =  "Ransom"
SELECT T1.Collection_Subset_ID ,  T1.Collection_Subset_Name ,  count(*) FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID GROUP BY T1.Collection_Subset_ID
SELECT T1.Collection_Subset_ID ,  T1.Collection_Subset_Name ,  count(*) FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID GROUP BY T1.Collection_Subset_ID
SELECT document_object_id ,  count(*) FROM Document_Objects GROUP BY document_object_id ORDER BY count(*) DESC LIMIT 1
SELECT document_object_id ,  count(*) FROM Document_Objects GROUP BY document_object_id
SELECT document_object_id ,  count(*) FROM Document_Subset_Members GROUP BY document_object_id ORDER BY count(*) ASC LIMIT 1
SELECT document_object_id FROM Documents_in_Collections GROUP BY document_object_id ORDER BY count(*) LIMIT 1
SELECT document_object_id ,  count(*) FROM Document_Subset_Members GROUP BY document_object_id HAVING count(*) BETWEEN 2 AND 4
SELECT document_object_id ,  count(*) FROM Document_Subset_Members GROUP BY document_object_id HAVING count(*) BETWEEN 2 AND 4
SELECT T1.Owner FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Document_Object_ID  =  T2.Parent_Document_Object_ID WHERE T2.Owner  =  "Braeden"
SELECT DISTINCT T1.Owner FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID  =  T2.Related_Document_Object_ID JOIN Document_Objects AS T3 ON T3.Document_Object_ID  =  T2.Document_Object_ID WHERE T3.Owner  =  "Braeden"
SELECT DISTINCT t3.document_subset_name FROM Document_Subset_Members AS t2 JOIN Document_Objects AS t1 ON t2.document_object_id  =  t1.document_object_id JOIN Document_Subsets AS t3 ON t2.document_subset_id  =  t3.document_subset_id WHERE t1.owner  =  "Braeden"
SELECT DISTINCT t3.document_subset_name FROM Document_Subset_Members AS t1 JOIN Document_Objects AS t2 ON t1.related_document_object_id  =  t2.document_object_id JOIN Document_Subsets AS t3 ON t1.document_subset_id  =  t3.document_subset_id WHERE t2.owner  =  "Braeden"
SELECT T1.document_subset_id ,  T1.document_subset_name ,  count(DISTINCT T2.document_object_id) FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.document_subset_id  =  T2.document_subset_id GROUP BY T1.document_subset_id
SELECT T1.document_subset_id ,  T1.document_subset_name ,  count(DISTINCT T2.document_object_id) FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.document_subset_id  =  T2.document_subset_id GROUP BY T1.document_subset_id
SELECT T1.document_subset_id ,  T2.document_subset_name ,  count(*) FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.document_subset_id  =  T2.document_subset_id GROUP BY T1.document_subset_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.document_subset_id ,  T1.document_subset_name ,  count(*) FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.document_subset_id  =  T2.document_subset_id GROUP BY T1.document_subset_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.document_object_id FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.document_subset_id  =  T2.document_subset_id WHERE T2.document_subset_name  =  'Best for 2000'
SELECT T1.document_object_id FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.document_subset_id  =  T2.document_subset_id WHERE T2.document_subset_name  =  'Best for 2000'
SELECT T2.document_subset_name ,  T1.document_object_id FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.document_subset_id  =  T2.document_subset_id GROUP BY T1.document_object_id
SELECT DISTINCT T1.document_object_id ,  T2.document_subset_name ,  T2.document_subset_id FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.document_subset_id  =  T2.document_subset_id
SELECT T2.Collection_Name FROM `Documents_in_Collections` AS T1 JOIN `Collections` AS T2 ON T1.Collection_ID  =  T2.Collection_ID JOIN `Document_Objects` AS T3 ON T1.Document_Object_ID  =  T3.Document_Object_ID WHERE T3.Owner  =  'Ransom '
SELECT T2.Collection_Name FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID JOIN Document_Objects AS T3 ON T1.Document_Object_ID  =  T3.Document_Object_ID WHERE T3.Owner  =  'Ransom'
SELECT count(*) ,  document_object_id FROM Documents_in_Collections GROUP BY document_object_id
SELECT document_object_id ,  count(*) FROM Documents_in_Collections GROUP BY document_object_id
SELECT count(*) FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  'Best'
SELECT count(*) FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  'Best'
SELECT T1.document_object_id FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T2.collection_name  =  "Best"
SELECT count(*) FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  "Best"
SELECT T2.Collection_Name ,  T2.Collection_ID ,  count(*) FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID GROUP BY T2.Collection_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Collection_Name ,  T1.Collection_ID ,  count(*) FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T1.Collection_Name  =  'Best' GROUP BY T1.Collection_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.document_object_id FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.document_object_id  =  T2.document_object_id JOIN Documents_in_Collections AS T3 ON T2.document_object_id  =  T3.document_object_id JOIN Collections AS T4 ON T3.collection_id  =  T4.collection_id WHERE T1.document_subset_id  =  (SELECT document_subset_id FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.document_object_id  =  T2.document_object_id JOIN Documents_in_Collections AS T3 ON T2.document_object_id  =  T3.document_object_id JOIN Collections AS T4 ON T3.collection_id  =  T4.collection_id WHERE T4.collection_name  =  "Best" AND T2.owner  =  "2000") AND T4.collection_name  =  "Best"
SELECT DISTINCT T1.document_object_id FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.document_object_id  =  T2.document_object_id JOIN Collections AS T3 ON T2.parent_document_object_id  =  T3.collection_id JOIN Documents_in_Collections AS T4 ON T3.collection_id  =  T4.collection_id WHERE T1.document_subset_id  =  (SELECT document_subset_id FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.document_object_id  =  T2.document_object_id JOIN Collections AS T3 ON T2.parent_document_object_id  =  T3.collection_id WHERE T3.collection_name  =  "Best") AND T4.collection_id  =  (SELECT collection_id FROM Collections WHERE Collection_Name  =  "Best")
SELECT T1.Document_Object_ID FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID JOIN Document_Subset_Members AS T3 ON T1.Document_Object_ID  =  T3.Document_Object_ID WHERE T2.Collection_Name  =  "Best" EXCEPT SELECT T1.Document_Object_ID FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID JOIN Document_Subset_Members AS T3 ON T1.Document_Object_ID  =  T3.Document_Object_ID WHERE T2.Collection_Name  =  "Best" AND T3.Document_Subset_ID  =  2000
SELECT document_object_id FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T2.collection_name  =  'Best' EXCEPT SELECT document_object_id FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.collection_id  =  T2.collection_id JOIN Collection_Subset_Members AS T3 ON T2.collection_id  =  T3.collection_id WHERE T3.collection_subset_id  =  'Best for 2000'
SELECT * FROM mytable;
SELECT DISTINCT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID WHERE T2.Document_Subset_Name  =  'Best for 2000' UNION SELECT T1.Document_Object_ID FROM Documents_in_Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  'Best'
SELECT T2.Collection_Name FROM Collection_Subset_Members AS T1 JOIN Collections AS T2 ON T1.Related_Collection_ID  =  T2.Collection_ID WHERE T1.Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name  =  "Best")
SELECT T2.Collection_Name FROM Collection_Subset_Members AS T1 JOIN Collections AS T2 ON T1.Related_Collection_ID  =  T2.Collection_ID WHERE T1.Collection_ID  =  (SELECT Collection_ID FROM Collections WHERE Collection_Name  =  "Best")
SELECT count(*) FROM Collection_Subset_Members AS T1 JOIN Collections AS T2 ON T1.Related_Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  "Best"
SELECT count(DISTINCT T2.Collection_ID) FROM Collection_Subset_Members AS T1 JOIN Collections AS T2 ON T1.Related_Collection_ID  =  T2.Collection_ID WHERE T1.Collection_Subset_ID  =  (SELECT Collection_Subset_ID FROM Collections WHERE Collection_Name  =  'Best')
SELECT T2.Collection_Subset_Name FROM `Collection_Subset_Members` AS T1 JOIN `Collection_Subsets` AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID JOIN `Collections` AS T3 ON T1.Collection_ID  =  T3.Collection_ID WHERE T3.Collection_Name  =  "Best"
SELECT T1.Collection_Subset_ID FROM Collection_Subset_Members AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  'Best'
SELECT count(*) FROM songs WHERE name LIKE "%Love%"
SELECT name FROM songs ORDER BY name ASC
SELECT name ,  language FROM songs
SELECT max(voice_sound_quality) ,  min(voice_sound_quality) FROM performance_score
SELECT voice_sound_quality ,  rhythm_tempo ,  stage_presence FROM performance_score AS T1 JOIN participants AS T2 ON T1.participant_id  =  T2.id WHERE T2.name  =  'Freeway'
SELECT id ,  language ,  original_artist FROM songs WHERE name != 'Love'
SELECT name ,  original_artist FROM songs WHERE english_translation  =  'All the streets of love'
SELECT DISTINCT T1.stage_presence FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id  =  T2.id WHERE T2.language  =  'English'
SELECT T1.id ,  T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id GROUP BY T1.id HAVING count(*)  >=  2
SELECT T1.id ,  T1.name ,  T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id GROUP BY T1.id ORDER BY count(*) DESC
SELECT T1.id ,  T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id WHERE T2.voice_sound_quality  =  5 OR T2.rhythm_tempo  =  5
SELECT voice_sound_quality FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id  =  T2.id WHERE T2.name  =  'The Balkan Girls' AND T2.language  =  'English'
SELECT T1.id ,  T2.name FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id  =  T2.id GROUP BY T1.songs_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM performance_score WHERE stage_presence  <  7 OR stage_presence  >  9
SELECT count(*) FROM songs WHERE id NOT IN (SELECT songs_id FROM performance_score)
SELECT avg(T2.rhythm_tempo) ,  T1.language FROM songs AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.songs_id GROUP BY T1.language
SELECT DISTINCT T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id JOIN songs AS T3 ON T2.songs_id  =  T3.id WHERE T3.language  =  'English'
SELECT T1.name ,  T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id JOIN songs AS T3 ON T2.songs_id  =  T3.id WHERE T3.language  =  'Croatian' INTERSECT SELECT T1.name ,  T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id JOIN songs AS T3 ON T2.songs_id  =  T3.id WHERE T3.language  =  'English'
SELECT name FROM songs WHERE name LIKE "%Is%"
SELECT T1.original_artist FROM songs AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.songs_id WHERE T2.rhythm_tempo  >  5 ORDER BY T2.voice_sound_quality DESC
SELECT count(*) FROM city
SELECT count(*) FROM city
SELECT DISTINCT state FROM city
SELECT DISTINCT state FROM city
SELECT count(DISTINCT country) FROM city
SELECT count(DISTINCT country) FROM city
SELECT city_name ,  city_code ,  state ,  country FROM city
SELECT city_name ,  city_code ,  state ,  country FROM city
SELECT latitude ,  longitude FROM city WHERE city_name  =  "Baltimore"
SELECT latitude ,  longitude FROM city WHERE city_name  =  "Baltimore"
SELECT city_name FROM city WHERE state  =  "PA"
SELECT city_name FROM city WHERE state  =  "PA"
SELECT count(*) FROM city WHERE country  =  "Canada"
SELECT count(*) FROM city WHERE country  =  "Canada"
SELECT city_name FROM city WHERE country  =  "USA" ORDER BY latitude
SELECT city_name FROM city WHERE country  =  "USA" ORDER BY latitude
SELECT state ,  count(*) FROM city GROUP BY state
SELECT state ,  count(*) FROM city GROUP BY state
SELECT country ,  count(*) FROM city GROUP BY country
SELECT count(*) ,  country FROM city GROUP BY country
SELECT state FROM city GROUP BY state HAVING count(*)  >=  2
SELECT state FROM city GROUP BY state HAVING count(*)  >=  2
SELECT state FROM city GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT state FROM city GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT country FROM city GROUP BY country ORDER BY count(*) LIMIT 1
SELECT country FROM city GROUP BY country ORDER BY count(*) LIMIT 1
SELECT fname ,  lname FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T2.state  =  "MD"
SELECT Fname ,  Lname FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T2.state  =  "MD"
SELECT count(*) FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.country  =  "China"
SELECT count(*) FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.country  =  "China"
SELECT fname ,  major FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T2.city_name  =  "Baltimore"
SELECT fname ,  major FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T2.city_name  =  "Baltimore"
SELECT count(*) ,  T1.country FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.country
SELECT count(*) ,  T1.country FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.country
SELECT count(*) ,  T1.city_name FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.city_name
SELECT count(*) ,  T1.city_name FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.city_name
SELECT T1.state FROM `city` AS T1 JOIN `student` AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state ORDER BY count(*) DESC LIMIT 1
SELECT T1.state FROM `city` AS T1 JOIN `student` AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state ORDER BY count(*) DESC LIMIT 1
SELECT T1.country FROM `city` AS T1 JOIN `student` AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.country ORDER BY count(*) LIMIT 1
SELECT country FROM city WHERE city_code IN (SELECT city_code FROM student) GROUP BY country ORDER BY count(*) LIMIT 1
SELECT T1.city_name FROM `City` AS T1 JOIN `Student` AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.city_name HAVING count(*)  >=  3
SELECT T1.city_name FROM `City` AS T1 JOIN `Student` AS T2 ON T1.city_code  =  T2.city_code GROUP BY T2.city_code HAVING count(*)  >=  3
SELECT state FROM City WHERE city_code IN (SELECT city_code FROM Student GROUP BY city_code HAVING count(*)  >  5)
SELECT state FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code GROUP BY state HAVING count(*)  >  5
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T2.country  =  "USA"
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T2.country  =  "USA"
SELECT StuID FROM Student WHERE Sex  =  'F' AND city_code IN (SELECT city_code FROM City WHERE state  =  'PA')
SELECT StuID FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.state  =  "PA" AND T2.sex  =  "F"
SELECT StuID FROM Student WHERE Sex  =  'M' EXCEPT SELECT StuID FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T2.country  =  'USA'
SELECT StuID FROM Student WHERE Sex  =  'M' EXCEPT SELECT StuID FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T2.country  =  'USA'
SELECT distance FROM direct_distance WHERE city1_code  =  "BAL" AND city2_code  =  "CHI"
SELECT distance FROM direct_distance WHERE city1_code  =  "BAL" AND city2_code  =  "CHI"
SELECT T1.distance FROM direct_distance AS T1 JOIN city AS T2 ON T1.city1_code  =  T2.city_code JOIN city AS T3 ON T1.city2_code  =  T3.city_code WHERE T2.city_name  =  "Boston" AND T3.city_name  =  "Newark"
SELECT distance FROM direct_distance AS T1 JOIN city AS T2 ON T1.city1_code  =  T2.city_code JOIN city AS T3 ON T1.city2_code  =  T3.city_code WHERE T2.city_name  =  "Boston" AND T3.city_name  =  "Newark"
SELECT avg(distance) ,  min(distance) ,  max(distance) FROM direct_distance
SELECT avg(distance) ,  min(distance) ,  max(distance) FROM direct_distance
SELECT city1_code ,  city2_code FROM direct_distance ORDER BY distance DESC LIMIT 2
SELECT city1_code FROM direct_distance GROUP BY city1_code ORDER BY max(distance) DESC LIMIT 1
SELECT city1_code ,  city2_code FROM direct_distance WHERE distance  >  (SELECT avg(distance) FROM direct_distance)
SELECT city1_code FROM direct_distance WHERE distance  >  (SELECT avg(distance) FROM direct_distance)
SELECT city1_code FROM direct_distance WHERE distance  <  1000 INTERSECT SELECT city2_code FROM direct_distance WHERE distance  <  1000
SELECT city1_code FROM direct_distance WHERE distance  <  1000 UNION SELECT city2_code FROM direct_distance WHERE distance  <  1000
SELECT sum(distance) FROM direct_distance WHERE city1_code  =  "BAL"
SELECT sum(distance) FROM direct_distance WHERE city1_code  =  "BAL"
SELECT avg(T1.distance) FROM direct_distance AS T1 JOIN city AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.city_name  =  "Boston"
SELECT avg(distance) FROM city AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code WHERE T1.city_name  =  "Boston"
SELECT T1.city_name FROM city AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code WHERE T2.distance  =  (SELECT min(distance) FROM direct_distance WHERE city2_code  =  "CHI")
SELECT T1.city_name FROM city AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code WHERE T2.city2_code  =  "CHI" ORDER BY T2.distance LIMIT 1
SELECT T1.city_name FROM city AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city2_code WHERE T2.distance  =  (SELECT max(distance) FROM direct_distance WHERE city1_code  =  'BOS')
SELECT t1.city_name FROM city AS t1 JOIN direct_distance AS t2 ON t1.city_code  =  t2.city1_code WHERE t2.city2_code  =  "BOS" ORDER BY t2.distance DESC LIMIT 1
SELECT city1_code ,  sum(distance) FROM direct_distance GROUP BY city1_code
SELECT T1.city_code ,  sum(T2.distance) FROM city AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code GROUP BY T1.city_code
SELECT T1.city_name ,  avg(T2.distance) FROM city AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code GROUP BY T1.city_name
SELECT T1.city_name ,  avg(T2.distance) FROM city AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code GROUP BY T1.city_name
SELECT T3.distance FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code JOIN direct_distance AS T3 ON T1.city_code  =  T3.city1_code WHERE T2.fname  =  "Linda" AND T2.lname  =  "Smith" INTERSECT SELECT T3.distance FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code JOIN direct_distance AS T3 ON T1.city_code  =  T3.city1_code WHERE T2.fname  =  "Tracy" AND T2.lname  =  "Kim"
SELECT T2.distance FROM city AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code JOIN student AS T3 ON T3.city_code  =  T1.city_code WHERE T3.fname  =  "Linda" AND T3.lname  =  "Smith" JOIN student AS T4 ON T4.city_code  =  T1.city_code WHERE T4.fname  =  "Tracy" AND T4.lname  =  "Kim"
SELECT T1.fname ,  T1.lname FROM student AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code WHERE T2.distance  =  (SELECT max(distance) FROM student AS T1 JOIN direct_distance AS T2 ON T1.city_code  =  T2.city1_code WHERE T1.fname  =  "Linda" AND T1.lname  =  "Smith")
SELECT T2.fname ,  T2.lname FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code JOIN direct_distance AS T3 ON T1.city_code  =  T3.city1_code JOIN city AS T4 ON T4.city_code  =  T3.city2_code WHERE T2.fname  =  "Linda" AND T2.lname  =  "Smith" ORDER BY T3.distance DESC LIMIT 1
SELECT T1.state FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code WHERE T2.Fname  =  "Linda"
SELECT T1.state FROM city AS T1 JOIN student AS T2 ON T1.city_code  =  T2.city_code WHERE T2.Fname  =  "Linda"
SELECT * FROM Sailors WHERE age  >  30
SELECT name FROM Sailors WHERE age  >  30
SELECT name ,  age FROM Sailors WHERE age  <  30
SELECT name ,  age FROM Sailors WHERE age  <  30
SELECT T2.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T1.sid  =  1
SELECT DISTINCT bid FROM Reserves WHERE sid  =  1
SELECT sid FROM Reserves WHERE bid  =  102
SELECT T2.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid WHERE T1.bid  =  102
SELECT DISTINCT bid FROM Reserves
SELECT DISTINCT bid FROM Reserves
SELECT name FROM sailors WHERE name LIKE '%e%'
SELECT name FROM sailors WHERE name LIKE '%e%'
SELECT DISTINCT sid FROM Sailors WHERE age  >  (SELECT max(age) FROM Sailors)
SELECT DISTINCT sid FROM sailors WHERE age != (SELECT min(age) FROM sailors)
SELECT DISTINCT name FROM sailors WHERE age  >  (SELECT max(age) FROM sailors WHERE rating  >  7)
SELECT DISTINCT name FROM sailors WHERE age  >  (SELECT min(age) FROM sailors WHERE rating  >  7)
SELECT DISTINCT T2.name ,  T1.sid FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid
SELECT DISTINCT T2.name ,  T1.sid FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid
SELECT T1.sid ,  T1.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid GROUP BY T1.sid HAVING count(*)  >  1
SELECT T2.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid GROUP BY T1.sid HAVING count(*)  >=  2
SELECT DISTINCT sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'red' OR T2.color  =  'blue'
SELECT DISTINCT sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'red' OR T2.color  =  'blue'
SELECT T3.name ,  T3.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'red' OR T2.color  =  'blue'
SELECT T3.name ,  T3.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'red' OR T2.color  =  'blue'
SELECT T1.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'red' INTERSECT SELECT T1.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'blue'
SELECT DISTINCT sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'red' INTERSECT SELECT DISTINCT sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'blue'
SELECT T3.name ,  T3.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'red' INTERSECT SELECT T3.name ,  T3.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'blue'
SELECT T3.name ,  T3.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'red' INTERSECT SELECT T3.name ,  T3.sid FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'blue'
SELECT sid FROM sailors EXCEPT SELECT sid FROM Reserves
SELECT sid FROM sailors EXCEPT SELECT sid FROM Reserves
SELECT name ,  sid FROM sailors EXCEPT SELECT T1.name ,  T1.sid FROM sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid
SELECT name ,  sid FROM sailors EXCEPT SELECT T1.name ,  T1.sid FROM sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid
SELECT sid FROM sailors EXCEPT SELECT sid FROM Reserves
SELECT sid FROM sailors EXCEPT SELECT sid FROM Reserves
SELECT T2.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid WHERE T1.bid  =  103
SELECT T2.name FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid WHERE T1.bid  =  103
SELECT name FROM sailors WHERE rating  >  (SELECT max(rating) FROM sailors WHERE name  =  'Luis')
SELECT name FROM sailors WHERE rating  >  (SELECT max(rating) FROM sailors WHERE name  =  'Luis')
SELECT name FROM sailors WHERE rating  >  (SELECT max(rating) FROM sailors WHERE name  =  'Luis')
SELECT name FROM sailors WHERE rating  >  (SELECT max(rating) FROM sailors WHERE name  =  'Luis')
SELECT T2.name ,  T1.bid FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid WHERE T2.rating  >  2
SELECT T2.name ,  T1.sid FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid  =  T2.sid WHERE T2.rating  >=  3
SELECT name ,  age FROM Sailors ORDER BY age DESC LIMIT 1
SELECT name ,  age FROM Sailors ORDER BY age DESC LIMIT 1
SELECT count(*) FROM Sailors
SELECT count(*) FROM Sailors
SELECT avg(age) FROM Sailors WHERE rating  =  7
SELECT avg(age) FROM Sailors WHERE rating  =  7
SELECT count(*) FROM sailors WHERE name LIKE 'D%'
SELECT count(*) FROM sailors WHERE name LIKE 'D%'
SELECT avg(rating) ,  max(age) FROM Sailors
SELECT avg(rating) ,  max(age) FROM Sailors
SELECT count(*) ,  bid FROM Reserves GROUP BY bid
SELECT count(*) ,  bid FROM Reserves GROUP BY bid
SELECT count(*) ,  bid FROM Reserves WHERE bid  >  50 GROUP BY bid
SELECT count(*) ,  bid FROM Reserves WHERE bid  >  50 GROUP BY bid
SELECT count(*) ,  bid FROM Reserves GROUP BY bid HAVING count(*)  >  1
SELECT count(*) ,  T1.bid FROM Reserves AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid WHERE T1.day  >  T2.day GROUP BY T1.bid HAVING count(*)  >  1
SELECT count(*) ,  bid FROM Reserves WHERE sid  >  1 GROUP BY bid
SELECT count(*) ,  bid FROM Reserves WHERE sid  >  1 GROUP BY bid
SELECT T3.rating ,  avg(T2.age) FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'red' GROUP BY T3.rating
SELECT T3.rating ,  avg(T2.age) FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.color  =  'red' GROUP BY T3.rating
SELECT name ,  rating ,  age FROM Sailors ORDER BY rating ,  age
SELECT name ,  rating ,  age FROM Sailors ORDER BY rating ,  age
SELECT count(*) FROM Boats
SELECT count(*) FROM Boats
SELECT count(*) FROM Boats WHERE color  =  'red'
SELECT count(*) FROM Boats WHERE color  =  'red'
SELECT T2.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T3.age  >=  20 AND T3.age  <=  30
SELECT T2.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T3.age  >=  20 AND T3.age  <=  30
SELECT name FROM sailors WHERE rating  >  (SELECT max(T1.rating) FROM reserves AS T1 JOIN boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'red')
SELECT name FROM sailors WHERE rating  >  (SELECT max(T1.rating) FROM reserves AS T1 JOIN boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  =  'red')
SELECT max(rating) FROM Sailors
SELECT max(rating) FROM Sailors
SELECT T3.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.name  =  'Melon'
SELECT T3.name FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T1.sid  =  T3.sid WHERE T2.name  =  'Melon'
SELECT name ,  age FROM Sailors ORDER BY rating DESC
SELECT name ,  age FROM Sailors ORDER BY rating DESC
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1
SELECT Model FROM headphone ORDER BY Model ASC
SELECT DISTINCT Model FROM headphone ORDER BY Model ASC
SELECT CLASS FROM headphone GROUP BY CLASS ORDER BY count(*) DESC LIMIT 1
SELECT CLASS FROM headphone GROUP BY CLASS ORDER BY count(*) DESC LIMIT 1
SELECT CLASS FROM headphone GROUP BY CLASS HAVING count(*)  >  2
SELECT CLASS FROM headphone GROUP BY CLASS HAVING count(*)  <=  2
SELECT CLASS ,  count(*) FROM headphone WHERE price  >  200 GROUP BY CLASS
SELECT count(*) ,  CLASS FROM headphone WHERE price  >  200 GROUP BY CLASS
SELECT count(DISTINCT Earpads) FROM headphone
SELECT count(DISTINCT Earpads) FROM headphone
SELECT Earpads FROM headphone GROUP BY Earpads ORDER BY count(*) DESC LIMIT 2
SELECT Earpads FROM headphone GROUP BY Earpads ORDER BY count(*) DESC LIMIT 2
SELECT Model ,  CLASS ,  Construction FROM headphone ORDER BY Price LIMIT 1
SELECT model ,  CLASS ,  construction FROM headphone ORDER BY price LIMIT 1
SELECT avg(Price) ,  Construction FROM headphone GROUP BY Construction
SELECT avg(Price) ,  Construction FROM headphone GROUP BY Construction
SELECT CLASS FROM headphone WHERE Earpads  =  "Bowls" INTERSECT SELECT CLASS FROM headphone WHERE Earpads  =  "Comfort Pads"
SELECT CLASS FROM headphone WHERE Earpads  =  "Bowls" INTERSECT SELECT CLASS FROM headphone WHERE Earpads  =  "Comfort Pads"
SELECT Earpads FROM headphone WHERE Construction != "Plastic"
SELECT Earpads FROM headphone WHERE Construction != "Plastic"
SELECT Model FROM headphone WHERE Price  <  (SELECT avg(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price  <  (SELECT avg(Price) FROM headphone)
SELECT name FROM store ORDER BY date_opened
SELECT name FROM store ORDER BY date_opened
SELECT name ,  parking FROM store WHERE neighborhood  =  "Tarzana"
SELECT name ,  parking FROM store WHERE neighborhood  =  "Tarzana"
SELECT count(DISTINCT Neighborhood) FROM store
SELECT count(DISTINCT Neighborhood) FROM store
SELECT Neighborhood ,  count(*) FROM store GROUP BY Neighborhood
SELECT Neighborhood ,  count(*) FROM store GROUP BY Neighborhood
SELECT T3.name ,  count(*) FROM stock AS T1 JOIN headphone AS T2 ON T1.headphone_id  =  T2.headphone_id JOIN store AS T3 ON T1.store_id  =  T3.store_id GROUP BY T3.name ORDER BY count(*) DESC LIMIT 1
SELECT T2.name ,  sum(T1.quantity) FROM stock AS T1 JOIN store AS T2 ON T1.store_id  =  T2.store_id JOIN headphone AS T3 ON T1.headphone_id  =  T3.headphone_id GROUP BY T1.store_id
SELECT Name FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT name FROM store WHERE store_id NOT IN (SELECT store_id FROM stock)
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT T2.Model FROM `stock` AS T1 JOIN `headphone` AS T2 ON T1.Headphone_ID  =  T2.Headphone_ID GROUP BY T1.Headphone_ID ORDER BY sum(T1.Quantity) DESC LIMIT 1
SELECT T2.model FROM stock AS T1 JOIN headphone AS T2 ON T1.headphone_id  =  T2.headphone_id GROUP BY T1.headphone_id ORDER BY sum(T1.quantity) DESC LIMIT 1
SELECT T2.Model FROM stock AS T1 JOIN headphone AS T2 ON T1.Headphone_ID  =  T2.Headphone_ID JOIN store AS T3 ON T1.Store_ID  =  T3.Store_ID WHERE T3.Name  =  "Woodman"
SELECT sum(T1.quantity) FROM stock AS T1 JOIN headphone AS T2 ON T1.headphone_id  =  T2.headphone_id JOIN store AS T3 ON T1.store_id  =  T3.store_id WHERE T3.name  =  "Woodman"
SELECT Neighborhood FROM `store` WHERE Store_ID NOT IN (SELECT Store_ID FROM `stock`)
SELECT Neighborhood FROM `store` WHERE Store_ID NOT IN (SELECT Store_ID FROM `stock`)
SELECT count(*) FROM Author
SELECT count(*) FROM Author
SELECT count(*) FROM paper
SELECT count(*) FROM paper
SELECT count(*) FROM Affiliation
SELECT count(*) FROM Affiliation
SELECT count(*) FROM paper WHERE venue  =  "NAACL" AND YEAR  =  2000
SELECT count(*) FROM paper WHERE venue  =  "NAACL" AND YEAR  =  2000
SELECT DISTINCT COUNT ( t3.paper_id ) FROM `affiliation` AS t1 JOIN `author_list` AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University" AND t3.year  =  2009
SELECT DISTINCT COUNT ( t3.paper_id ) FROM `Affiliation` AS t1 JOIN `Author_list` AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN `Paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University" AND t3.year  =  2009
SELECT name ,  address FROM Affiliation
SELECT name ,  address FROM Affiliation
SELECT venue ,  YEAR FROM paper ORDER BY YEAR
SELECT DISTINCT venue FROM paper ORDER BY YEAR
SELECT DISTINCT t1.title ,  t1.paper_id FROM `paper` AS t1 JOIN `author_list` AS t2 ON t1.paper_id  =  t2.paper_id JOIN `affiliation` AS t3 ON t2.affiliation_id  =  t3.affiliation_id WHERE t3.name  =  "Harvard University"
SELECT DISTINCT t1.title ,  t1.paper_id FROM paper AS t1 JOIN author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN affiliation AS t3 ON t2.affiliation_id  =  t3.affiliation_id WHERE t3.name  =  "Harvard University"
SELECT DISTINCT t3.paper_id ,  t3.title FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Mckeown"
SELECT t3.title ,  t3.paper_id FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Mckeown"
SELECT DISTINCT t3.paper_id ,  t3.title FROM author_list AS t2 JOIN affiliation AS t1 ON t2.affiliation_id  =  t1.affiliation_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Stanford University" INTERSECT SELECT DISTINCT t3.paper_id ,  t3.title FROM author_list AS t2 JOIN affiliation AS t1 ON t2.affiliation_id  =  t1.affiliation_id JOIN paper AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Columbia University"
SELECT DISTINCT t1.title ,  t1.paper_id FROM paper AS t1 JOIN author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN affiliation AS t3 ON t2.affiliation_id  =  t3.affiliation_id WHERE t3.name  =  "Stanford University" INTERSECT SELECT DISTINCT t1.title ,  t1.paper_id FROM paper AS t1 JOIN author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN affiliation AS t3 ON t2.affiliation_id  =  t3.affiliation_id WHERE t3.name  =  "Columbia University"
SELECT DISTINCT t3.paper_id ,  t3.title FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Mckeown, Kathleen" INTERSECT SELECT DISTINCT t3.paper_id ,  t3.title FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Rambow, Owen"
SELECT t3.title ,  t3.paper_id FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Mckeown, Kathleen" INTERSECT SELECT t3.title ,  t3.paper_id FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Rambow, Owen"
SELECT DISTINCT t3.paper_id ,  t3.title FROM `author_list` AS t2 JOIN `author` AS t1 ON t2.author_id  =  t1.author_id JOIN `paper` AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "McKeown" EXCEPT SELECT DISTINCT t3.paper_id ,  t3.title FROM `author_list` AS t2 JOIN `author` AS t1 ON t2.author_id  =  t1.author_id JOIN `paper` AS t3 ON t3.paper_id  =  t2.paper_id WHERE t1.name  =  "Rambow"
SELECT t3.title ,  t3.paper_id FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "McKeown" EXCEPT SELECT t3.title ,  t3.paper_id FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Rambow"
SELECT DISTINCT t3.paper_id ,  t3.title FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "McKeown" OR t1.name  =  "Rambow"
SELECT DISTINCT t3.title ,  t3.paper_id FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "McKeown, Kathleen" OR t1.name  =  "Rambow, Owen"
SELECT T1.name ,  count(*) FROM `Author` AS T1 JOIN `Author_list` AS T2 ON T1.author_id  =  T2.author_id GROUP BY T1.name ORDER BY count(*) DESC
SELECT count(*) ,  T2.name FROM Author_list AS T1 JOIN Author AS T2 ON T1.author_id  =  T2.author_id GROUP BY T2.name ORDER BY count(*) DESC
SELECT T1.name FROM `Affiliation` AS T1 JOIN `Author_list` AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T1.name ORDER BY count(*) ASC
SELECT T1.name FROM `Affiliation` AS T1 JOIN `Author_list` AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T1.name ORDER BY count(*) DESC
SELECT t1.name FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id GROUP BY t1.name HAVING count(*)  >  50
SELECT t1.name FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id GROUP BY t1.name HAVING count(*)  >  50
SELECT t1.name FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id GROUP BY t1.name HAVING count(*)  =  1
SELECT t1.name FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id GROUP BY t1.name HAVING count(*)  =  1
SELECT venue ,  YEAR FROM paper GROUP BY venue ,  YEAR ORDER BY count(*) DESC LIMIT 1
SELECT venue ,  YEAR FROM paper GROUP BY venue ,  YEAR ORDER BY count(*) DESC LIMIT 1
SELECT venue FROM paper GROUP BY venue ORDER BY count(*) LIMIT 1
SELECT venue FROM paper GROUP BY venue ORDER BY count(*) LIMIT 1
SELECT DISTINCT COUNT ( DISTINCT t1.paper_id ) FROM Citation AS t1 JOIN Citation AS t2 ON t1.cited_paper_id  =  t2.paper_id WHERE t2.cited_paper_id  =  "A00-1002"
SELECT COUNT ( DISTINCT paper_id ) FROM Citation WHERE cited_paper_id  =  "A00-1002"
SELECT COUNT ( DISTINCT cited_paper_id ) FROM Citation WHERE paper_id  =  "D12-1027"
SELECT COUNT ( DISTINCT cited_paper_id ) FROM Citation WHERE paper_id  =  "D12-1027"
SELECT t1.paper_id ,  count(*) FROM paper AS t1 JOIN citation AS t2 ON t1.paper_id  =  t2.cited_paper_id GROUP BY t1.paper_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.paper_id ,  count(*) FROM paper AS T1 JOIN citation AS T2 ON T1.paper_id  =  T2.cited_paper_id GROUP BY T1.paper_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.title FROM `paper` AS t1 JOIN `citation` AS t2 ON t1.paper_id  =  t2.paper_id GROUP BY t2.cited_paper_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.title FROM `paper` AS t1 JOIN `citation` AS t2 ON t1.paper_id  =  t2.paper_id GROUP BY t2.cited_paper_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.paper_id ,  count(*) FROM paper AS t1 JOIN citation AS t2 ON t1.paper_id  =  t2.cited_paper_id GROUP BY t1.paper_id ORDER BY count(*) DESC LIMIT 10
SELECT DISTINCT t1.paper_id  ,  COUNT ( t2.cited_paper_id ) FROM `paper` AS t1 JOIN `citation` AS t2 ON t1.paper_id  =  t2.cited_paper_id GROUP BY t1.paper_id ORDER BY COUNT ( t2.cited_paper_id ) DESC LIMIT 10
SELECT DISTINCT COUNT ( t3.cited_paper_id ) FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `citation` AS t3 ON t2.paper_id  =  t3.cited_paper_id WHERE t1.name  =  "McKeown , Kathleen"
SELECT DISTINCT COUNT ( t3.cited_paper_id ) FROM `Citation` AS t3 JOIN `Author` AS t1 ON t3.paper_id  =  t1.author_id JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id WHERE t2.paper_id  =  "D15-1001" AND t1.name  =  "McKeown , Kathleen"
SELECT DISTINCT COUNT ( t3.cited_paper_id ) FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `citation` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "McKeown" AND t1.email  =  "kathleen@cs.cmu.edu"
SELECT DISTINCT COUNT ( t3.cited_paper_id ) FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `citation` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "McKeown , Kathleen"
SELECT t1.name ,  count(*) FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `citation` AS t3 ON t2.paper_id  =  t3.cited_paper_id GROUP BY t1.name ORDER BY count(*) DESC LIMIT 1
SELECT t1.name ,  count(*) FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `citation` AS t3 ON t2.paper_id  =  t3.cited_paper_id GROUP BY t1.name ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT t3.venue ,  t3.year FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Mckeown , Kathleen"
SELECT DISTINCT t3.venue ,  t3.year FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Mckeown , Kathleen"
SELECT DISTINCT t3.venue ,  t3.year FROM `Affiliation` AS t1 JOIN `Author_list` AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN `Paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University"
SELECT DISTINCT t3.venue ,  t3.year FROM `Affiliation` AS t1 JOIN `Author_list` AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN `Paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University"
SELECT t1.author_id FROM `paper` AS t2 JOIN `author_list` AS t1 ON t2.paper_id  =  t1.paper_id WHERE t2.year  =  2009 GROUP BY t1.author_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.name FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t3.year  =  2009 GROUP BY t1.name ORDER BY count(*) DESC LIMIT 1
SELECT t3.name FROM `paper` AS t1 JOIN `author_list` AS t2 ON t1.paper_id  =  t2.paper_id JOIN `affiliation` AS t3 ON t2.affiliation_id  =  t3.affiliation_id WHERE t1.year  =  2009 GROUP BY t3.name ORDER BY count(*) DESC LIMIT 3
SELECT t3.name FROM `paper` AS t1 JOIN `author_list` AS t2 ON t1.paper_id  =  t2.paper_id JOIN `affiliation` AS t3 ON t2.affiliation_id  =  t3.affiliation_id WHERE t1.year  =  2009 GROUP BY t3.name ORDER BY count(*) DESC LIMIT 3
SELECT DISTINCT COUNT ( t3.paper_id ) FROM `Affiliation` AS t1 JOIN `Author_list` AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN `Paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University" AND t3.year  <=  2009
SELECT DISTINCT COUNT ( t3.paper_id ) FROM `Affiliation` AS t1 JOIN `Author_list` AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN `Paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Columbia University" AND t3.year  <=  2009
SELECT DISTINCT COUNT ( t3.paper_id ) FROM `Affiliation` AS t1 JOIN `Author_list` AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN `Paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Stanford University" AND t3.year  >=  2000 AND t3.year  <=  2009
SELECT DISTINCT COUNT ( t3.paper_id ) FROM `Affiliation` AS t1 JOIN `Author_list` AS t2 ON t1.affiliation_id  =  t2.affiliation_id JOIN `Paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "Stanford University" AND t3.year  >=  2000 AND t3.year  <=  2009
SELECT t1.title FROM `paper` AS t1 JOIN `author_list` AS t2 ON t1.paper_id  =  t2.paper_id GROUP BY t1.paper_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.title FROM `paper` AS t1 JOIN `author_list` AS t2 ON t1.paper_id  =  t2.paper_id GROUP BY t1.paper_id ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT COUNT ( t3.author_id ) FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t1.name  =  "McKeown , Kathleen"
SELECT count(*) FROM `author` AS T1 JOIN `author_list` AS T2 ON T1.author_id  =  T2.author_id WHERE T2.paper_id IN (SELECT paper_id FROM `author_list` AS T3 JOIN `author` AS T4 ON T3.author_id  =  T4.author_id WHERE T4.name  =  "McKeown , Kathleen") AND T1.name != "McKeown , Kathleen"
SELECT DISTINCT COUNT ( t3.paper_id )  ,  t1.name FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id JOIN `author_list` AS t4 ON t3.paper_id  =  t4.paper_id JOIN `author` AS t5 ON t4.author_id  =  t5.author_id WHERE t5.name  =  "McKeown , Kathleen" GROUP BY t1.name ORDER BY COUNT ( t3.paper_id ) DESC
SELECT t1.name FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t3.paper_id  =  t2.paper_id JOIN `author` AS t4 ON t4.author_id  =  t2.author_id WHERE t4.name  =  "McKeown , Kathleen" GROUP BY t1.name ORDER BY count(*) DESC LIMIT 1
SELECT paper_id FROM paper WHERE title LIKE '%translation%'
SELECT paper_id FROM paper WHERE title LIKE "%translation%"
SELECT paper_id ,  title FROM paper WHERE paper_id NOT IN (SELECT paper_id FROM citation)
SELECT paper_id ,  title FROM paper WHERE paper_id NOT IN (SELECT paper_id FROM citation)
SELECT T1.name FROM `Affiliation` AS T1 JOIN `Author_list` AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T1.name HAVING T1.address LIKE '%China%' ORDER BY count(*) DESC LIMIT 1
SELECT t1.name FROM `affiliation` AS t1 JOIN `author_list` AS t2 ON t1.affiliation_id  =  t2.affiliation_id GROUP BY t1.name HAVING t1.address LIKE '%China%' ORDER BY count(*) DESC LIMIT 1
SELECT venue ,  YEAR ,  count(*) FROM paper GROUP BY venue ,  YEAR
SELECT venue ,  YEAR ,  count(*) FROM paper GROUP BY venue ,  YEAR
SELECT T1.name ,  count(*) FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T1.name
SELECT T1.name ,  count(*) FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T1.name
SELECT DISTINCT t1.title FROM `paper` AS t1 JOIN `citation` AS t2 ON t1.paper_id  =  t2.cited_paper_id GROUP BY t2.cited_paper_id HAVING COUNT ( DISTINCT t2.paper_id )  >  50
SELECT DISTINCT t1.title FROM `paper` AS t1 JOIN `citation` AS t2 ON t1.paper_id  =  t2.cited_paper_id GROUP BY t2.cited_paper_id HAVING count(*)  >  50
SELECT count(*) FROM author WHERE author_id NOT IN (SELECT DISTINCT t1.author_id FROM author_list AS t2 JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id JOIN citation AS t4 ON t3.paper_id  =  t4.cited_paper_id GROUP BY t2.author_id HAVING count(*)  >  50)
SELECT count(*) FROM author WHERE author_id NOT IN (SELECT DISTINCT t1.author_id FROM author_list AS t2 JOIN paper AS t3 ON t2.paper_id  =  t3.paper_id JOIN citation AS t4 ON t3.paper_id  =  t4.cited_paper_id GROUP BY t2.author_id HAVING count(*)  >  50)
SELECT t1.name FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t3.venue  =  "NAACL" AND t3.year  =  2009 UNION SELECT t1.name FROM `author` AS t1 JOIN `author_list` AS t2 ON t1.author_id  =  t2.author_id JOIN `paper` AS t3 ON t2.paper_id  =  t3.paper_id WHERE t3.venue  =  "ACL" AND t3.year  =  2009
SELECT t3.name FROM `paper` AS t1 JOIN `author_list` AS t2 ON t1.paper_id  =  t2.paper_id JOIN `author` AS t3 ON t2.author_id  =  t3.author_id WHERE t1.venue  =  "NAACL" AND t1.year  =  2009 INTERSECT SELECT t3.name FROM `paper` AS t1 JOIN `author_list` AS t2 ON t1.paper_id  =  t2.paper_id JOIN `author` AS t3 ON t2.author_id  =  t3.author_id WHERE t1.venue  =  "ACL" AND t1.year  =  2009
SELECT name FROM author WHERE author_id NOT IN (SELECT DISTINCT author_id FROM author_list AS T1 JOIN paper AS T2 ON T1.paper_id  =  T2.paper_id WHERE T2.venue  =  "ACL")
SELECT name FROM author WHERE author_id NOT IN (SELECT DISTINCT author_id FROM author_list AS T1 JOIN paper AS T2 ON T1.paper_id  =  T2.paper_id WHERE T2.venue  =  "ACL")
SELECT count(*) FROM conference
SELECT count(*) FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT conference_name ,  YEAR ,  LOCATION FROM conference
SELECT conference_name ,  YEAR ,  LOCATION FROM conference
SELECT conference_name ,  count(*) FROM conference GROUP BY conference_name
SELECT Conference_Name ,  count(*) FROM conference GROUP BY Conference_Name
SELECT YEAR ,  count(*) FROM conference GROUP BY YEAR
SELECT count(*) ,  YEAR FROM conference GROUP BY YEAR
SELECT YEAR FROM conference GROUP BY YEAR ORDER BY count(*) ASC LIMIT 1
SELECT YEAR FROM conference GROUP BY YEAR ORDER BY count(*) LIMIT 1
SELECT LOCATION FROM conference GROUP BY LOCATION HAVING count(*)  >=  2
SELECT LOCATION FROM conference GROUP BY LOCATION HAVING COUNT(*)  >=  2
SELECT institution_name ,  LOCATION ,  founded FROM institution
SELECT institution_name ,  LOCATION ,  founded FROM institution
SELECT count(*) FROM institution WHERE founded BETWEEN 1850 AND 1900
SELECT count(*) FROM institution WHERE founded BETWEEN 1850 AND 1900
SELECT institution_name ,  LOCATION FROM institution ORDER BY founded DESC LIMIT 1
SELECT institution_name ,  LOCATION FROM institution ORDER BY founded DESC LIMIT 1
SELECT T1.institution_name ,  count(*) FROM institution AS T1 JOIN staff AS T2 ON T1.institution_id  =  T2.institution_id WHERE T1.founded  >  1800 GROUP BY T1.institution_name
SELECT T1.name FROM staff AS T1 JOIN institution AS T2 ON T1.institution_id  =  T2.institution_id WHERE T2.founded  >  1800 GROUP BY T1.institution_id
SELECT institution_name FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM staff)
SELECT institution_name FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM staff)
SELECT name FROM staff WHERE age  >  (SELECT avg(age) FROM staff)
SELECT name FROM staff WHERE age  >  (SELECT avg(age) FROM staff)
SELECT max(Age) ,  min(Age) FROM staff WHERE Nationality  =  "United States"
SELECT max(Age) ,  min(Age) FROM staff
SELECT t2.conference_name FROM conference_participation AS t1 JOIN conference AS t2 ON t1.conference_id  =  t2.conference_id JOIN staff AS t3 ON t1.staff_id  =  t3.staff_id WHERE t3.nationality  =  "Canada"
SELECT T2.Conference_Name FROM `conference_participation` AS T1 JOIN `conference` AS T2 ON T1.Conference_ID  =  T2.Conference_ID JOIN `staff` AS T3 ON T1.staff_ID  =  T3.staff_ID WHERE T3.Nationality  =  "Canada"
SELECT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_id  =  T2.staff_id WHERE T1.role  =  'Speaker' INTERSECT SELECT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_id  =  T2.staff_id WHERE T1.role  =  'Sponsor'
SELECT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_id  =  T2.staff_id WHERE T1.role  =  'Speaker' INTERSECT SELECT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_id  =  T2.staff_id WHERE T1.role  =  'Sponsor'
SELECT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_id  =  T2.staff_id JOIN conference AS T3 ON T1.conference_id  =  T3.conference_id WHERE T3.conference_name  =  "ACL" INTERSECT SELECT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_id  =  T2.staff_id JOIN conference AS T3 ON T1.conference_id  =  T3.conference_id WHERE T3.conference_name  =  "Naccl"
SELECT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_id  =  T2.staff_id JOIN conference AS T3 ON T1.conference_id  =  T3.conference_id WHERE T3.conference_name  =  "ACL" INTERSECT SELECT T2.name FROM conference_participation AS T1 JOIN staff AS T2 ON T1.staff_id  =  T2.staff_id JOIN conference AS T3 ON T1.conference_id  =  T3.conference_id WHERE T3.conference_name  =  "Naccl"
SELECT T2.name FROM `conference_participation` AS T1 JOIN `staff` AS T2 ON T1.staff_ID  =  T2.staff_ID JOIN `conference` AS T3 ON T1.Conference_ID  =  T3.Conference_ID WHERE T3.year  =  2003 OR T3.year  =  2004
SELECT T3.name FROM `conference` AS T1 JOIN `conference_participation` AS T2 ON T1.conference_id  =  T2.conference_id JOIN `staff` AS T3 ON T2.staff_id  =  T3.staff_id WHERE T1.year  =  2003 OR T1.year  =  2004
SELECT T2.conference_name ,  T2.year ,  count(*) FROM conference_participation AS T1 JOIN conference AS T2 ON T1.conference_id  =  T2.conference_id GROUP BY T1.conference_id
SELECT T1.conference_name ,  T1.year ,  count(*) FROM conference AS T1 JOIN conference_participation AS T2 ON T1.conference_id  =  T2.conference_id GROUP BY T1.conference_id
SELECT T2.conference_name FROM conference_participation AS T1 JOIN conference AS T2 ON T1.conference_id  =  T2.conference_id GROUP BY T1.conference_id ORDER BY count(*) DESC LIMIT 2
SELECT T2.conference_name FROM conference_participation AS T1 JOIN conference AS T2 ON T1.conference_id  =  T2.conference_id GROUP BY T1.conference_id ORDER BY count(*) DESC LIMIT 2
SELECT name ,  Nationality FROM staff WHERE staff_ID NOT IN (SELECT staff_ID FROM conference_participation AS T1 JOIN conference AS T2 ON T1.Conference_ID  =  T2.Conference_ID WHERE T2.Conference_Name  =  "ACL")
SELECT name ,  Nationality FROM staff WHERE staff_ID NOT IN (SELECT staff_ID FROM conference_participation AS T1 JOIN conference AS T2 ON T1.Conference_ID  =  T2.Conference_ID WHERE T2.Conference_Name  =  "ACL")
SELECT institution_name ,  LOCATION FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM conference_participation AS T1 JOIN conference AS T2 ON T1.conference_id  =  T2.conference_id WHERE T2.year  =  2004)
SELECT institution_name ,  LOCATION FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM conference_participation AS T1 JOIN conference AS T2 ON T1.conference_id  =  T2.conference_id WHERE T2.year  =  2004)
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM PilotSkills WHERE age  <  (SELECT avg(age) FROM PilotSkills) ORDER BY age
SELECT pilot_name FROM PilotSkills WHERE age  <  (SELECT avg(age) FROM PilotSkills) ORDER BY age ASC
SELECT * FROM PilotSkills WHERE age  <  30
SELECT * FROM PilotSkills WHERE age  <  30
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" AND age  <  35
SELECT pilot_name FROM PilotSkills WHERE age  <  35 AND plane_name  =  "Piper Cub"
SELECT location FROM Hangar WHERE plane_name  =  "F-14 Fighter"
SELECT LOCATION FROM Hangar WHERE plane_name  =  "F-14 Fighter"
SELECT count(DISTINCT LOCATION) FROM Hangar
SELECT count(DISTINCT LOCATION) FROM Hangar
SELECT plane_name FROM PilotSkills WHERE pilot_name  =  "Jones" AND age  =  32
SELECT plane_name FROM PilotSkills WHERE pilot_name  =  "Jones" AND age  =  32
SELECT count(*) FROM PilotSkills WHERE age  >  40
SELECT count(*) FROM PilotSkills WHERE age  >  40
SELECT count(*) FROM pilotskills WHERE plane_name  =  "B-52 Bomber" AND age  <  35
SELECT count(*) FROM pilotSkills WHERE plane_name  =  "B-52 Bomber" AND age  <  35
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" ORDER BY age LIMIT 1
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" ORDER BY age LIMIT 1
SELECT plane_name FROM pilotSkills GROUP BY plane_name ORDER BY count(*) DESC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY count(*) DESC LIMIT 1
SELECT plane_name FROM hangar ORDER BY LOCATION LIMIT 1
SELECT plane_name FROM pilotSkills GROUP BY plane_name ORDER BY count(*) LIMIT 1
SELECT count(*) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Chicago'
SELECT count(*) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Chicago'
SELECT plane_name FROM PilotSkills WHERE pilot_name  =  "Smith" AND age  =  41
SELECT plane_name FROM PilotSkills WHERE pilot_name  =  "Smith" AND age  =  41
SELECT count(DISTINCT plane_name) FROM PilotSkills
SELECT count(DISTINCT plane_name) FROM PilotSkills
SELECT count(*) FROM PilotSkills WHERE pilot_name  =  "Smith"
SELECT count(*) FROM PilotSkills WHERE pilot_name  =  "Smith"
SELECT count(DISTINCT plane_name) FROM pilotSkills WHERE age  >  40
SELECT count(*) FROM PilotSkills WHERE age  >  40
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT location FROM Hangar ORDER BY plane_name
SELECT location FROM Hangar ORDER BY plane_name
SELECT DISTINCT plane_name FROM pilotSkills ORDER BY plane_name
SELECT DISTINCT plane_name FROM Hangar ORDER BY plane_name ASC
SELECT count(*) FROM PilotSkills WHERE age  >  40 OR age  <  30
SELECT count(*) FROM PilotSkills WHERE age  >  40 OR age  <  30
SELECT pilot_name ,  age FROM PilotSkills WHERE plane_name  =  "Piper Cub" AND age  >  35 UNION SELECT pilot_name ,  age FROM PilotSkills WHERE plane_name  =  "F-14 Fighter" AND age  <  30
SELECT pilot_name ,  age FROM PilotSkills WHERE plane_name  =  "Piper Cub" AND age  >  35 UNION SELECT pilot_name ,  age FROM PilotSkills WHERE plane_name  =  "F-14 Fighter" AND age  <  30
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" EXCEPT SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "B-52 Bomber"
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" EXCEPT SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "B-52 Bomber"
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "B-52 Bomber"
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "B-52 Bomber"
SELECT avg(age) ,  min(age) FROM PilotSkills
SELECT avg(age) ,  min(age) FROM PilotSkills
SELECT T1.pilot_name FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Austin' INTERSECT SELECT T1.pilot_name FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Boston'
SELECT T1.pilot_name FROM pilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Austin' INTERSECT SELECT T1.pilot_name FROM pilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Boston'
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" OR plane_name  =  "F-14 Fighter"
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" OR plane_name  =  "F-14 Fighter"
SELECT plane_name ,  avg(age) FROM PilotSkills GROUP BY plane_name
SELECT plane_name ,  avg(age) FROM PilotSkills GROUP BY plane_name
SELECT count(*) ,  plane_name FROM Hangar GROUP BY plane_name
SELECT plane_name ,  count(*) FROM Hangar GROUP BY plane_name
SELECT plane_name ,  max(age) FROM pilotskills GROUP BY plane_name ORDER BY plane_name
SELECT DISTINCT plane_name ,  max(age) FROM pilotskills GROUP BY plane_name ORDER BY plane_name
SELECT max(age) ,  plane_name FROM pilotSkills GROUP BY plane_name
SELECT DISTINCT plane_name ,  pilot_name FROM pilotskills ORDER BY age DESC LIMIT 1
SELECT max(age) ,  pilot_name FROM PilotSkills GROUP BY pilot_name
SELECT pilot_name ,  max(age) FROM PilotSkills GROUP BY pilot_name
SELECT T2.location ,  count(*) ,  avg(T1.age) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name GROUP BY T2.location
SELECT T2.location ,  count(*) ,  avg(T1.age) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name GROUP BY T2.location
SELECT count(*) FROM pilotskills GROUP BY plane_name HAVING avg(age)  <  35
SELECT plane_name ,  count(*) FROM pilotskills GROUP BY plane_name HAVING avg(age)  <  35
SELECT T1.location FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name  =  T2.plane_name ORDER BY T2.age LIMIT 1
SELECT T1.location FROM hangar AS T1 JOIN pilotskills AS T2 ON T1.plane_name  =  T2.plane_name ORDER BY T2.age LIMIT 1
SELECT T1.pilot_name ,  T1.age FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  "Austin"
SELECT T1.pilot_name ,  T1.age FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  "Austin"
SELECT pilot_name FROM PilotSkills WHERE age  >  (SELECT min(age) FROM PilotSkills WHERE plane_name  =  "Piper Cub") ORDER BY pilot_name
SELECT pilot_name FROM pilotskills WHERE age  >  (SELECT min(age) FROM pilotskills WHERE plane_name  =  "Piper Cub") ORDER BY pilot_name
SELECT count(*) FROM PilotSkills WHERE age  <  (SELECT min(age) FROM PilotSkills WHERE plane_name  =  "F-14 Fighter")
SELECT count(*) FROM PilotSkills WHERE age  <  (SELECT min(age) FROM PilotSkills WHERE plane_name  =  "F-14 Fighter")
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT DISTINCT plane_name FROM hangar WHERE plane_name LIKE "%Bomber%"
SELECT count(*) FROM PilotSkills WHERE age  >  (SELECT min(age) FROM PilotSkills WHERE plane_name  =  "Piper Cub")
SELECT count(*) FROM pilotskills WHERE age  >  (SELECT min(age) FROM pilotskills WHERE plane_name  =  "Piper Cub")
SELECT Name FROM district ORDER BY Area_km DESC LIMIT 1
SELECT Area_km ,  Government_website FROM district ORDER BY Population ASC LIMIT 1
SELECT Name ,  Population FROM district WHERE Area_km  >  (SELECT avg(Area_km) FROM district)
SELECT max(Area_km) ,  avg(Area_km) FROM district
SELECT sum(Population) FROM district ORDER BY Area_km DESC LIMIT 3
SELECT district_id ,  name ,  government_website FROM district ORDER BY Population
SELECT Name FROM district WHERE Government_website LIKE "%gov"
SELECT district_id ,  name FROM district WHERE population  >  4000 OR area_km  >  3000
SELECT Name ,  Speach_title FROM spokesman
SELECT avg(Points) ,  avg(Age) FROM spokesman WHERE Rank_position  =  1
SELECT Name ,  Points FROM spokesman WHERE Age  <  40
SELECT Name FROM spokesman ORDER BY Age DESC LIMIT 1
SELECT Name FROM spokesman WHERE Points  <  (SELECT avg(Points) FROM spokesman)
SELECT T2.Name FROM `spokesman_district` AS T1 JOIN `district` AS T2 ON T1.District_ID  =  T2.District_ID GROUP BY T1.District_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name FROM `spokesman` AS T1 JOIN `spokesman_district` AS T2 ON T1.Spokesman_ID  =  T2.Spokesman_ID WHERE T2.Start_year  <  2004
SELECT T2.Name ,  COUNT(*) FROM `spokesman_district` AS T1 JOIN `district` AS T2 ON T1.District_ID  =  T2.District_ID GROUP BY T1.District_ID
SELECT T2.Name FROM `spokesman_district` AS T1 JOIN `district` AS T2 ON T1.District_ID  =  T2.District_ID JOIN `spokesman` AS T3 ON T1.Spokesman_ID  =  T3.Spokesman_ID WHERE T3.Rank_position  =  1 INTERSECT SELECT T2.Name FROM `spokesman_district` AS T1 JOIN `district` AS T2 ON T1.District_ID  =  T2.District_ID JOIN `spokesman` AS T3 ON T1.Spokesman_ID  =  T3.Spokesman_ID WHERE T3.Rank_position  =  2
SELECT T2.Name FROM `spokesman_district` AS T1 JOIN `district` AS T2 ON T1.District_ID  =  T2.District_ID GROUP BY T1.District_ID HAVING COUNT(*)  >  1
SELECT count(*) FROM district WHERE district_id NOT IN (SELECT district_id FROM spokesman_district)
SELECT Name FROM spokesman WHERE Spokesman_ID NOT IN (SELECT Spokesman_ID FROM spokesman_district)
SELECT sum(t1.population) ,  avg(t1.population) FROM `district` AS t1 JOIN `spokesman_district` AS t2 ON t1.district_id  =  t2.district_id
SELECT title FROM sculptures ORDER BY year DESC LIMIT 1
SELECT title FROM sculptures ORDER BY year DESC LIMIT 1
SELECT title ,  LOCATION FROM paintings ORDER BY YEAR LIMIT 1
SELECT title ,  LOCATION FROM paintings ORDER BY YEAR DESC LIMIT 1
SELECT title FROM sculptures WHERE LOCATION  =  "Gallery 226"
SELECT title FROM sculptures WHERE LOCATION  =  "Gallery 226"
SELECT title ,  LOCATION FROM paintings
SELECT title ,  LOCATION FROM paintings
SELECT title ,  LOCATION FROM Sculptures
SELECT title ,  LOCATION FROM Sculptures
SELECT medium FROM paintings WHERE paintingID = 80
SELECT medium FROM paintings WHERE paintingID = 80
SELECT fname ,  lname FROM artists WHERE birthYear  >  1850
SELECT fname ,  lname FROM artists WHERE birthYear  >  1850
SELECT title ,  YEAR FROM sculptures WHERE LOCATION != 'Gallery 226'
SELECT T2.fname ,  T2.lname ,  T1.year FROM `sculptures` AS T1 JOIN `artists` AS T2 ON T1.sculptorID  =  T2.artistID WHERE T1.location != "Gallery 226"
SELECT DISTINCT T1.fname ,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  <  1900
SELECT DISTINCT T1.fname ,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  <  1900
SELECT DISTINCT T1.birthYear FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistID  =  T2.sculptorID WHERE T2.year  >  1920
SELECT DISTINCT T1.birthyear FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  >  1920
SELECT fname ,  lname FROM artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT fname ,  lname FROM artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT birthYear ,  deathYear FROM artists ORDER BY deathYear - birthYear LIMIT 1
SELECT fname ,  lname ,  deathYear - birthYear FROM artists ORDER BY deathYear - birthYear LIMIT 1
SELECT fname ,  deathYear - birthYear FROM artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT fname ,  deathYear - birthYear FROM artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT count(*) FROM paintings WHERE location  =  "Gallery 240"
SELECT count(*) FROM paintings WHERE location  =  "Gallery 240"
SELECT COUNT ( DISTINCT t1.title ) FROM artists AS t2 JOIN paintings AS t1 ON t2.artistid  =  t1.painterid WHERE t2.deathyear  -  t2.birthyear  =  ( SELECT max ( t2.deathyear  -  t2.birthyear ) FROM artists AS t2 )
SELECT COUNT(*) FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.deathyear  -  T1.birthyear  =  (SELECT max(deathyear - birthyear) FROM artists)
SELECT T2.title ,  T2.year FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.fname  =  "Mary"
SELECT T2.title ,  T2.year FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.fname  =  "Mary"
SELECT T2.width_mm FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T1.birthYear  <  1850
SELECT width_mm FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.birthyear  <  1850
SELECT T2.location ,  T2.medium FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.fname  =  "Pablo"
SELECT T2.location ,  T2.medium FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.fname  =  "Pablo"
SELECT fname ,  lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid INTERSECT SELECT fname ,  lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid
SELECT DISTINCT fname ,  lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid JOIN sculptures AS T3 ON T1.artistid  =  T3.sculptorid
SELECT fname ,  lname FROM artists WHERE artistid IN (SELECT painterid FROM paintings WHERE medium  =  "oil") INTERSECT SELECT fname ,  lname FROM artists WHERE artistid IN (SELECT painterid FROM paintings WHERE medium  =  "lithographic")
SELECT fname ,  lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  "oil" INTERSECT SELECT fname ,  lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  "lithographic"
SELECT T1.birthYear FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.year  =  1884 AND T2.mediumOn  =  "canvas"
SELECT T1.birthYear FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.year  =  1884
SELECT DISTINCT T2.fname FROM `paintings` AS T1 JOIN `artists` AS T2 ON T1.painterID  =  T2.artistID WHERE T1.medium  =  "oil" AND T1.location  =  "Gallery 241"
SELECT DISTINCT t1.fname FROM artists AS t1 JOIN paintings AS t2 ON t1.artistid  =  t2.painterid WHERE t2.medium  =  "oil" AND t2.location  =  "Gallery 241"
SELECT count(*) ,  medium FROM `paintings` GROUP BY medium
SELECT medium ,  count(*) FROM paintings GROUP BY medium
SELECT avg(height_mm) ,  medium FROM paintings GROUP BY medium
SELECT avg(height_mm) ,  medium FROM paintings GROUP BY medium
SELECT count(*) ,  LOCATION FROM paintings WHERE YEAR  <  1900 GROUP BY LOCATION
SELECT count(*) ,  LOCATION FROM paintings WHERE YEAR  <  1900 GROUP BY LOCATION
SELECT title FROM paintings WHERE YEAR  >  1910 AND medium  =  "oil"
SELECT title FROM paintings WHERE medium  =  "oil" AND YEAR  >  1910
SELECT DISTINCT painterID FROM paintings WHERE LOCATION  =  "Gallery 240" AND medium  =  "oil"
SELECT DISTINCT painterID FROM paintings WHERE medium  =  "oil" AND location  =  "Gallery 240"
SELECT DISTINCT title FROM paintings WHERE height_mm  >  (SELECT max(height_mm) FROM paintings WHERE medium  =  "canvas")
SELECT DISTINCT title FROM paintings WHERE height_mm  >  (SELECT max(height_mm) FROM paintings WHERE medium  =  "canvas")
SELECT DISTINCT paintingID FROM paintings WHERE YEAR  >  (SELECT min(YEAR) FROM paintings WHERE LOCATION  =  "Gallery 240")
SELECT DISTINCT paintingID FROM paintings WHERE YEAR  <  (SELECT min(YEAR) FROM paintings WHERE location  =  "Gallery 240")
SELECT paintingID FROM paintings ORDER BY YEAR DESC LIMIT 1
SELECT paintingID FROM paintings ORDER BY YEAR DESC LIMIT 1
SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.title LIKE "%female%"
SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.title LIKE "%female%"
SELECT DISTINCT title FROM paintings ORDER BY title ASC
SELECT DISTINCT title FROM paintings ORDER BY title ASC
SELECT DISTINCT title FROM paintings ORDER BY height_mm
SELECT DISTINCT title FROM paintings ORDER BY height_mm ASC
SELECT title FROM paintings WHERE YEAR BETWEEN 1900 AND 1950 UNION SELECT title FROM sculptures WHERE YEAR BETWEEN 1900 AND 1950
SELECT title FROM paintings WHERE YEAR BETWEEN 1900 AND 1950 UNION SELECT title FROM sculptures WHERE YEAR BETWEEN 1900 AND 1950
SELECT title FROM paintings WHERE painterID  =  222 UNION SELECT title FROM sculptures WHERE sculptorID  =  222
SELECT title FROM paintings WHERE painterID  =  222 UNION SELECT title FROM sculptures WHERE sculptorID  =  222
SELECT T1.artistID FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.year  <  1900 GROUP BY T1.artistID ORDER BY count(*) DESC LIMIT 1
SELECT T1.artistID FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID WHERE T2.year  <  1900 GROUP BY T1.artistID ORDER BY count(*) DESC LIMIT 1
SELECT T1.fname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid GROUP BY T1.artistid ORDER BY count(*) DESC LIMIT 1
SELECT T1.fname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid GROUP BY T1.artistid ORDER BY count(*) DESC LIMIT 1
SELECT title FROM paintings WHERE width_mm  <  600 OR height_mm  >  800
SELECT title FROM paintings WHERE width_mm  <  600 OR height_mm  >  800
SELECT DISTINCT location FROM paintings WHERE YEAR  <  1885 OR YEAR  >  1930
SELECT DISTINCT location FROM paintings WHERE YEAR  <  1885 OR YEAR  >  1930
SELECT paintingID FROM paintings WHERE height_mm  >  500 AND height_mm  <  2000
SELECT paintingID FROM paintings WHERE height_mm  >  500 AND height_mm  <  2000
SELECT DISTINCT location FROM paintings WHERE mediumOn  =  "panel" INTERSECT SELECT DISTINCT location FROM paintings WHERE mediumOn  =  "canvas"
SELECT DISTINCT location FROM paintings WHERE mediumOn  =  "panel" INTERSECT SELECT DISTINCT location FROM paintings WHERE mediumOn  =  "canvas"
SELECT DISTINCT location FROM paintings WHERE YEAR  <  1885 INTERSECT SELECT DISTINCT location FROM paintings WHERE YEAR  >  1930
SELECT DISTINCT location FROM paintings WHERE YEAR  <  1885 INTERSECT SELECT DISTINCT location FROM paintings WHERE YEAR  >  1930
SELECT avg(height_mm) ,  avg(width_mm) FROM paintings WHERE medium  =  "oil" AND LOCATION  =  "Gallery 241"
SELECT avg(height_mm) ,  avg(width_mm) FROM paintings WHERE medium  =  "oil" AND location  =  "Gallery 241"
SELECT max(height_mm) ,  paintingID FROM paintings WHERE YEAR  <  1900
SELECT height_mm ,  paintingID FROM paintings WHERE YEAR  <  1900 ORDER BY height_mm DESC LIMIT 1
SELECT max(height_mm) ,  max(width_mm) ,  YEAR FROM paintings GROUP BY YEAR
SELECT max(height_mm) ,  max(width_mm) ,  YEAR FROM paintings GROUP BY YEAR
SELECT avg(T2.height_mm) ,  avg(T2.width_mm) ,  T1.fname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid GROUP BY T1.fname ORDER BY T1.fname
SELECT avg(T2.height_mm) ,  avg(T2.width_mm) ,  T1.fname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid GROUP BY T1.fname ORDER BY T1.fname
SELECT fname ,  COUNT(*) FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid GROUP BY T1.artistid HAVING COUNT(*)  >=  2
SELECT fname ,  count(*) FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID  =  T2.painterID GROUP BY T1.artistID HAVING count(*)  >=  2
SELECT T1.deathYear FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID GROUP BY T1.artistID HAVING count(*)  <=  3
SELECT DISTINCT T1.deathYear FROM artists AS T1 JOIN paintings AS T2 ON T1.artistID  =  T2.painterID GROUP BY T1.artistID HAVING COUNT(*)  <  4
SELECT T1.deathYear FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistID  =  T2.sculptorID GROUP BY T1.artistID ORDER BY count(*) LIMIT 1
SELECT T1.deathYear FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistID  =  T2.sculptorID GROUP BY T1.artistID ORDER BY count(*) LIMIT 1
SELECT paintingID ,  height_mm FROM paintings WHERE width_mm  =  (SELECT max(width_mm) FROM paintings WHERE location  =  "Gallery 240")
SELECT height_mm ,  paintingID FROM paintings WHERE location  =  "Gallery 240" ORDER BY width_mm DESC LIMIT 1
SELECT paintingID FROM paintings WHERE YEAR  <  (SELECT min(YEAR) FROM paintings WHERE location  =  "Gallery 240")
SELECT paintingID FROM paintings WHERE YEAR  <  (SELECT min(YEAR) FROM paintings WHERE location  =  "Gallery 240")
SELECT paintingID FROM paintings WHERE height_mm  >  (SELECT max(height_mm) FROM paintings WHERE YEAR  >  1900)
SELECT paintingID FROM paintings WHERE height_mm  >  (SELECT max(height_mm) FROM paintings WHERE YEAR  >  1900)
SELECT T1.fname ,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  "oil" GROUP BY T1.artistid ORDER BY count(*) DESC LIMIT 3
SELECT T2.fname ,  T2.lname FROM `paintings` AS T1 JOIN `artists` AS T2 ON T1.painterID  =  T2.artistID WHERE T1.medium  =  "oil" GROUP BY T2.artistID ORDER BY count(*) DESC LIMIT 1
SELECT paintingID ,  LOCATION ,  title FROM paintings WHERE medium  =  "oil" ORDER BY YEAR
SELECT paintingID ,  LOCATION ,  title FROM paintings WHERE medium  =  "oil" ORDER BY YEAR
SELECT YEAR ,  LOCATION ,  title FROM paintings WHERE height_mm  >  1000 ORDER BY title
SELECT YEAR ,  LOCATION ,  title FROM paintings WHERE height_mm  >  1000 ORDER BY title
SELECT fname ,  lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid EXCEPT SELECT fname ,  lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid
SELECT fname ,  lname FROM artists WHERE artistid NOT IN (SELECT painterid FROM paintings) AND artistid IN (SELECT sculptorid FROM sculptures)
SELECT location FROM paintings WHERE YEAR  <  1885 EXCEPT SELECT location FROM paintings WHERE mediumOn  =  "canvas"
SELECT location FROM paintings WHERE YEAR  <  1885 AND medium !=  "canvas"
SELECT count(*) FROM race
SELECT count(*) FROM race
SELECT Winning_driver ,  Winning_team FROM race ORDER BY Winning_team ASC
SELECT Winning_driver ,  Winning_team FROM race ORDER BY Winning_team ASC
SELECT Winning_driver FROM race WHERE Pole_Position != "Junior Strous"
SELECT Winning_driver FROM race WHERE Pole_Position != "Junior Strous"
SELECT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Entrant FROM driver WHERE Age  >=  20
SELECT DISTINCT Entrant FROM driver WHERE Age  >=  20
SELECT max(Age) ,  min(Age) FROM driver
SELECT max(Age) ,  min(Age) FROM driver
SELECT count(DISTINCT Engine) FROM driver WHERE Age  >  30 OR Age  <  20
SELECT count(DISTINCT Engine) FROM driver WHERE Age  >  30 OR Age  <  20
SELECT driver_name FROM driver ORDER BY driver_name DESC
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT T2.Driver_Name ,  T1.Race_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID
SELECT T2.Driver_Name ,  T1.Race_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID
SELECT T2.driver_name ,  count(*) FROM race AS T1 JOIN driver AS T2 ON T1.driver_id  =  T2.driver_id GROUP BY T1.driver_id
SELECT driver_id ,  count(*) FROM race GROUP BY driver_id
SELECT T1.Age FROM `driver` AS T1 JOIN `race` AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T1.Driver_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Age FROM `driver` AS T1 JOIN `race` AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T1.Driver_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.driver_name ,  T1.age FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id GROUP BY T1.driver_name HAVING count(*)  >=  2
SELECT T1.driver_name ,  T1.age FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id GROUP BY T1.driver_name HAVING count(*)  >=  2
SELECT T1.Race_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T2.Age  >=  26
SELECT T1.Race_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T2.Age  >=  26
SELECT Driver_Name FROM driver WHERE Constructor != "Bugatti"
SELECT Driver_Name FROM driver WHERE Constructor != "Bugatti"
SELECT Constructor ,  COUNT(*) FROM driver GROUP BY Constructor
SELECT Constructor ,  COUNT(*) FROM driver GROUP BY Constructor
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*)  >=  2
SELECT Engine FROM driver GROUP BY Engine HAVING count(*)  >=  2
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Constructor FROM driver WHERE Age  <  20 INTERSECT SELECT Constructor FROM driver WHERE Age  >  30
SELECT Constructor FROM driver WHERE Age  <  20 INTERSECT SELECT Constructor FROM driver WHERE Age  >  30
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(*)  >  1
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(*)  >  1
SELECT T2.Driver_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T1.Pole_Position  =  "James Hinchcliffe" INTERSECT SELECT T2.Driver_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T1.Pole_Position  =  "Carl Skerlong"
SELECT T2.Driver_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T1.Pole_Position  =  "James Hinchcliffe" INTERSECT SELECT T2.Driver_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T1.Pole_Position  =  "Carl Skerlong"
SELECT driver_name FROM driver EXCEPT SELECT T1.driver_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id WHERE T2.pole_position  =  "James Hinchcliffe"
SELECT T2.driver_name FROM race AS T1 JOIN driver AS T2 ON T1.driver_id  =  T2.driver_id WHERE T1.pole_position != "James Hinchcliffe"
SELECT count(*) FROM languages
SELECT count(*) FROM languages
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages ORDER BY name
SELECT name FROM languages WHERE name LIKE "%ish%"
SELECT name FROM languages WHERE name LIKE "%ish%"
SELECT name FROM countries ORDER BY overall_score DESC
SELECT name FROM countries ORDER BY overall_score DESC
SELECT avg(justice_score) FROM countries
SELECT avg(justice_score) FROM countries
SELECT max(health_score) ,  min(health_score) FROM countries WHERE name != "Norway"
SELECT max(health_score) ,  min(health_score) FROM countries WHERE name != "Norway"
SELECT count(DISTINCT language_id) FROM official_languages
SELECT count(DISTINCT language_id) FROM official_languages
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1
SELECT T2.name ,  T3.name FROM official_languages AS T1 JOIN countries AS T2 ON T1.country_id  =  T2.id JOIN languages AS T3 ON T1.language_id  =  T3.id
SELECT T1.name ,  T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id
SELECT T2.name ,  count(*) FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T1.language_id
SELECT T2.name ,  count(*) FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T1.language_id
SELECT T1.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T1.language_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T1.language_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.language_id FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T1.language_id HAVING COUNT(*)  >=  2
SELECT T1.language_id FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T1.language_id HAVING COUNT(*)  >=  2
SELECT avg(T1.overall_score) FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T3.name  =  "English"
SELECT avg(T1.overall_score) FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T3.name  =  "English"
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.name ORDER BY count(*) DESC LIMIT 3
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T1.language_id ORDER BY count(*) DESC LIMIT 3
SELECT t2.name FROM `countries` AS t1 JOIN `official_languages` AS t3 ON t1.id  =  t3.country_id JOIN `languages` AS t2 ON t2.id  =  t3.language_id GROUP BY t2.name ORDER BY avg(t1.overall_score) DESC
SELECT T3.name FROM `countries` AS T1 JOIN `official_languages` AS T2 ON T1.id  =  T2.country_id JOIN `languages` AS T3 ON T2.language_id  =  T3.id GROUP BY T3.name ORDER BY avg(T1.overall_score) DESC
SELECT T1.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id GROUP BY T2.country_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM `official_languages` AS T1 JOIN `countries` AS T2 ON T1.country_id  =  T2.id GROUP BY T1.country_id ORDER BY count(*) DESC LIMIT 1
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT T3.name FROM `countries` AS T1 JOIN `official_languages` AS T2 ON T1.id  =  T2.country_id JOIN `languages` AS T3 ON T2.language_id  =  T3.id WHERE T1.overall_score  >  95 INTERSECT SELECT T3.name FROM `countries` AS T1 JOIN `official_languages` AS T2 ON T1.id  =  T2.country_id JOIN `languages` AS T3 ON T2.language_id  =  T3.id WHERE T1.overall_score  <  90
SELECT T3.name FROM `countries` AS T1 JOIN `official_languages` AS T2 ON T1.id  =  T2.country_id JOIN `languages` AS T3 ON T2.language_id  =  T3.id WHERE T1.overall_score  >  95 INTERSECT SELECT T3.name FROM `countries` AS T1 JOIN `official_languages` AS T2 ON T1.id  =  T2.country_id JOIN `languages` AS T3 ON T2.language_id  =  T3.id WHERE T1.overall_score  <  90
SELECT DISTINCT country ,  town_city FROM Addresses
SELECT country ,  town_city FROM Addresses
SELECT T2.county_state_province FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id
SELECT T2.county_state_province FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id
SELECT feature_description FROM Features WHERE feature_name  =  "rooftop"
SELECT feature_description FROM Features WHERE feature_name  =  "rooftop"
SELECT T1.feature_name ,  T1.feature_description FROM Features AS T1 JOIN Property_Features AS T2 ON T1.feature_id  =  T2.feature_id GROUP BY T2.feature_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.feature_name ,  T1.feature_description FROM Features AS T1 JOIN Property_Features AS T2 ON T1.feature_id  =  T2.feature_id GROUP BY T1.feature_id ORDER BY count(*) DESC LIMIT 1
SELECT min(room_number) FROM Rooms
SELECT min(room_count) FROM Properties
SELECT count(*) FROM Properties WHERE parking_lots  =  1 OR garage_yn  =  1
SELECT count(*) FROM Properties WHERE parking_lots  =  1 OR garage_yn  =  1
SELECT age_category_code FROM users WHERE other_user_details LIKE '%Mother%'
SELECT T1.age_category_description FROM Ref_Age_Categories AS T1 JOIN Users AS T2 ON T1.age_category_code  =  T2.age_category_code WHERE T2.first_name LIKE "%Mother%"
SELECT t1.first_name FROM users AS t1 JOIN properties AS t2 ON t1.user_id  =  t2.owner_user_id GROUP BY t1.first_name ORDER BY count(*) DESC LIMIT 1
SELECT t1.first_name FROM users AS t1 JOIN properties AS t2 ON t1.user_id  =  t2.owner_user_id GROUP BY t1.first_name ORDER BY count(*) DESC LIMIT 1
SELECT avg(room_count) FROM Properties WHERE property_type_code  =  "garden"
SELECT avg(T1.room_number) FROM Rooms AS T1 JOIN Property_Features AS T2 ON T1.property_id  =  T2.property_id WHERE T2.feature_id  =  3
SELECT T1.town_city FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id JOIN Property_Features AS T3 ON T2.property_id  =  T3.property_id WHERE T3.feature_id  =  3
SELECT T1.town_city FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id WHERE T2.property_type_code  =  "swimming_pool"
SELECT property_id ,  vendor_requested_price FROM Properties ORDER BY vendor_requested_price LIMIT 1
SELECT property_id ,  vendor_requested_price FROM Properties ORDER BY vendor_requested_price LIMIT 1
SELECT avg(room_number) FROM Rooms
SELECT avg(room_count) FROM Properties
SELECT count(DISTINCT room_size) FROM Rooms
SELECT count(DISTINCT room_size) FROM Rooms
SELECT user_id ,  search_string FROM User_Searches GROUP BY user_id HAVING count(*)  >=  2
SELECT user_id ,  search_seq FROM User_Searches GROUP BY user_id ,  search_seq HAVING count(*)  >=  2
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1
SELECT search_datetime ,  search_string FROM User_Searches ORDER BY search_string DESC
SELECT search_string ,  search_datetime FROM User_Searches ORDER BY search_string DESC
SELECT T1.zip_postcode FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id = T2.property_address_id JOIN Users AS T3 ON T2.owner_user_id = T3.user_id GROUP BY T3.user_id HAVING count(*)  >  2
SELECT T1.zip_postcode FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id JOIN Users AS T3 ON T2.owner_user_id  =  T3.user_id GROUP BY T3.user_id HAVING count(*)  >  2
SELECT T1.user_category_code ,  T1.user_id FROM `Users` AS T1 JOIN `User_Searches` AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  =  1
SELECT T1.user_id ,  T1.user_category_code FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  =  1
SELECT T1.age_category_description FROM Ref_Age_Categories AS T1 JOIN Users AS T2 ON T1.age_category_code  =  T2.age_category_code JOIN User_Searches AS T3 ON T3.user_id  =  T2.user_id ORDER BY T3.search_datetime LIMIT 1
SELECT T1.age_category_description FROM Ref_Age_Categories AS T1 JOIN Users AS T2 ON T1.age_category_code  =  T2.age_category_code JOIN User_Searches AS T3 ON T2.user_id  =  T3.user_id ORDER BY T3.search_datetime LIMIT 1
SELECT T2.login_name FROM Ref_User_Categories AS T1 JOIN Users AS T2 ON T1.user_category_code  =  T2.user_category_code WHERE T1.user_category_description  =  "Senior Citizen" ORDER BY T2.first_name
SELECT T1.login_name FROM Users AS T1 JOIN Ref_User_Categories AS T2 ON T1.user_category_code  =  T2.user_category_code WHERE T2.user_category_description  =  "Senior Citizen" ORDER BY T1.first_name
SELECT count(*) FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id WHERE T1.is_buyer  =  1
SELECT count(*) FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id WHERE T1.is_buyer  =  1
SELECT date_registered FROM Users WHERE login_name  =  "ratione"
SELECT date_registered FROM users WHERE login_name  =  "ratione"
SELECT first_name ,  middle_name ,  last_name ,  login_name FROM Users WHERE is_seller  =  1
SELECT first_name ,  middle_name ,  last_name ,  login_name FROM Users WHERE is_seller  =  1
SELECT T1.line_1_number_building ,  T1.line_2_number_street ,  T1.town_city FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id JOIN Ref_Age_Categories AS T3 ON T2.age_category_code  =  T3.age_category_code WHERE T3.age_category_description  =  "Senior Citizen"
SELECT T1.line_1_number_building ,  T1.line_2_number_street ,  T1.town_city FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id WHERE T2.user_category_code  =  "Senior Citizen"
SELECT count(*) FROM Property_Features GROUP BY property_id HAVING count(*)  >=  2
SELECT count(*) FROM Property_Features GROUP BY property_id HAVING count(*)  >=  2
SELECT property_id ,  count(*) FROM Property_Photos GROUP BY property_id
SELECT property_id ,  count(*) FROM Property_Photos GROUP BY property_id
SELECT T1.owner_user_id ,  count(*) FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id JOIN Property_Photos AS T3 ON T2.property_id  =  T3.property_id GROUP BY T1.user_id
SELECT T1.owner_user_id ,  count(*) FROM `Properties` AS T1 JOIN `Property_Photos` AS T2 ON T1.property_id  =  T2.property_id GROUP BY T1.owner_user_id
SELECT sum(t2.price_max) FROM users AS t1 JOIN properties AS t2 ON t1.user_id  =  t2.owner_user_id WHERE t1.user_category_code  =  "Single Mother" OR t1.user_category_code  =  "Student"
SELECT sum(T2.price_max) FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id WHERE T1.user_category_code  =  "Single Mother" OR T1.user_category_code  =  "Student"
SELECT T1.datestamp ,  T2.property_name FROM User_Property_History AS T1 JOIN Properties AS T2 ON T1.property_id  =  T2.property_id ORDER BY T1.datestamp
SELECT T1.datestamp ,  T2.property_name FROM User_Property_History AS T1 JOIN Properties AS T2 ON T1.property_id  =  T2.property_id ORDER BY T1.datestamp
SELECT T1.property_type_description ,  T1.property_type_code FROM Ref_Property_Types AS T1 JOIN Properties AS T2 ON T1.property_type_code  =  T2.property_type_code GROUP BY T2.property_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.property_type_description ,  T1.property_type_code FROM Ref_Property_Types AS T1 JOIN Properties AS T2 ON T1.property_type_code  =  T2.property_type_code GROUP BY T1.property_type_code ORDER BY count(*) DESC LIMIT 1
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code  =  "Over 60"
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code  =  "Over 60"
SELECT room_size ,  count(*) FROM Rooms GROUP BY room_size
SELECT room_size ,  count(*) FROM Rooms GROUP BY room_size
SELECT T1.country FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id = T2.user_address_id WHERE T2.first_name = "Robbie"
SELECT T1.country FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id = T2.user_address_id WHERE T2.first_name = "Robbie"
SELECT T1.first_name ,  T1.middle_name ,  T1.last_name FROM Users AS T1 JOIN Addresses AS T2 ON T1.user_address_id  =  T2.address_id JOIN Properties AS T3 ON T2.address_id  =  T3.property_address_id WHERE T3.owner_user_id  =  T1.user_id
SELECT T1.first_name ,  T1.last_name FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id
SELECT search_string FROM USER_SEARCHES WHERE user_id NOT IN (SELECT owner_user_id FROM properties)
SELECT search_string FROM USER_SEARCHES WHERE user_id NOT IN (SELECT user_id FROM users WHERE is_buyer  =  1)
SELECT T1.last_name ,  T1.user_id FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id GROUP BY T1.user_id HAVING count(*)  >=  2 INTERSECT SELECT T1.last_name ,  T1.user_id FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  <=  2
SELECT T1.last_name ,  T1.user_id FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id JOIN Properties AS T3 ON T1.user_id  =  T3.owner_user_id GROUP BY T1.user_id HAVING count(*)  <=  2 AND count(*)  >=  2
SELECT count(*) FROM bike WHERE weight  >  780
SELECT product_name ,  weight FROM bike ORDER BY price ASC
SELECT heat ,  name ,  nation FROM cyclist
SELECT max(weight) ,  min(weight) FROM bike
SELECT avg(price) FROM bike WHERE material  =  'Carbon CC'
SELECT name ,  result FROM cyclist WHERE nation != 'Russia'
SELECT DISTINCT T2.id ,  T2.product_name FROM cyclists_own_bikes AS T1 JOIN bike AS T2 ON T1.bike_id  =  T2.id WHERE T1.purchase_year  >  2015
SELECT T1.id ,  T1.product_name FROM `bike` AS T1 JOIN `cyclists_own_bikes` AS T2 ON T1.id  =  T2.bike_id GROUP BY T2.bike_id HAVING count(*)  >=  4
SELECT T1.cyclist_id ,  T2.name FROM cyclists_own_bikes AS T1 JOIN cyclist AS T2 ON T1.cyclist_id  =  T2.id GROUP BY T1.cyclist_id ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.bike_id JOIN cyclist AS T3 ON T2.cyclist_id  =  T3.id WHERE T3.nation  =  'Russia' OR T3.nation  =  'Great Britain'
SELECT count(DISTINCT heat) FROM cyclist
SELECT count(*) FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes WHERE purchase_year  >  2015)
SELECT DISTINCT T2.product_name FROM cyclists_own_bikes AS T1 JOIN bike AS T2 ON T1.bike_id  =  T2.id JOIN cyclist AS T3 ON T1.cyclist_id  =  T3.id WHERE T3.result  >  '4:21.558'
SELECT T2.product_name ,  T2.price FROM cyclists_own_bikes AS T1 JOIN bike AS T2 ON T1.bike_id  =  T2.id JOIN cyclist AS T3 ON T1.cyclist_id  =  T3.id WHERE T3.name  =  'Bradley Wiggins' INTERSECT SELECT T2.product_name ,  T2.price FROM cyclists_own_bikes AS T1 JOIN bike AS T2 ON T1.bike_id  =  T2.id JOIN cyclist AS T3 ON T1.cyclist_id  =  T3.id WHERE T3.name  =  'Antonio Tauler'
SELECT name ,  nation ,  result FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes)
SELECT product_name FROM bike WHERE material LIKE '%fiber%'
SELECT cyclist_id ,  count(*) FROM cyclists_own_bikes GROUP BY cyclist_id ORDER BY cyclist_id
SELECT Flavor ,  max(Price) FROM goods WHERE Food  =  "Cake"
SELECT id ,  flavor FROM goods WHERE price  =  (SELECT max(price) FROM goods WHERE food  =  "Cake")
SELECT Flavor ,  min(Price) FROM goods WHERE Food  =  "Cookie"
SELECT id ,  flavor FROM goods WHERE food  =  "Cookie" ORDER BY price LIMIT 1
SELECT id FROM goods WHERE flavor  =  "Apple"
SELECT id FROM goods WHERE flavor  =  "Apple"
SELECT id FROM goods WHERE price  <  3
SELECT id FROM goods WHERE price  <  3
SELECT DISTINCT T1.customerid FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.food  =  "Cake" AND T3.flavor  =  "Lemon"
SELECT DISTINCT T1.customerid FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.flavor  =  "Lemon" AND T3.food  =  "Cake"
SELECT T3.food ,  count(DISTINCT T1.customerid) FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id GROUP BY T3.food
SELECT T3.food ,  count(*) FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id GROUP BY T3.food
SELECT customerid FROM receipts GROUP BY customerid HAVING count(*)  >=  15
SELECT customerid FROM receipts GROUP BY customerid HAVING count(*)  >=  15
SELECT T1.lastname FROM customers AS T1 JOIN receipts AS T2 ON T1.id = T2.customerid GROUP BY T1.id HAVING count(*)  >  10
SELECT T1.lastname FROM customers AS T1 JOIN receipts AS T2 ON T1.id = T2.customerid GROUP BY T1.id HAVING count(*)  >  10
SELECT count(DISTINCT flavor) FROM goods WHERE food  =  "Cake"
SELECT count(DISTINCT flavor) FROM goods WHERE food  =  "Cake"
SELECT Flavor FROM goods WHERE Food  =  "Croissant"
SELECT Flavor FROM goods WHERE Food  =  "Croissant"
SELECT DISTINCT T2.item FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt WHERE T1.customerid  =  15
SELECT DISTINCT T2.item FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt WHERE T1.customerid  =  15
SELECT avg(price) ,  max(price) ,  min(price) ,  food FROM goods GROUP BY food
SELECT avg(price) ,  min(price) ,  max(price) ,  food FROM goods GROUP BY food
SELECT receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.food  =  "Cake" INTERSECT SELECT receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.food  =  "Cookie"
SELECT T1.receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.food  =  "Cake" INTERSECT SELECT T1.receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.food  =  "Cookie"
SELECT T1.receiptnumber FROM receipts AS T1 JOIN customers AS T2 ON T1.customerid  =  T2.id JOIN items AS T3 ON T1.receiptnumber  =  T3.receipt JOIN goods AS T4 ON T3.item  =  T4.id WHERE T2.lastname  =  "LOGAN" AND T4.food  =  "Croissant"
SELECT T1.receiptnumber FROM receipts AS T1 JOIN customers AS T2 ON T1.customerid  =  T2.id JOIN items AS T3 ON T1.receiptnumber  =  T3.receipt JOIN goods AS T4 ON T3.item  =  T4.id WHERE T2.lastname  =  "LOGAN" AND T4.food  =  "Croissant"
SELECT T1.receiptnumber ,  T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id ORDER BY T3.price DESC LIMIT 1
SELECT T1.receiptnumber ,  T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id ORDER BY T3.price DESC LIMIT 1
SELECT item FROM items GROUP BY item ORDER BY count(*) ASC LIMIT 1
SELECT item FROM items GROUP BY item ORDER BY count(*) LIMIT 1
SELECT count(*) ,  food FROM goods GROUP BY food
SELECT count(*) ,  food FROM goods GROUP BY food
SELECT avg(price) ,  food FROM goods GROUP BY food
SELECT avg(price) ,  food FROM goods GROUP BY food
SELECT id FROM goods WHERE flavor  =  "Apricot" AND price  <  5
SELECT id FROM goods WHERE flavor  =  "Apricot" AND price  <  5
SELECT flavor FROM goods WHERE price  >  10 AND food  =  "Cake"
SELECT Flavor FROM goods WHERE Price  >  10 AND Food  =  "Cake"
SELECT DISTINCT id ,  price FROM goods WHERE price  <  (SELECT avg(price) FROM goods)
SELECT DISTINCT id ,  price FROM goods WHERE price  <  (SELECT avg(price) FROM goods)
SELECT DISTINCT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE food  =  "Tart")
SELECT DISTINCT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE flavor  =  "Tart")
SELECT DISTINCT T1.receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  13
SELECT DISTINCT T1.receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  13
SELECT T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  15
SELECT T1.date FROM receipts AS T1 JOIN customers AS T2 ON T1.customerid  =  T2.id JOIN items AS T3 ON T1.receiptnumber  =  T3.receipt JOIN goods AS T4 ON T3.item  =  T4.id WHERE T4.price  >  15
SELECT id FROM goods WHERE id LIKE "%APP%"
SELECT id FROM goods WHERE id LIKE "%APP%"
SELECT price FROM goods WHERE id LIKE "%70%"
SELECT id ,  price FROM goods WHERE id LIKE "%70%"
SELECT lastname FROM customers ORDER BY lastname
SELECT lastname FROM customers ORDER BY lastname
SELECT DISTINCT item FROM items ORDER BY item
SELECT DISTINCT id FROM goods ORDER BY id
SELECT T1.receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.food  =  "Pie" AND T3.flavor  =  "Apple" OR T1.customerid  =  12
SELECT T1.receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.food  =  "Pie" AND T3.flavor  =  "Apple" UNION SELECT T1.receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T1.customerid  =  12
SELECT date ,  max(date) FROM receipts
SELECT receiptnumber ,  date FROM receipts ORDER BY date DESC LIMIT 1
SELECT receiptnumber FROM receipts WHERE date  =  (SELECT min(date) FROM receipts) UNION SELECT receiptnumber FROM receipts WHERE receiptnumber IN (SELECT receiptnumber FROM goods WHERE price  >  10)
SELECT receiptnumber FROM receipts WHERE date  =  (SELECT min(date) FROM receipts) UNION SELECT receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.price  >  10
SELECT id FROM goods WHERE food  =  "Cookie" AND price BETWEEN 3 AND 7 UNION SELECT id FROM goods WHERE food  =  "Cake" AND price BETWEEN 3 AND 7
SELECT id FROM goods WHERE food  =  "Cookie" OR food  =  "Cake" AND price BETWEEN 3 AND 7
SELECT T1.firstname ,  T1.lastname FROM customers AS T1 JOIN receipts AS T2 ON T1.id = T2.customerid ORDER BY T2.date LIMIT 1
SELECT T1.firstname ,  T1.lastname FROM customers AS T1 JOIN receipts AS T2 ON T1.id = T2.customerid ORDER BY T2.date LIMIT 1
SELECT avg(price) FROM goods WHERE flavor  =  "Blackberry" OR flavor  =  "Blueberry"
SELECT avg(price) FROM goods WHERE flavor  =  "Blackberry" OR flavor  =  "Blueberry"
SELECT min(price) FROM goods WHERE flavor  =  "Cheese"
SELECT flavor FROM goods WHERE price  =  ( SELECT min(price) FROM goods WHERE flavor  =  "Cheese" )
SELECT max(price) ,  min(price) ,  avg(price) ,  flavor FROM goods GROUP BY flavor ORDER BY flavor
SELECT max(price) ,  min(price) ,  avg(price) ,  flavor FROM goods GROUP BY flavor ORDER BY flavor
SELECT min(price) ,  max(price) ,  food FROM goods GROUP BY food ORDER BY food
SELECT min(price) ,  max(price) FROM goods ORDER BY food
SELECT date FROM receipts GROUP BY date ORDER BY count(*) DESC LIMIT 3
SELECT date FROM receipts GROUP BY date ORDER BY count(*) DESC LIMIT 3
SELECT T1.firstname ,  T1.lastname ,  count(*) FROM customers AS T1 JOIN receipts AS T2 ON T1.id = T2.customerid GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT customerid ,  count(*) FROM receipts GROUP BY customerid ORDER BY count(*) DESC LIMIT 1
SELECT date ,  count(DISTINCT customerid) FROM receipts GROUP BY date
SELECT date ,  count(DISTINCT customerid) FROM receipts GROUP BY date
SELECT T1.firstname ,  T1.lastname FROM customers AS T1 JOIN receipts AS T2 ON T1.id  =  T2.customerid JOIN items AS T3 ON T3.receipt  =  T2.receiptnumber JOIN goods AS T4 ON T3.item  =  T4.id WHERE T4.food  =  "Tart" AND T4.flavor  =  "Apple"
SELECT T1.firstname ,  T1.lastname FROM customers AS T1 JOIN receipts AS T2 ON T1.id  =  T2.customerid JOIN items AS T3 ON T3.receipt  =  T2.receiptnumber JOIN goods AS T4 ON T3.item  =  T4.id WHERE T4.food  =  "Tart" AND T4.flavor  =  "Apple"
SELECT id FROM goods WHERE flavor  =  "Cookie" AND price  <  (SELECT min(price) FROM goods WHERE flavor  =  "Croissant")
SELECT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE flavor  =  "Croissant")
SELECT id FROM goods WHERE food  =  "Cake" AND price  >=  (SELECT avg(price) FROM goods WHERE food  =  "Tart")
SELECT id FROM goods WHERE price  >=  (SELECT avg(price) FROM goods WHERE food  =  "Tart")
SELECT id FROM goods WHERE price  >  2 * (SELECT avg(price) FROM goods)
SELECT id FROM goods WHERE price  >  2 * (SELECT avg(price) FROM goods)
SELECT id ,  flavor ,  food FROM goods ORDER BY price
SELECT id ,  flavor ,  food FROM goods ORDER BY price
SELECT T2.id ,  T2.flavor FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.food  =  "Cake" ORDER BY T2.flavor
SELECT id ,  flavor FROM goods WHERE food  =  "Cake" ORDER BY flavor
SELECT T1.item FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.flavor  =  "Chocolate" EXCEPT SELECT T1.item FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id GROUP BY T1.item HAVING count(*)  >  10
SELECT T1.item FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.flavor  =  "Chocolate" GROUP BY T1.item HAVING count(*)  <=  10
SELECT Flavor FROM goods WHERE Food  =  "Cake" EXCEPT SELECT Flavor FROM goods WHERE Food  =  "Tart"
SELECT Flavor FROM goods WHERE Food  =  "Cake" EXCEPT SELECT Flavor FROM goods WHERE Food  =  "Tart"
SELECT T2.food FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id GROUP BY T1.item ORDER BY count(*) DESC LIMIT 3
SELECT item FROM items GROUP BY item ORDER BY count(*) DESC LIMIT 3
SELECT T1.customerid FROM receipts AS T1 JOIN customers AS T2 ON T1.customerid  =  T2.id GROUP BY T1.customerid HAVING sum(T1.receiptnumber)  >  150
SELECT T1.customerid FROM receipts AS T1 JOIN customers AS T2 ON T1.customerid  =  T2.id GROUP BY T1.customerid HAVING sum(T1.receiptnumber)  >  150
SELECT customerid FROM receipts GROUP BY customerid HAVING avg(price)  >  5
SELECT customerid FROM receipts GROUP BY customerid HAVING sum(price)  >  (SELECT avg(sum(price)) FROM receipts GROUP BY customerid)
SELECT T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  100 GROUP BY T1.date HAVING sum(T3.price)  >  100
SELECT T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  100 GROUP BY T1.date HAVING sum(T3.price)  >  100
SELECT count(*) FROM driver
SELECT count(*) FROM driver
SELECT count(*) ,  make FROM driver WHERE points  >  150 GROUP BY make
SELECT Make ,  COUNT(*) FROM driver WHERE Points  >  150 GROUP BY Make
SELECT avg(Age) ,  Make FROM driver GROUP BY Make
SELECT avg(Age) ,  Make FROM driver GROUP BY Make
SELECT avg(Laps) FROM driver WHERE Age  <  20
SELECT avg(Laps) FROM driver WHERE Age  <  20
SELECT Manager ,  Sponsor FROM team ORDER BY Car_Owner
SELECT Manager ,  Sponsor FROM team ORDER BY Car_Owner
SELECT Make FROM team GROUP BY Make HAVING COUNT(*)  >  1
SELECT Make FROM team GROUP BY Make HAVING COUNT(*)  >  1
SELECT Make FROM team WHERE Car_Owner  =  "Buddy Arrington"
SELECT Make FROM team WHERE Car_Owner  =  "Buddy Arrington"
SELECT max(Points) ,  min(Points) FROM driver
SELECT max(Points) ,  min(Points) FROM driver
SELECT count(*) FROM driver WHERE Points  <  150
SELECT count(*) FROM driver WHERE Points  <  150
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT Driver ,  Country FROM driver
SELECT Driver ,  Country FROM driver
SELECT max(T2.Points) FROM country AS T1 JOIN driver AS T2 ON T1.Country_Id  =  T2.Country WHERE T1.Capital  =  "Dublin"
SELECT max(T2.Points) FROM country AS T1 JOIN driver AS T2 ON T1.Country_Id  =  T2.Country WHERE T1.Capital  =  "Dublin"
SELECT avg(T2.Age) FROM country AS T1 JOIN driver AS T2 ON T1.Country_ID  =  T2.Country WHERE T1.Official_native_language  =  "English"
SELECT avg(T2.Age) FROM country AS T1 JOIN driver AS T2 ON T1.Country_Id  =  T2.Country WHERE T1.Official_native_language  =  "English"
SELECT Country FROM driver WHERE Points  >  150
SELECT Country FROM driver WHERE Points  >  150
SELECT T1.Capital FROM `country` AS T1 JOIN `driver` AS T2 ON T1.Country_ID  =  T2.Country ORDER BY T2.Points DESC LIMIT 1
SELECT T1.Capital FROM `country` AS T1 JOIN `driver` AS T2 ON T1.Country_Id  =  T2.Country ORDER BY T2.Points DESC LIMIT 1
SELECT Make ,  COUNT(*) FROM driver GROUP BY Make
SELECT Make ,  COUNT(*) FROM driver GROUP BY Make
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*)  >=  3
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*)  >=  3
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT Country FROM driver WHERE Make  =  "Dodge" INTERSECT SELECT Country FROM driver WHERE Make  =  "Chevrolet"
SELECT Country FROM driver WHERE Make  =  "Dodge" INTERSECT SELECT Country FROM driver WHERE Make  =  "Chevrolet"
SELECT sum(Points) ,  avg(Points) FROM driver
SELECT sum(Points) ,  avg(Points) FROM driver
SELECT Country FROM country WHERE Country_Id NOT IN (SELECT Country FROM driver)
SELECT Country FROM country WHERE Country_Id NOT IN (SELECT Country FROM driver)
SELECT T1.manager ,  T1.sponsor FROM `team` AS T1 JOIN `team_driver` AS T2 ON T1.team_id  =  T2.team_id GROUP BY T1.team_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.manager ,  T1.sponsor FROM `team` AS T1 JOIN `team_driver` AS T2 ON T1.team_id  =  T2.team_id GROUP BY T1.team_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.Manager ,  T1.Car_Owner FROM `team` AS T1 JOIN `team_driver` AS T2 ON T1.Team_ID  =  T2.Team_ID GROUP BY T1.Team_ID HAVING count(*)  >=  2
SELECT T2.Manager ,  T2.Car_Owner FROM team_driver AS T1 JOIN team AS T2 ON T1.Team_ID  =  T2.Team_ID GROUP BY T1.Team_ID HAVING COUNT(*)  >=  2
SELECT count(*) FROM institution
SELECT count(*) FROM institution
SELECT name FROM institution ORDER BY name ASC
SELECT name FROM institution ORDER BY name
SELECT name FROM institution ORDER BY founded ASC
SELECT name FROM institution ORDER BY founded
SELECT city ,  province FROM institution
SELECT city ,  province FROM institution
SELECT max(Enrollment) ,  min(Enrollment) FROM institution
SELECT max(Enrollment) ,  min(Enrollment) FROM institution
SELECT Affiliation FROM institution WHERE City != "Vancouver"
SELECT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT stadium FROM institution ORDER BY enrollment DESC LIMIT 1
SELECT stadium FROM institution ORDER BY enrollment DESC LIMIT 1
SELECT T1.Name ,  T2.Nickname FROM institution AS T1 JOIN championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID
SELECT T1.Name ,  T2.Nickname FROM institution AS T1 JOIN championship AS T2 ON T1.Institution_ID  =  T2.Institution_ID
SELECT T2.Nickname FROM `institution` AS T1 JOIN `championship` AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T1.Enrollment LIMIT 1
SELECT T2.Nickname FROM `institution` AS T1 JOIN `championship` AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T1.Enrollment LIMIT 1
SELECT T1.name FROM institution AS T1 JOIN championship AS T2 ON T1.institution_id  =  T2.institution_id ORDER BY T2.number_of_championships DESC
SELECT T1.Name FROM `institution` AS T1 JOIN `championship` AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T2.Number_of_Championships DESC
SELECT T1.name FROM institution AS T1 JOIN championship AS T2 ON T1.institution_id  =  T2.institution_id
SELECT T1.Name FROM `institution` AS T1 JOIN `championship` AS T2 ON T1.Institution_ID  =  T2.Institution_ID GROUP BY T1.Institution_ID HAVING count(*)  >=  1
SELECT sum(T1.Number_of_Championships) FROM championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID WHERE T2.Affiliation  =  "Public"
SELECT sum(T1.Number_of_Championships) FROM championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID WHERE T2.Affiliation  =  "Public"
SELECT Affiliation ,  COUNT(*) FROM institution GROUP BY Affiliation
SELECT affiliation ,  count(*) FROM institution GROUP BY affiliation
SELECT Affiliation FROM institution GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT Affiliation FROM institution GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT founded FROM institution GROUP BY founded HAVING count(*)  >  1
SELECT founded ,  count(*) FROM institution GROUP BY founded HAVING count(*)  >  1
SELECT T2.Nickname FROM `institution` AS T1 JOIN `championship` AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T1.Capacity DESC
SELECT T2.Nickname FROM `institution` AS T1 JOIN `championship` AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T1.Capacity DESC
SELECT sum(enrollment) FROM institution WHERE city  =  "Vancouver" OR city  =  "Calgary"
SELECT enrollment FROM institution WHERE city  =  'Vancouver' OR city  =  'Calgary'
SELECT Province FROM institution WHERE founded  <  1920 INTERSECT SELECT Province FROM institution WHERE founded  >  1950
SELECT Province FROM institution WHERE founded  <  1920 EXCEPT SELECT Province FROM institution WHERE founded  >  1950
SELECT count(DISTINCT Province) FROM institution
SELECT count(DISTINCT Province) FROM institution
SELECT * FROM Warehouses
SELECT * FROM Warehouses
SELECT DISTINCT contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'New York'
SELECT DISTINCT contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'New York'
SELECT Contents FROM Boxes WHERE Value  >  150
SELECT Contents FROM Boxes WHERE Value  >  150
SELECT Warehouse ,  avg(value) FROM Boxes GROUP BY Warehouse
SELECT avg(value) ,  warehouse FROM Boxes GROUP BY warehouse
SELECT avg(value) ,  sum(value) FROM Boxes
SELECT avg(value) ,  sum(value) FROM Boxes
SELECT avg(capacity) ,  sum(capacity) FROM Warehouses
SELECT avg(capacity) ,  sum(capacity) FROM Warehouses
SELECT avg(value) ,  max(value) ,  contents FROM Boxes GROUP BY contents
SELECT avg(value) ,  max(value) ,  contents FROM boxes GROUP BY contents
SELECT Contents FROM boxes GROUP BY Contents ORDER BY sum(value) DESC LIMIT 1
SELECT Contents FROM boxes ORDER BY Value DESC LIMIT 1
SELECT avg(value) FROM Boxes
SELECT avg(value) FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT count(DISTINCT contents) FROM boxes
SELECT count(DISTINCT Contents) FROM Boxes
SELECT DISTINCT LOCATION FROM Warehouses
SELECT DISTINCT LOCATION FROM Warehouses
SELECT code FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'
SELECT code FROM boxes WHERE warehouse IN (SELECT code FROM warehouses WHERE LOCATION  =  'Chicago' OR LOCATION  =  'New York')
SELECT sum(T1.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'
SELECT sum(T1.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'
SELECT DISTINCT contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'
SELECT DISTINCT contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' INTERSECT SELECT DISTINCT contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'New York'
SELECT DISTINCT contents FROM boxes EXCEPT SELECT DISTINCT contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'New York'
SELECT DISTINCT contents FROM boxes EXCEPT SELECT DISTINCT contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'New York'
SELECT LOCATION FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents  =  'Rocks' EXCEPT SELECT Warehouse FROM Boxes WHERE Contents  =  'Scissors')
SELECT DISTINCT T1.location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Rocks' EXCEPT SELECT DISTINCT T1.location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Scissors'
SELECT DISTINCT warehouse FROM boxes WHERE contents  =  'Rocks' OR contents  =  'Scissors'
SELECT DISTINCT warehouse FROM boxes WHERE contents  =  'Rocks' OR contents  =  'Scissors'
SELECT T1.location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Rocks' INTERSECT SELECT T1.location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.code  =  T2.warehouse WHERE T2.contents  =  'Scissors'
SELECT DISTINCT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T2.Contents  =  'Rocks' INTERSECT SELECT DISTINCT T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T2.Contents  =  'Scissors'
SELECT code ,  contents FROM Boxes ORDER BY value
SELECT code ,  contents FROM Boxes ORDER BY value
SELECT code ,  contents FROM Boxes ORDER BY value LIMIT 1
SELECT code ,  contents FROM Boxes ORDER BY value LIMIT 1
SELECT DISTINCT contents FROM boxes WHERE value  >  (SELECT avg(value) FROM boxes)
SELECT DISTINCT contents FROM boxes WHERE value  >  (SELECT avg(value) FROM boxes)
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents
SELECT DISTINCT contents FROM boxes ORDER BY contents ASC
SELECT code FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  'Rocks')
SELECT code FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  'Rocks')
SELECT code ,  contents FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  'Scissors')
SELECT code ,  contents FROM Boxes WHERE value  >  (SELECT max(value) FROM Boxes WHERE contents  =  'Scissors')
SELECT sum(T1.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.capacity  =  (SELECT max(capacity) FROM warehouses)
SELECT sum(T1.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.capacity  =  (SELECT max(capacity) FROM warehouses)
SELECT warehouse ,  avg(value) FROM boxes GROUP BY warehouse HAVING avg(value)  >  150
SELECT avg(T1.value) ,  T2.location FROM boxes AS T1 JOIN Warehouses AS T2 ON T1.warehouse  =  T2.code GROUP BY T2.location HAVING avg(T1.value)  >  150
SELECT sum(value) ,  count(*) ,  contents FROM Boxes GROUP BY contents
SELECT sum(value) ,  count(*) ,  contents FROM Boxes GROUP BY contents
SELECT sum(capacity) ,  avg(capacity) ,  max(capacity) ,  LOCATION FROM Warehouses GROUP BY LOCATION
SELECT sum(capacity) ,  avg(capacity) ,  max(capacity) ,  LOCATION FROM Warehouses GROUP BY LOCATION
SELECT sum(capacity) FROM Warehouses
SELECT sum(capacity) FROM Warehouses
SELECT max(T1.value) ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code GROUP BY T2.location
SELECT max(T1.value) ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code GROUP BY T2.location
SELECT Warehouse ,  COUNT(*) FROM Boxes GROUP BY Warehouse
SELECT count(*) ,  warehouse FROM Boxes GROUP BY warehouse
SELECT count(DISTINCT LOCATION) FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code  =  T2.Warehouse WHERE T2.Contents  =  'Rocks'
SELECT count(DISTINCT Warehouse) FROM Boxes WHERE Contents  =  'Rocks'
SELECT T1.code ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code
SELECT T1.code ,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code
SELECT code FROM boxes AS T1 JOIN Warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago'
SELECT code FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago'
SELECT count(*) ,  warehouse FROM Boxes GROUP BY warehouse
SELECT count(*) ,  warehouse FROM Boxes GROUP BY warehouse
SELECT count(DISTINCT contents) ,  warehouse FROM boxes GROUP BY warehouse
SELECT count(DISTINCT contents) ,  warehouse FROM boxes GROUP BY warehouse
SELECT code FROM Warehouses WHERE capacity < code
SELECT DISTINCT Warehouse FROM Boxes GROUP BY Warehouse HAVING count(*)  >  capacity
SELECT sum(value) FROM boxes WHERE warehouse NOT IN (SELECT code FROM warehouses WHERE LOCATION  =  'Chicago')
SELECT sum(value) FROM boxes WHERE warehouse NOT IN (SELECT code FROM warehouses WHERE LOCATION  =  'Chicago')
SELECT university_name ,  city ,  state FROM university ORDER BY university_name
SELECT university_name ,  city ,  state FROM university ORDER BY university_name
SELECT count(*) FROM university WHERE state  =  'Illinois' OR state  =  'Ohio'
SELECT count(*) FROM university WHERE state  =  'Illinois' OR state  =  'Ohio'
SELECT max(Enrollment) ,  avg(Enrollment) ,  min(Enrollment) FROM university
SELECT max(Enrollment) ,  avg(Enrollment) ,  min(Enrollment) FROM university
SELECT Team_Name FROM university WHERE Enrollment  >  (SELECT avg(Enrollment) FROM university)
SELECT Team_Name FROM university WHERE Enrollment  >  (SELECT avg(Enrollment) FROM university)
SELECT DISTINCT home_conference FROM university
SELECT DISTINCT home_conference FROM university
SELECT home_conference ,  count(*) FROM university GROUP BY home_conference
SELECT home_conference ,  count(*) FROM university GROUP BY home_conference
SELECT state FROM university GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT state FROM university GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT home_conference FROM university GROUP BY home_conference HAVING avg(enrollment)  >  2000
SELECT home_conference FROM university GROUP BY home_conference HAVING avg(enrollment)  >  2000
SELECT home_conference FROM university GROUP BY home_conference ORDER BY sum(enrollment) LIMIT 1
SELECT home_conference FROM university GROUP BY home_conference ORDER BY sum(enrollment) LIMIT 1
SELECT major_name ,  major_code FROM major ORDER BY major_code
SELECT major_name ,  major_code FROM major ORDER BY major_code
SELECT T3.major_name ,  T1.rank FROM major_ranking AS T1 JOIN university AS T2 ON T1.university_id  =  T2.university_id JOIN major AS T3 ON T1.major_id  =  T3.major_id WHERE T2.university_name  =  "Augustana College"
SELECT T1.rank ,  T3.major_name FROM major_ranking AS T1 JOIN university AS T2 ON T1.university_id  =  T2.university_id JOIN major AS T3 ON T1.major_id  =  T3.major_id WHERE T2.university_name  =  "Augustana College"
SELECT T1.University_Name ,  T1.City ,  T1.State FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID  =  T2.University_ID JOIN major AS T3 ON T2.Major_ID  =  T3.Major_ID WHERE T3.Major_Name  =  "Accounting" AND T2.Rank  =  1
SELECT T1.University_Name ,  T1.City ,  T1.State FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T2.Major_ID  =  1 ORDER BY T1.University_Name LIMIT 1
SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T2.Rank  =  1 GROUP BY T1.University_Name ORDER BY count(*) DESC LIMIT 1
SELECT T2.university_name FROM major_ranking AS T1 JOIN university AS T2 ON T1.university_id  =  T2.university_id WHERE T1.rank  =  1 GROUP BY T1.university_id ORDER BY count(*) DESC LIMIT 1
SELECT university_name FROM university EXCEPT SELECT T2.university_name FROM major_ranking AS T1 JOIN university AS T2 ON T1.university_id  =  T2.university_id WHERE T1.rank  =  1
SELECT university_name FROM university WHERE university_id NOT IN (SELECT university_id FROM major_ranking WHERE rank  =  1)
SELECT T1.University_Name FROM university AS T1 JOIN major AS T2 ON T1.Major_1  =  T2.Major_ID JOIN major_ranking AS T3 ON T2.Major_ID  =  T3.Major_ID WHERE T2.Major_Name  =  "Accounting" INTERSECT SELECT T1.University_Name FROM university AS T1 JOIN major AS T2 ON T1.Major_1  =  T2.Major_ID JOIN major_ranking AS T3 ON T2.Major_ID  =  T3.Major_ID WHERE T2.Major_Name  =  "Urban Education"
SELECT T1.University_Name FROM university AS T1 JOIN major AS T2 ON T1.Major_1  =  T2.Major_ID JOIN major_ranking AS T3 ON T2.Major_ID  =  T3.Major_ID WHERE T2.Major_Name  =  "Accounting" INTERSECT SELECT T1.University_Name FROM university AS T1 JOIN major AS T2 ON T1.Major_1  =  T2.Major_ID JOIN major_ranking AS T3 ON T2.Major_ID  =  T3.Major_ID WHERE T2.Major_Name  =  "Urban Education"
SELECT T1.University_Name ,  T2.Rank FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T1.State  =  'Wisconsin'
SELECT T1.University_Name ,  T2.Rank FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T1.State  =  "Wisconsin"
SELECT T1.University_Name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Research_point DESC LIMIT 1
SELECT T1.University_Name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Research_point DESC LIMIT 1
SELECT T1.University_Name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Reputation_point ASC
SELECT T1.University_Name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Reputation_point ASC
SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID  =  T2.University_ID JOIN major AS T3 ON T2.Major_ID  =  T3.Major_ID WHERE T3.Major_Name  =  "Accounting" AND T2.Rank  >=  3
SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T2.Major_ID  =  3 AND T2.Rank  >=  3
SELECT sum(T1.Enrollment) FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T2.Rank  <=  5
SELECT sum(T1.enrollment) FROM university AS T1 JOIN overall_ranking AS T2 ON T1.university_id  =  T2.university_id WHERE T2.rank  <=  5
SELECT T1.University_Name ,  T2.Citation_point FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T2.Reputation_point  >=  3 ORDER BY T2.Citation_point DESC
SELECT T1.University_Name ,  T2.Citation_point FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Reputation_point DESC LIMIT 3
SELECT state FROM university WHERE enrollment  <  3000 GROUP BY state HAVING count(*)  >  2
SELECT State FROM university WHERE Enrollment  <  3000 GROUP BY State HAVING COUNT(*)  >  2
SELECT title FROM Movies WHERE rating  =  ""
SELECT title FROM Movies WHERE code NOT IN (SELECT code FROM Rating)
SELECT title FROM Movies WHERE rating  =  'G'
SELECT title FROM Movies WHERE rating  =  'G'
SELECT T2.Title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.Code WHERE T1.Name  =  'Odeon'
SELECT T2.Title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.Code WHERE T1.Name  =  'Odeon'
SELECT T1.name ,  T2.title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.code
SELECT T1.name ,  T2.title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.code
SELECT count(*) FROM Movies WHERE rating  =  'G'
SELECT count(*) FROM Movies WHERE rating  =  'G'
SELECT count(DISTINCT movie) FROM MovieTheaters
SELECT count(DISTINCT movie) FROM MovieTheaters
SELECT count(DISTINCT movie) FROM MovieTheaters
SELECT count(DISTINCT movie) FROM MovieTheaters
SELECT count(DISTINCT name) FROM MovieTheaters
SELECT count(DISTINCT name) FROM MovieTheaters
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT T1.name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.code WHERE T2.rating  =  'G' OR T2.rating  =  'PG'
SELECT T1.name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.code WHERE T2.rating  =  'G' OR T2.rating  =  'PG'
SELECT DISTINCT movie FROM MovieTheaters WHERE name  =  'Odeon' OR name  =  'Imperial'
SELECT T2.Title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.Code WHERE T1.Name  =  'Odeon' OR T1.Name  =  'Imperial'
SELECT T2.Movie FROM MovieTheaters AS T1 JOIN MovieTheaters AS T2 ON T1.Movie  =  T2.Movie WHERE T1.Name  =  'Odeon' INTERSECT SELECT T2.Movie FROM MovieTheaters AS T1 JOIN MovieTheaters AS T2 ON T1.Movie  =  T2.Movie WHERE T1.Name  =  'Imperial'
SELECT movie FROM MovieTheaters WHERE name  =  'Odeon' INTERSECT SELECT movie FROM MovieTheaters WHERE name  =  'Imperial'
SELECT title FROM Movies EXCEPT SELECT T2.title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.code WHERE T1.name  =  'Odeon'
SELECT title FROM Movies EXCEPT SELECT T2.title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.code WHERE T1.name  =  'Odeon'
SELECT title FROM Movies ORDER BY title
SELECT title FROM Movies ORDER BY title
SELECT title FROM Movies ORDER BY rating
SELECT title FROM Movies ORDER BY rating
SELECT name FROM MovieTheaters WHERE movie  =  (SELECT count(*) FROM MovieTheaters GROUP BY movie ORDER BY count(*) DESC LIMIT 1)
SELECT name FROM MovieTheaters WHERE movie  =  (SELECT max(movie) FROM MovieTheaters)
SELECT T2.title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.Code GROUP BY T2.title ORDER BY count(*) DESC LIMIT 1
SELECT T2.Title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.Code GROUP BY T1.Movie ORDER BY count(*) DESC LIMIT 1
SELECT count(*) ,  rating FROM Movies GROUP BY rating
SELECT count(*) ,  rating FROM Movies GROUP BY rating
SELECT count(*) FROM Movies WHERE rating != 'null'
SELECT count(*) FROM Movies WHERE rating != 'null'
SELECT name FROM MovieTheaters WHERE movie  !=  'null'
SELECT DISTINCT name FROM MovieTheaters WHERE movie  !=  'null'
SELECT name FROM MovieTheaters WHERE movie  =  "null"
SELECT name FROM MovieTheaters EXCEPT SELECT T1.name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.movie  =  T2.code
SELECT T1.name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.code WHERE T2.rating  =  'G'
SELECT T1.name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.code WHERE T2.rating  =  'G'
SELECT title FROM Movies
SELECT title FROM Movies
SELECT DISTINCT rating FROM Movies
SELECT DISTINCT rating FROM Movies
SELECT * FROM Movies WHERE Rating  =  ""
SELECT * FROM Movies WHERE Rating  =  "null"
SELECT title FROM Movies EXCEPT SELECT T2.title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.code
SELECT title FROM Movies EXCEPT SELECT T2.title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie  =  T2.code
SELECT Recipient FROM Package ORDER BY Weight DESC LIMIT 1
SELECT T2.Name FROM `Package` AS T1 JOIN `Client` AS T2 ON T1.Recipient  =  T2.AccountNumber WHERE T1.Weight  =  (SELECT max(Weight) FROM `Package`)
SELECT sum(T1.weight) FROM Package AS T1 JOIN Client AS T2 ON T1.sender  =  T2.accountnumber WHERE T2.name  =  "Leo Wong"
SELECT sum(T1.weight) FROM Package AS T1 JOIN Client AS T2 ON T1.sender  =  T2.accountnumber WHERE T2.name  =  "Leo Wong"
SELECT POSITION FROM Employee WHERE Name  =  "Amy Wong"
SELECT POSITION FROM Employee WHERE Name  =  "Amy Wong"
SELECT Salary ,  POSITION FROM Employee WHERE Name  =  "Turanga Leela"
SELECT Salary ,  POSITION FROM Employee WHERE Name  =  "Turanga Leela"
SELECT avg(salary) FROM Employee WHERE POSITION  =  "Intern"
SELECT avg(salary) FROM Employee WHERE POSITION  =  "Intern"
SELECT level FROM Has_Clearance WHERE employee  =  (SELECT id FROM Employees WHERE name  =  "Physician")
SELECT T1.level FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.employee  =  T2.employeeid WHERE T2.position  =  "Physician"
SELECT T1.PackageNumber FROM `Package` AS T1 JOIN `Client` AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT count(*) FROM Package AS T1 JOIN Employee AS T2 ON T1.Sender  =  T2.EmployeeID WHERE T2.Name  =  "Leo Wong"
SELECT T1.PackageNumber FROM `Package` AS T1 JOIN `Client` AS T2 ON T1.Recipient  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT T1.PackageNumber FROM `Package` AS T1 JOIN `Client` AS T2 ON T1.Recipient  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT T1.packageNumber FROM Package AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong" UNION SELECT T1.packageNumber FROM Package AS T1 JOIN Client AS T2 ON T1.Recipient  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT DISTINCT PackageNumber FROM Package AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong" UNION SELECT DISTINCT PackageNumber FROM Package AS T1 JOIN Client AS T2 ON T1.Recipient  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT count(*) FROM Package AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "Ogden Wernstrom" INTERSECT SELECT count(*) FROM Package AS T1 JOIN Client AS T2 ON T1.Recipient  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT count(*) FROM Package AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber JOIN Client AS T3 ON T1.Recipient  =  T3.AccountNumber WHERE T2.Name  =  "Ogden Wernstrom" AND T3.Name  =  "Leo Wong"
SELECT T1.Contents FROM `Package` AS T1 JOIN `Client` AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "John Zoidfarb"
SELECT T1.Contents FROM `Package` AS T1 JOIN `Client` AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "John Zoidfarb"
SELECT T1.PackageNumber ,  T1.Weight FROM `Package` AS T1 JOIN `Client` AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name LIKE "%John%" ORDER BY T1.Weight DESC LIMIT 1
SELECT packageNumber ,  weight FROM `Package` AS T1 JOIN `Client` AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name LIKE "John%" OR T2.Name LIKE "something similar" ORDER BY weight DESC LIMIT 1
SELECT packageNumber ,  weight FROM Package ORDER BY weight LIMIT 3
SELECT packageNumber ,  weight FROM Package ORDER BY weight LIMIT 3
SELECT T1.name ,  count(*) FROM `Client` AS T1 JOIN `Package` AS T2 ON T1.accountnumber  =  T2.sender GROUP BY T2.sender ORDER BY count(*) DESC LIMIT 1
SELECT T2.Name ,  count(*) FROM `Package` AS T1 JOIN `Client` AS T2 ON T1.Sender  =  T2.AccountNumber GROUP BY T1.Sender ORDER BY count(*) DESC LIMIT 1
SELECT T1.name ,  count(*) FROM `Client` AS T1 JOIN `Package` AS T2 ON T1.accountnumber  =  T2.recipient GROUP BY T2.recipient ORDER BY count(*) ASC LIMIT 1
SELECT Recipient ,  min(PackageNumber) FROM Package GROUP BY Recipient
SELECT T1.Name FROM `Client` AS T1 JOIN `Package` AS T2 ON T1.AccountNumber  =  T2.Sender GROUP BY T2.Sender HAVING count(*)  >  1
SELECT T2.Name FROM `Package` AS T1 JOIN `Client` AS T2 ON T1.Sender  =  T2.AccountNumber GROUP BY T1.Sender HAVING count(*)  >  1
SELECT Coordinates FROM Planet WHERE Name  =  "Mars"
SELECT Coordinates FROM Planet WHERE Name  =  "Mars"
SELECT Name ,  Coordinates FROM Planet ORDER BY Name ASC
SELECT Name ,  Coordinates FROM Planet ORDER BY Name
SELECT ShipmentID FROM shipment WHERE Manager  =  (SELECT Manager FROM shipment WHERE Planet  =  "Earth")
SELECT ShipmentID FROM shipment WHERE Manager  =  (SELECT Manager FROM shipment WHERE Date  =  (SELECT Date FROM shipment WHERE ShipmentID  =  3))
SELECT DISTINCT Date FROM shipment
SELECT Date FROM shipment
SELECT ShipmentID FROM shipment AS T1 JOIN planet AS T2 ON T1.Planet  =  T2.PlanetID WHERE T2.Name  =  "Mars"
SELECT ShipmentID FROM shipment AS T1 JOIN planet AS T2 ON T1.planet  =  T2.planetid WHERE T2.name  =  "Mars"
SELECT ShipmentID FROM shipment AS T1 JOIN planet AS T2 ON T1.Planet  =  T2.PlanetID WHERE T2.Name  =  "Mars" AND T1.Manager  =  (SELECT Manager FROM shipment WHERE Planet  =  (SELECT PlanetID FROM planet WHERE Name  =  "Mars"))
SELECT ShipmentID FROM shipment AS T1 JOIN planet AS T2 ON T1.planet  =  T2.planetid WHERE T2.name  =  "Mars" AND T1.manager  =  "Turanga Leela"
SELECT ShipmentID FROM shipment WHERE Planet IN ( SELECT PlanetID FROM planet WHERE Name  =  "Mars" ) UNION SELECT ShipmentID FROM shipment WHERE Manager IN ( SELECT Manager FROM shipment WHERE Planet IN ( SELECT PlanetID FROM planet WHERE Name  =  "Mars" ) )
SELECT T1.ShipmentID FROM shipment AS T1 JOIN planet AS T2 ON T1.Planet  =  T2.PlanetID WHERE T2.Name  =  "Mars" AND T1.Manager  =  (SELECT Manager FROM shipment WHERE Planet  =  (SELECT PlanetID FROM planet WHERE Name  =  "Mars"))
SELECT T2.name ,  count(*) FROM `shipment` AS T1 JOIN planet AS T2 ON T1.planet  =  T2.planet_id GROUP BY T1.planet
SELECT Planet ,  COUNT(*) FROM shipment GROUP BY Planet
SELECT T2.name FROM shipment AS T1 JOIN planet AS T2 ON T1.planet  =  T2.planetid GROUP BY T1.planet ORDER BY count(*) DESC LIMIT 1
SELECT T2.Name FROM `shipment` AS T1 JOIN `planet` AS T2 ON T1.Planet  =  T2.PlanetID GROUP BY T1.Planet ORDER BY count(*) DESC LIMIT 1
SELECT manager ,  count(*) FROM shipment GROUP BY manager
SELECT count(*) ,  T1.manager FROM shipment AS T1 JOIN planet AS T2 ON T1.planet  =  T2.planet_id GROUP BY T1.manager
SELECT sum(T1.weight) FROM `Package` AS T1 JOIN `Shipment` AS T2 ON T1.shipment  =  T2.shipmentid JOIN `Planet` AS T3 ON T2.planet  =  T3.planetid WHERE T3.name  =  "Mars"
SELECT sum(T1.weight) FROM `Package` AS T1 JOIN `Shipment` AS T2 ON T1.shipment  =  T2.shipmentid JOIN `Planet` AS T3 ON T2.planet  =  T3.planetid WHERE T3.name  =  "Mars"
SELECT sum(T1.weight) ,  T3.name FROM `Package` AS T1 JOIN `Shipment` AS T2 ON T1.shipment  =  T2.shipmentid JOIN `Planet` AS T3 ON T2.planet  =  T3.planetid GROUP BY T3.name
SELECT sum(T1.weight) ,  T3.name FROM `Package` AS T1 JOIN `Shipment` AS T2 ON T1.shipment  =  T2.shipmentid JOIN `Planet` AS T3 ON T2.planet  =  T3.planetid GROUP BY T3.name
SELECT T1.planet FROM `shipment` AS T1 JOIN `package` AS T2 ON T1.shipmentid  =  T2.shipment GROUP BY T1.planet HAVING sum(T2.weight)  >  30
SELECT T3.name FROM shipment AS T1 JOIN package AS T2 ON T1.shipmentid  =  T2.shipment JOIN planet AS T3 ON T1.planet  =  T3.planetid GROUP BY T1.planet HAVING sum(T2.weight)  >  30
SELECT T1.PackageNumber FROM `Package` AS T1 JOIN `Shipment` AS T2 ON T1.Shipment  =  T2.ShipmentID JOIN `Planet` AS T3 ON T2.Planet  =  T3.PlanetID JOIN `Client` AS T4 ON T1.Sender  =  T4.AccountNumber WHERE T3.Name  =  "Omicron Persei 8" AND T4.Name  =  "Zapp Brannigan"
SELECT count(*) FROM `Package` AS T1 JOIN `Shipment` AS T2 ON T1.Shipment  =  T2.ShipmentID JOIN `Employee` AS T3 ON T2.Manager  =  T3.EmployeeID WHERE T3.Name  =  "Zapp Brannigan" AND T2.Planet  =  "Omicron Persei 8"
SELECT T1.PackageNumber FROM `Package` AS T1 JOIN `Shipment` AS T2 ON T1.Shipment  =  T2.ShipmentID JOIN `Employee` AS T3 ON T2.Manager  =  T3.EmployeeID WHERE T2.Planet  =  "Omicron Persei 8" OR T3.Name  =  "Zapp Brannigan"
SELECT count(*) FROM `Package` AS T1 JOIN `Shipment` AS T2 ON T1.Shipment  =  T2.ShipmentID JOIN `Employee` AS T3 ON T2.Manager  =  T3.EmployeeID WHERE T2.Planet  =  "Omicron Persei 8" OR T3.Name  =  "Zapp Brannigan"
SELECT packageNumber ,  weight FROM Package WHERE weight BETWEEN 10 AND 30
SELECT packageNumber ,  weight FROM Package WHERE weight BETWEEN 10 AND 30
SELECT T1.name FROM Employee AS T1 JOIN Has_Clearance AS T2 ON T1.employeeid  =  T2.employee JOIN Planet AS T3 ON T3.planetid  =  T2.planet WHERE T3.name != "Mars"
SELECT Name FROM Employee EXCEPT SELECT T1.Name FROM Employee AS T1 JOIN Has_Clearance AS T2 ON T1.EmployeeID  =  T2.Employee JOIN Planet AS T3 ON T2.Planet  =  T3.PlanetID WHERE T3.Name  =  "Mars"
SELECT T1.Name FROM Employee AS T1 JOIN Has_Clearance AS T2 ON T1.EmployeeID  =  T2.Employee WHERE T2.Planet  =  (SELECT PlanetID FROM Planet WHERE Name  =  "Omega III")
SELECT T1.Name FROM Employee AS T1 JOIN Has_Clearance AS T2 ON T1.EmployeeID  =  T2.Employee JOIN Planet AS T3 ON T3.PlanetID  =  T2.Planet WHERE T3.Name  =  "Omega III"
SELECT T2.Name FROM Has_Clearance AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID GROUP BY T1.Planet HAVING COUNT(*)  =  1
SELECT T2.Name FROM Has_Clearance AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID GROUP BY T1.Planet HAVING COUNT(*)  =  1
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary  >  (SELECT avg(Salary) FROM Employee) OR Salary  >  5000
SELECT Name FROM Employee WHERE Salary  >  (SELECT avg(Salary) FROM Employee) OR Salary  >  5000
SELECT count(*) FROM Employee WHERE employeeid NOT IN (SELECT employee FROM Has_Clearance AS T1 JOIN Planet AS T2 ON T1.planet  =  T2.planetid WHERE T2.name  =  "Mars")
SELECT count(*) FROM Employee WHERE employeeid NOT IN (SELECT employee FROM Has_Clearance AS T1 JOIN Planet AS T2 ON T1.planet  =  T2.planetid WHERE T2.name  =  "Mars")
SELECT count(*) FROM game
SELECT count(*) FROM game
SELECT Title ,  Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT title ,  developers FROM game ORDER BY units_sold_millions DESC
SELECT avg(Units_sold_Millions) FROM game WHERE Developers != "Nintendo"
SELECT avg(Units_sold_Millions) FROM game WHERE Developers != "Nintendo"
SELECT Platform_name ,  Market_district FROM platform
SELECT platform_name ,  market_district FROM platform
SELECT platform_name ,  platform_id FROM platform WHERE download_rank  =  1
SELECT platform_name ,  platform_id FROM platform WHERE download_rank  =  1
SELECT max(Rank_of_the_year) ,  min(Rank_of_the_year) FROM player
SELECT max(Rank_of_the_year) ,  min(Rank_of_the_year) FROM player
SELECT count(*) FROM player WHERE rank_of_the_year  <  3
SELECT count(*) FROM player WHERE rank_of_the_year  <=  3
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT player_name ,  college FROM player ORDER BY rank_of_the_year DESC
SELECT player_name ,  college FROM player ORDER BY rank_of_the_year DESC
SELECT T2.player_name ,  T2.rank_of_the_year FROM game_player AS T1 JOIN player AS T2 ON T1.player_id  =  T2.player_id JOIN game AS T3 ON T1.game_id  =  T3.game_id WHERE T3.title  =  "Super Mario World"
SELECT T2.player_name ,  T2.rank_of_the_year FROM game_player AS T1 JOIN player AS T2 ON T1.player_id  =  T2.player_id JOIN game AS T3 ON T1.game_id  =  T3.game_id WHERE T3.title  =  "Super Mario World"
SELECT DISTINCT T1.Developers FROM `game` AS T1 JOIN `game_player` AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN `player` AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"
SELECT DISTINCT T1.Developers FROM `game` AS T1 JOIN `game_player` AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN `player` AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"
SELECT avg(T3.Units_sold_Millions) FROM game_player AS T1 JOIN game AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T1.Player_ID  =  T3.Player_ID WHERE T3.Position  =  "Guard"
SELECT avg(T3.Units_sold_Millions) FROM game_player AS T1 JOIN game AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T1.Player_ID  =  T3.Player_ID WHERE T3.Position  =  "Guard"
SELECT T1.Title ,  T2.Platform_name FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID
SELECT T1.Title ,  T2.Platform_name FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID
SELECT T1.Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID WHERE T2.Market_district  =  "Asia" OR T2.Market_district  =  "USA"
SELECT T1.Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID WHERE T2.Market_district  =  "Asia" OR T2.Market_district  =  "USA"
SELECT Franchise ,  COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise ,  COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*)  >=  2
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*)  >=  2
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT T3.Title FROM game_player AS T1 JOIN player AS T2 ON T1.Player_ID  =  T2.Player_ID JOIN game AS T3 ON T1.Game_ID  =  T3.Game_ID WHERE T2.College  =  "Oklahoma" INTERSECT SELECT T3.Title FROM game_player AS T1 JOIN player AS T2 ON T1.Player_ID  =  T2.Player_ID JOIN game AS T3 ON T1.Game_ID  =  T3.Game_ID WHERE T2.College  =  "Auburn"
SELECT T1.Title FROM `game` AS T1 JOIN `game_player` AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN `player` AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Oklahoma" OR T3.College  =  "Auburn"
SELECT DISTINCT Franchise FROM game
SELECT DISTINCT Franchise FROM game
SELECT title FROM game WHERE game_id NOT IN (SELECT game_id FROM game_player AS T1 JOIN player AS T2 ON T1.player_id  =  T2.player_id WHERE T2.position  =  'Guard')
SELECT title FROM game WHERE game_id NOT IN (SELECT game_id FROM game_player AS T1 JOIN player AS T2 ON T1.player_id  =  T2.player_id WHERE T2.position  =  'Guard')
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press WHERE Year_Profits_billion  >  15 OR Month_Profits_billion  >  1
SELECT Name FROM press WHERE Year_Profits_billion  >  15 OR Month_Profits_billion  >  1
SELECT avg(Year_Profits_billion) ,  max(Year_Profits_billion) FROM press
SELECT avg(Year_Profits_billion) ,  max(Year_Profits_billion) ,  Name FROM press GROUP BY Name
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1 UNION SELECT Name FROM press ORDER BY Month_Profits_billion ASC LIMIT 1
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1 UNION SELECT Name FROM press ORDER BY Month_Profits_billion ASC LIMIT 1
SELECT count(*) FROM author WHERE age  <  30
SELECT count(*) FROM author WHERE age  <  30
SELECT avg(age) ,  gender FROM author GROUP BY gender
SELECT gender ,  avg(age) FROM author GROUP BY gender
SELECT count(*) ,  gender FROM author WHERE age  >  30 GROUP BY gender
SELECT count(*) ,  gender FROM author WHERE age  >  30 GROUP BY gender
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Book_Series ,  COUNT(*) FROM book GROUP BY Book_Series
SELECT count(*) ,  book_series FROM book GROUP BY book_series
SELECT title ,  release_date FROM book ORDER BY sale_amount DESC LIMIT 5
SELECT title ,  release_date FROM book ORDER BY sale_amount DESC LIMIT 5
SELECT Book_Series FROM book WHERE Sale_Amount  >  1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount  <  500
SELECT Book_Series FROM book WHERE Sale_Amount  >  1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount  <  500
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID WHERE T2.Book_Series  =  "MM" INTERSECT SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID WHERE T2.Book_Series  =  "LT"
SELECT T2.Name FROM book AS T1 JOIN author AS T2 ON T1.Author_ID  =  T2.Author_ID WHERE T1.Book_Series  =  "MM" INTERSECT SELECT T2.Name FROM book AS T1 JOIN author AS T2 ON T1.Author_ID  =  T2.Author_ID WHERE T1.Book_Series  =  "LT"
SELECT Name ,  Age FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book)
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book)
SELECT T2.Name FROM book AS T1 JOIN author AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.Author_ID HAVING COUNT(*)  >  1
SELECT T1.Name FROM `author` AS T1 JOIN `book` AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.Author_ID HAVING COUNT(*)  >  1
SELECT T1.title ,  T2.name ,  T3.name FROM book AS T1 JOIN author AS T2 ON T1.author_id  =  T2.author_id JOIN press AS T3 ON T1.press_id  =  T3.press_id ORDER BY T1.sale_amount DESC LIMIT 3
SELECT T1.title ,  T2.name ,  T3.name FROM book AS T1 JOIN author AS T2 ON T1.author_id  =  T2.author_id JOIN press AS T3 ON T1.press_id  =  T3.press_id ORDER BY T1.sale_amount DESC LIMIT 3
SELECT T1.name ,  sum(T2.sale_amount) FROM press AS T1 JOIN book AS T2 ON T1.press_id  =  T2.press_id GROUP BY T1.press_id
SELECT T1.name ,  sum(T2.sale_amount) FROM press AS T1 JOIN book AS T2 ON T1.press_id  =  T2.press_id GROUP BY T1.press_id
SELECT T2.name ,  count(*) FROM book AS T1 JOIN press AS T2 ON T1.press_id  =  T2.press_id WHERE T1.sale_amount  >  1000 GROUP BY T1.press_id
SELECT T2.Name ,  count(*) FROM book AS T1 JOIN press AS T2 ON T1.Press_ID  =  T2.Press_ID WHERE T1.Sale_Amount  >  1000 GROUP BY T1.Press_ID
SELECT t1.name FROM author AS t1 JOIN book AS t2 ON t1.author_id  =  t2.author_id ORDER BY t2.sale_amount DESC LIMIT 1
SELECT T2.Name FROM book AS T1 JOIN author AS T2 ON T1.Author_ID  =  T2.Author_ID ORDER BY T1.Sale_Amount DESC LIMIT 1
SELECT T1.Name ,  T1.Gender FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.Author_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name ,  T1.Gender FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.Author_ID ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book WHERE Press_ID  =  (SELECT Press_ID FROM press WHERE Name  =  "Accor"))
SELECT name FROM author WHERE author_id NOT IN (SELECT author_id FROM book AS T1 JOIN press AS T2 ON T1.press_id  =  T2.press_id WHERE T2.name  =  "Accor")
SELECT T2.name ,  T2.year_profits_billion FROM book AS T1 JOIN press AS T2 ON T1.press_id  =  T2.press_id GROUP BY T1.press_id HAVING count(*)  >  2
SELECT T2.name ,  T2.year_profits_billion FROM book AS T1 JOIN press AS T2 ON T1.press_id  =  T2.press_id GROUP BY T1.press_id HAVING count(*)  >  2
SELECT count(*) FROM Authors
SELECT author_name FROM authors
SELECT author_name ,  other_details FROM Authors
SELECT other_details FROM Authors WHERE author_name  =  "Addison Denesik"
SELECT count(*) FROM Documents
SELECT author_name FROM documents WHERE document_id = 4
SELECT author_name FROM documents WHERE document_name  =  "Travel to Brazil"
SELECT count(*) FROM documents WHERE author_name  =  "Era Kerluke"
SELECT document_name ,  document_description FROM Documents
SELECT document_id ,  document_name FROM documents WHERE author_name  =  "Bianka Cummings"
SELECT author_name ,  other_details FROM documents WHERE document_name  =  "Travel to China"
SELECT author_name ,  count(*) FROM Documents GROUP BY author_name
SELECT author_name FROM documents GROUP BY author_name ORDER BY count(*) DESC LIMIT 1
SELECT author_name FROM documents GROUP BY author_name HAVING count(*)  >=  2
SELECT count(*) FROM Business_Processes
SELECT next_process_id ,  process_name ,  process_description FROM Business_Processes WHERE process_id = 9
SELECT process_name FROM Business_processes WHERE next_process_id  =  (SELECT next_process_id FROM Business_processes WHERE process_id  =  9)
SELECT count(*) FROM Process_outcomes
SELECT process_outcome_code ,  process_outcome_description FROM Process_outcomes
SELECT process_outcome_description FROM Process_outcomes WHERE process_outcome_code  =  "working"
SELECT count(*) FROM Process_Status
SELECT process_status_code ,  process_status_description FROM Process_Status
SELECT process_status_description FROM Process_Status WHERE process_status_code  =  "ct"
SELECT count(*) FROM Staff
SELECT staff_id ,  staff_details FROM Staff
SELECT staff_details FROM Staff WHERE staff_id = 100
SELECT count(*) FROM Ref_Staff_Roles
SELECT staff_role_code ,  staff_role_description FROM Ref_Staff_Roles
SELECT staff_role_description FROM Ref_Staff_Roles WHERE staff_role_code  =  "HR"
SELECT count(DISTINCT document_id) FROM Documents_processes
SELECT DISTINCT process_id FROM Documents_processes
SELECT document_id FROM Documents EXCEPT SELECT document_id FROM Documents_Processes
SELECT process_id FROM Business_Processes WHERE process_id NOT IN (SELECT process_id FROM Documents_Processes)
SELECT T2.process_outcome_description ,  T3.process_status_description FROM Documents_Processes AS T1 JOIN Process_outcomes AS T2 ON T1.process_outcome_code  =  T2.process_outcome_code JOIN Process_status AS T3 ON T1.process_status_code  =  T3.process_status_code WHERE T1.document_id  =  0
SELECT t2.process_name FROM documents AS t1 JOIN business_processes AS t2 ON t1.document_id  =  t2.process_id WHERE t1.document_name  =  "Travel to Brazil"
SELECT process_id ,  count(*) FROM Documents_processes GROUP BY process_id
SELECT count(*) FROM Staff_in_Processes WHERE document_id = 0 AND process_id = 9
SELECT staff_id ,  count(*) FROM Staff_in_Processes GROUP BY staff_id
SELECT staff_role_code ,  count(*) FROM Staff_in_Processes GROUP BY staff_role_code
SELECT count(DISTINCT staff_role_code) FROM Staff_in_Processes WHERE staff_id = 3
SELECT count(*) FROM Agencies
SELECT count(*) FROM Agencies
SELECT agency_id ,  agency_details FROM Agencies
SELECT agency_id ,  agency_details FROM Agencies
SELECT count(*) FROM clients
SELECT count(*) FROM clients
SELECT client_id ,  client_details FROM clients
SELECT client_id ,  client_details FROM clients
SELECT agency_id ,  count(*) FROM clients GROUP BY agency_id
SELECT agency_id ,  count(*) FROM clients GROUP BY agency_id
SELECT T1.agency_id ,  T2.agency_details FROM clients AS T1 JOIN agencies AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.agency_id ,  T2.agency_details FROM clients AS T1 JOIN agencies AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.agency_id ,  T2.agency_details FROM clients AS T1 JOIN agencies AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id HAVING count(*)  >=  2
SELECT T1.agency_id ,  T2.agency_details FROM clients AS T1 JOIN agencies AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id HAVING count(*)  >=  2
SELECT T2.agency_details FROM clients AS T1 JOIN agencies AS T2 ON T1.agency_id  =  T2.agency_id WHERE T1.client_details  =  'Mac'
SELECT T2.agency_details FROM `clients` AS T1 JOIN `agencies` AS T2 ON T1.agency_id  =  T2.agency_id WHERE T1.client_details  =  "Mac"
SELECT T1.client_details ,  T2.agency_details FROM clients AS T1 JOIN agencies AS T2 ON T1.agency_id  =  T2.agency_id
SELECT T1.client_details ,  T2.agency_details FROM clients AS T1 JOIN agencies AS T2 ON T1.agency_id  =  T2.agency_id
SELECT sic_code ,  count(*) FROM clients GROUP BY sic_code
SELECT sic_code ,  count(*) FROM clients GROUP BY sic_code
SELECT client_id ,  client_details FROM clients WHERE sic_code  =  "Bad"
SELECT client_id ,  client_details FROM clients WHERE sic_code  =  "Bad"
SELECT T1.agency_id ,  T2.agency_details FROM clients AS T1 JOIN agencies AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id HAVING count(*)  >  0
SELECT T1.agency_id ,  T2.agency_details FROM clients AS T1 JOIN agencies AS T2 ON T1.agency_id  =  T2.agency_id
SELECT agency_id FROM agencies EXCEPT SELECT agency_id FROM clients
SELECT agency_id FROM agencies EXCEPT SELECT agency_id FROM clients
SELECT count(*) FROM Invoices
SELECT count(*) FROM Invoices
SELECT invoice_id ,  invoice_status ,  invoice_details FROM Invoices
SELECT invoice_id ,  invoice_status ,  invoice_details FROM Invoices
SELECT client_id ,  count(*) FROM Invoices GROUP BY client_id
SELECT client_id ,  count(*) FROM Invoices GROUP BY client_id
SELECT T1.client_id ,  T2.client_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.client_id ,  T1.client_details FROM clients AS T1 JOIN invoices AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id ORDER BY count(*) DESC LIMIT 1
SELECT client_id FROM Invoices GROUP BY client_id HAVING count(*)  >=  2
SELECT client_id FROM Invoices GROUP BY client_id HAVING count(*)  >=  2
SELECT invoice_status ,  count(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status ,  count(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status FROM Invoices GROUP BY invoice_status ORDER BY count(*) DESC LIMIT 1
SELECT invoice_status FROM Invoices GROUP BY invoice_status ORDER BY count(*) DESC LIMIT 1
SELECT T1.invoice_status ,  T1.invoice_details ,  T2.client_id ,  T2.client_details ,  T3.agency_id ,  T3.agency_details FROM invoices AS T1 JOIN clients AS T2 ON T1.client_id  =  T2.client_id JOIN agencies AS T3 ON T2.agency_id  =  T3.agency_id
SELECT T1.invoice_status ,  T1.invoice_details ,  T2.client_id ,  T2.client_details ,  T3.agency_id ,  T3.agency_details FROM invoices AS T1 JOIN clients AS T2 ON T1.client_id  =  T2.client_id JOIN agencies AS T3 ON T2.agency_id  =  T3.agency_id
SELECT meeting_type ,  other_details FROM Meetings
SELECT meeting_type ,  other_details FROM Meetings
SELECT meeting_outcome ,  purpose_of_meeting FROM Meetings
SELECT meeting_outcome ,  purpose_of_meeting FROM Meetings
SELECT T1.payment_id ,  T1.payment_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id WHERE T2.invoice_status  =  'Working'
SELECT T1.payment_id ,  T1.payment_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id WHERE T2.invoice_status  =  "Working"
SELECT invoice_id ,  invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT invoice_id ,  invoice_status FROM invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM payments)
SELECT count(*) FROM Payments
SELECT count(*) FROM Payments
SELECT T1.payment_id ,  T1.invoice_id ,  T2.invoice_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id
SELECT payment_id ,  invoice_id ,  payment_details FROM Payments
SELECT DISTINCT invoice_id ,  payment_details FROM Payments
SELECT DISTINCT invoice_id ,  payment_details FROM Payments
SELECT invoice_id ,  count(*) FROM Payments GROUP BY invoice_id
SELECT invoice_id ,  count(*) FROM Payments GROUP BY invoice_id
SELECT T1.invoice_id ,  T1.invoice_status ,  T1.invoice_details FROM invoices AS T1 JOIN payments AS T2 ON T1.invoice_id  =  T2.invoice_id GROUP BY T1.invoice_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.invoice_id ,  T1.invoice_status ,  T1.invoice_details FROM invoices AS T1 JOIN payments AS T2 ON T1.invoice_id  =  T2.invoice_id GROUP BY T1.invoice_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM Staff
SELECT count(*) FROM Staff
SELECT agency_id ,  count(*) FROM Staff GROUP BY agency_id
SELECT agency_id ,  count(*) FROM Staff GROUP BY agency_id
SELECT T1.agency_id ,  T1.agency_details FROM Agencies AS T1 JOIN Staff AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.agency_id ,  T1.agency_details FROM agencies AS T1 JOIN staff AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT meeting_outcome ,  count(*) FROM Meetings GROUP BY meeting_outcome
SELECT meeting_outcome ,  count(*) FROM Meetings GROUP BY meeting_outcome
SELECT client_id ,  count(*) FROM Meetings GROUP BY client_id
SELECT client_id ,  count(*) FROM Meetings GROUP BY client_id
SELECT meeting_type ,  count(*) FROM Meetings GROUP BY meeting_type
SELECT meeting_type ,  count(*) FROM Meetings GROUP BY meeting_type
SELECT T1.meeting_id ,  T1.meeting_outcome ,  T1.meeting_type ,  T2.client_details FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id
SELECT T1.meeting_id ,  T1.meeting_outcome ,  T1.meeting_type ,  T2.client_details FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id
SELECT meeting_id ,  count(*) FROM Staff_in_Meetings GROUP BY meeting_id
SELECT meeting_id ,  count(*) FROM Staff_in_Meetings GROUP BY meeting_id
SELECT staff_id ,  count(*) FROM Staff_in_Meetings GROUP BY staff_id ORDER BY count(*) LIMIT 1
SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id ORDER BY count(*) ASC LIMIT 1
SELECT count(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT count(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT count(*) FROM `Staff` WHERE staff_id NOT IN (SELECT staff_id FROM `Staff_in_Meetings`)
SELECT count(*) FROM `Staff` WHERE staff_id NOT IN (SELECT staff_id FROM `Staff_in_Meetings`)
SELECT T1.client_id ,  T1.client_details FROM clients AS T1 JOIN invoices AS T2 ON T1.client_id  =  T2.client_id UNION SELECT T1.client_id ,  T1.client_details FROM clients AS T1 JOIN meetings AS T2 ON T1.client_id  =  T2.client_id
SELECT T1.client_id ,  T1.client_details FROM clients AS T1 JOIN invoices AS T2 ON T1.client_id  =  T2.client_id UNION SELECT T1.client_id ,  T1.client_details FROM clients AS T1 JOIN meetings AS T2 ON T1.client_id  =  T2.client_id
SELECT T1.staff_id ,  T1.staff_details FROM Staff AS T1 JOIN Staff_in_Meetings AS T2 ON T1.staff_id  =  T2.staff_id GROUP BY T1.staff_id HAVING count(*)  >=  1 AND T1.staff_details LIKE '%s%'
SELECT T1.staff_id ,  T1.staff_details FROM Staff AS T1 JOIN Staff_in_Meetings AS T2 ON T1.staff_id  =  T2.staff_id WHERE T1.staff_details LIKE "%s%"
SELECT T1.client_id ,  T1.sic_code ,  T1.agency_id FROM clients AS T1 JOIN invoices AS T2 ON T1.client_id  =  T2.client_id JOIN meetings AS T3 ON T1.client_id  =  T3.client_id GROUP BY T1.client_id HAVING count(*)  =  1
SELECT T1.client_id ,  T1.sic_code ,  T1.agency_id FROM clients AS T1 JOIN invoices AS T2 ON T1.client_id  =  T2.client_id JOIN meetings AS T3 ON T1.client_id  =  T3.client_id GROUP BY T1.client_id HAVING count(*)  =  1
SELECT T1.start_date_time ,  T1.end_date_time ,  T3.client_details ,  T4.staff_details FROM Meetings AS T1 JOIN Clients AS T3 ON T1.client_id  =  T3.client_id JOIN Staff_in_Meetings AS T2 ON T1.meeting_id  =  T2.meeting_id JOIN Staff AS T4 ON T2.staff_id  =  T4.staff_id
SELECT T1.start_date_time ,  T1.end_date_time ,  T2.client_details ,  T4.staff_details FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id JOIN Staff_in_meetings AS T3 ON T1.meeting_id  =  T3.meeting_id JOIN Staff AS T4 ON T3.staff_id  =  T4.staff_id
