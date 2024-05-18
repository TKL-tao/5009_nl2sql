SELECT count(*) FROM club
SELECT count(*) FROM club
SELECT name FROM club ORDER BY name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT manager,  captain FROM club
SELECT manager,  captain FROM club
SELECT name FROM club WHERE manufacturer!= 'Nike'
SELECT name FROM club WHERE manufacturer!= 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT DISTINCT Country FROM player WHERE Earnings  >  1200000
SELECT Country FROM player WHERE Earnings  >  1200000
SELECT Country FROM player WHERE Wins_count  >  2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count  >  2 ORDER BY Earnings DESC LIMIT 1
SELECT T2.Name,  T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID
SELECT T2.Name,  T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID
SELECT T1.name FROM club AS T1 JOIN player AS T2 ON T1.club_id  =  T2.club_id GROUP BY T1.club_id HAVING count(*)  >  2
SELECT T1.name FROM club AS T1 JOIN player AS T2 ON T1.club_id  =  T2.club_id GROUP BY T1.club_id HAVING sum(T2.wins_count)  >  2
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Manager  =  "Sam Allardyce"
SELECT T2.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID  =  T2.Club_ID WHERE T1.Manager  =  "Sam Allardyce"
SELECT T1.name FROM club AS T1 JOIN player AS T2 ON T1.club_id  =  T2.club_id GROUP BY T1.club_id ORDER BY avg(T2.Earnings) DESC
SELECT T1.name FROM club AS T1 JOIN player AS T2 ON T1.club_id  =  T2.club_id GROUP BY T1.club_id ORDER BY avg(T2.Earnings) DESC
SELECT Manufacturer,  COUNT(*) FROM club GROUP BY Manufacturer
SELECT count(*),  manufacturer FROM club GROUP BY manufacturer
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*)  >  1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING count(*)  >  1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*)  >  1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*)  >  1
SELECT name FROM club WHERE club_id NOT IN (SELECT club_id FROM player)
SELECT name FROM club WHERE club_id NOT IN (SELECT club_id FROM player)
SELECT Country FROM player WHERE Earnings  >  1400000 UNION SELECT Country FROM player WHERE Earnings  <  1100000
SELECT Country FROM player WHERE Earnings  >  1400000 INTERSECT SELECT Country FROM player WHERE Earnings  <  1100000
SELECT count(DISTINCT Country) FROM player
SELECT count(DISTINCT Country) FROM player
SELECT Earnings FROM player WHERE Country  =  "Australia" OR Country  =  "Zimbabwe"
SELECT Earnings FROM player WHERE Country  =  'Australia' OR Country  =  'Zimbabwe'
SELECT T1.customer_id,  T1.customer_first_name,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >  2 INTERSECT SELECT T1.customer_id,  T1.customer_first_name,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >  3
SELECT T1.customer_id,  T1.customer_first_name,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >  2 INTERSECT SELECT T1.customer_id,  T1.customer_first_name,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.customer_id HAVING count(*)  >=  3
SELECT T1.order_id,  T1.order_status_code,  count(*) FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id
SELECT T1.order_id,  T1.order_status_code,  count(*) FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id
SELECT T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >  1 UNION SELECT date_order_placed FROM Orders ORDER BY date_order_placed LIMIT 1
SELECT date_order_placed FROM Orders ORDER BY date_order_placed ASC LIMIT 1
SELECT customer_first_name,  customer_middle_initial,  customer_last_name FROM Customers EXCEPT SELECT T1.customer_first_name,  T1.customer_middle_initial,  T1.customer_last_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id
SELECT customer_first_name,  customer_last_name,  customer_middle_initial FROM Customers EXCEPT SELECT T1.customer_first_name,  T1.customer_last_name,  T1.customer_middle_initial FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id
SELECT product_id,  product_name,  product_price,  product_color FROM Products EXCEPT SELECT T1.product_id,  T1.product_name,  T1.product_price,  T1.product_color FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.product_id HAVING count(*)  >=  2
SELECT T1.product_id,  T1.product_name,  T1.product_price,  T1.product_color FROM products AS T1 JOIN order_items AS T2 ON T1.product_id  =  T2.product_id JOIN orders AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.product_id HAVING count(*)  <  2
SELECT T1.order_id,  T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >=  2
SELECT T1.order_id,  T1.date_order_placed FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id GROUP BY T1.order_id HAVING count(*)  >=  2
SELECT T1.product_id,  T1.product_name,  T1.product_price FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.product_id,  T1.product_name,  T1.product_price FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.order_id,  sum(T2.product_price) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.order_id ORDER BY sum(T2.product_price) LIMIT 1
SELECT T1.order_id,  sum(T2.product_price) FROM order_items AS T1 JOIN products AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.order_id ORDER BY sum(T2.product_price) LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.gender_code,  count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.gender_code
SELECT T1.gender_code,  count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id GROUP BY T1.gender_code
SELECT T1.gender_code,  count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.gender_code
SELECT T1.gender_code,  count(*) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.gender_code
SELECT T1.customer_first_name,  T1.customer_middle_initial,  T1.customer_last_name,  T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id
SELECT T1.customer_first_name,  T1.customer_middle_initial,  T1.customer_last_name,  T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id  =  T2.customer_id
SELECT T1.invoice_status_code,  T1.invoice_date,  T2.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number
SELECT T1.invoice_status_code,  T1.invoice_date,  T2.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number
SELECT T1.product_name,  T4.shipment_date FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id  =  T4.shipment_id
SELECT T1.product_name,  T4.shipment_date FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id  =  T4.shipment_id
SELECT T1.order_item_status_code,  T3.shipment_tracking_number FROM Order_items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id  =  T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id  =  T3.shipment_id
SELECT T1.order_item_status_code,  T3.shipment_tracking_number FROM Order_items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id  =  T2.order_item_id JOIN Shipments AS T3 ON T2.shipment_id  =  T3.shipment_id
SELECT T1.product_name,  T1.product_color FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id  =  T4.shipment_id
SELECT T1.product_name,  T1.product_color FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id  =  T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id  =  T4.shipment_id
SELECT DISTINCT T1.product_name,  T1.product_price,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T2.order_id  =  T3.order_id JOIN Customers AS T4 ON T3.customer_id  =  T4.customer_id WHERE T4.gender_code  =  "Female"
SELECT DISTINCT T1.product_name,  T1.product_price,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id JOIN Orders AS T3 ON T2.order_id  =  T3.order_id JOIN Customers AS T4 ON T3.customer_id  =  T4.customer_id WHERE T4.gender_code  =  "Female"
SELECT invoice_status_code FROM Invoices WHERE invoice_number NOT IN (SELECT invoice_number FROM Shipments)
SELECT invoice_status_code FROM Invoices WHERE invoice_number NOT IN (SELECT invoice_number FROM Shipments)
SELECT T1.order_id,  T1.date_order_placed,  sum(T3.product_price) FROM orders AS T1 JOIN order_items AS T2 ON T1.order_id  =  T2.order_id JOIN products AS T3 ON T2.product_id  =  T3.product_id GROUP BY T1.order_id
SELECT T1.order_id,  T1.date_order_placed,  sum(T3.product_price) FROM Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id JOIN Products AS T3 ON T2.product_id  =  T3.product_id GROUP BY T1.order_id
SELECT count(DISTINCT customer_id) FROM Orders
SELECT count(DISTINCT customer_id) FROM Orders
SELECT count(DISTINCT order_item_status_code) FROM Order_items
SELECT count(DISTINCT order_item_status_code) FROM Order_items
SELECT count(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT count(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT login_name,  login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT login_name,  login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_price,  product_size FROM Products WHERE product_price  >  (SELECT avg(product_price) FROM Products)
SELECT product_price,  product_size FROM Products WHERE product_price  >  (SELECT avg(product_price) FROM Products)
SELECT count(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_items)
SELECT count(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_items)
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT order_status_code,  date_order_placed FROM Orders
SELECT order_status_code,  date_order_placed FROM Orders
SELECT address_line_1,  town_city,  county FROM Customers WHERE country  =  "USA"
SELECT address_line_1,  town_city,  county FROM Customers WHERE country  =  "USA"
SELECT T1.customer_first_name,  T4.product_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id JOIN Products AS T4 ON T3.product_id  =  T4.product_id
SELECT T1.customer_first_name,  T4.product_name FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id  =  T2.customer_id JOIN Order_items AS T3 ON T2.order_id  =  T3.order_id JOIN Products AS T4 ON T3.product_id  =  T4.product_id
SELECT count(*) FROM Shipment_Items
SELECT count(DISTINCT order_item_id) FROM Shipment_Items
SELECT avg(product_price) FROM Products
SELECT avg(product_price) FROM Products
SELECT avg(T1.product_price) FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT avg(T1.product_price) FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id
SELECT email_address,  town_city,  county FROM Customers GROUP BY gender_code ORDER BY count(*) ASC LIMIT 1
SELECT email_address,  town_city,  county FROM Customers WHERE gender_code  =  (SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY count(*) ASC LIMIT 1)
SELECT T1.date_order_placed FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id JOIN Customer_Payment_Methods AS T3 ON T2.customer_id  =  T3.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2
SELECT T1.date_order_placed FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id JOIN Customer_Payment_Methods AS T3 ON T2.customer_id  =  T3.customer_id GROUP BY T1.customer_id HAVING count(*)  >=  2
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY count(*) ASC LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY count(*) ASC LIMIT 1
SELECT T1.product_id,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >  3
SELECT T1.product_id,  T1.product_description FROM Products AS T1 JOIN Order_items AS T2 ON T1.product_id  =  T2.product_id GROUP BY T1.product_id HAVING count(*)  >  3
SELECT T1.invoice_date,  T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  >=  2
SELECT T1.invoice_date,  T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number  =  T2.invoice_number GROUP BY T1.invoice_number HAVING count(*)  >=  2
SELECT shipment_tracking_number,  shipment_date FROM Shipments
SELECT shipment_tracking_number,  shipment_date FROM Shipments
SELECT product_color,  product_description,  product_size FROM Products WHERE product_price  <  (SELECT max(product_price) FROM products)
SELECT product_color,  product_description,  product_size FROM products WHERE product_price!= (SELECT max(product_price) FROM products)
SELECT Name FROM director WHERE Age  >  (SELECT avg(Age) FROM director)
SELECT Name FROM director ORDER BY Age DESC LIMIT 1
SELECT count(*) FROM channel WHERE internet LIKE '%bbc%'
SELECT count(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT title FROM program ORDER BY start_year DESC
SELECT T2.name FROM program AS T1 JOIN director AS T2 ON T1.director_id  =  T2.director_id GROUP BY T1.director_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name,  T2.age FROM program AS T1 JOIN director AS T2 ON T1.director_id  =  T2.director_id GROUP BY T1.director_id ORDER BY count(*) DESC LIMIT 1
SELECT title FROM program ORDER BY start_year DESC LIMIT 1
SELECT T1.name,  T1.internet FROM channel AS T1 JOIN program AS T2 ON T1.channel_id  =  T2.channel_id GROUP BY T1.channel_id HAVING count(*)  >  1
SELECT count(*),  T1.name FROM channel AS T1 JOIN program AS T2 ON T1.channel_id  =  T2.channel_id GROUP BY T1.name
SELECT count(*) FROM channel WHERE channel_id NOT IN (SELECT channel_id FROM program)
SELECT T2.Name FROM program AS T1 JOIN director AS T2 ON T1.Director_ID  =  T2.Director_ID WHERE T1.Title  =  "Dracula"
SELECT T1.name,  T1.internet FROM channel AS T1 JOIN director_admin AS T2 ON T1.channel_id  =  T2.channel_id GROUP BY T1.channel_id ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT T1.name FROM channel AS T1 JOIN director_admin AS T2 ON T1.channel_id  =  T2.channel_id JOIN director AS T3 ON T2.director_id  =  T3.director_id WHERE T3.age  <  40 INTERSECT SELECT T1.name FROM channel AS T1 JOIN director_admin AS T2 ON T1.channel_id  =  T2.channel_id JOIN director AS T3 ON T2.director_id  =  T3.director_id WHERE T3.age  >  60
SELECT channel_id,  name FROM channel WHERE channel_id NOT IN (SELECT director_id FROM director WHERE name  =  "Hank Baskett")
SELECT count(*) FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT tv_show_name,  Original_Airdate FROM tv_show
SELECT Station_name FROM city_channel WHERE Affiliation!= "ABC"
SELECT Transmitter FROM radio WHERE ERP_kW  >  150 OR ERP_kW  <  30
SELECT Transmitter FROM radio ORDER BY ERP_kW DESC LIMIT 1
SELECT avg(ERP_kW) FROM radio
SELECT affiliation,  count(*) FROM city_channel GROUP BY affiliation
SELECT affiliation FROM city_channel GROUP BY affiliation ORDER BY count(*) DESC LIMIT 1
SELECT affiliation FROM city_channel GROUP BY affiliation HAVING count(*)  >  3
SELECT city,  station_name FROM city_channel ORDER BY station_name ASC
SELECT T3.Transmitter,  T2.City FROM city_channel_radio AS T1 JOIN city_channel AS T2 ON T1.city_channel_id  =  T2.id JOIN radio AS T3 ON T1.radio_id  =  T3.radio_id
SELECT T3.Transmitter,  T2.Station_name FROM city_channel_radio AS T1 JOIN city_channel AS T2 ON T1.City_channel_ID  =  T2.ID JOIN radio AS T3 ON T1.Radio_ID  =  T3.Radio_ID ORDER BY T3.ERP_kW DESC
SELECT T2.Transmitter,  count(*) FROM city_channel_radio AS T1 JOIN radio AS T2 ON T1.radio_id  =  T2.radio_id GROUP BY T2.Transmitter
SELECT DISTINCT Transmitter FROM radio WHERE Radio_ID NOT IN (SELECT Radio_ID FROM city_channel_radio)
SELECT Model FROM vehicle WHERE Top_Speed  =  ( SELECT MAX ( Top_Speed ) FROM vehicle WHERE Power  >  6000 ) AND Power  >  6000
SELECT Model FROM vehicle WHERE Power  >  6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Name FROM driver WHERE Citizenship  =  'United States'
SELECT Name FROM driver WHERE Citizenship  =  'United States'
SELECT count(*),  driver_id FROM vehicle_driver GROUP BY driver_id ORDER BY count(*) DESC LIMIT 1
SELECT driver_id,  count(*) FROM vehicle_driver GROUP BY driver_id ORDER BY count(*) DESC LIMIT 1
SELECT max(power),  avg(power) FROM vehicle WHERE Builder  =  'Zhuzhou'
SELECT max(power),  avg(power) FROM vehicle WHERE builder  =  'Zhuzhou'
SELECT vehicle_id FROM vehicle_driver GROUP BY vehicle_id ORDER BY count(*) ASC LIMIT 1
SELECT vehicle_id FROM vehicle_driver GROUP BY vehicle_id ORDER BY count(*) ASC LIMIT 1
SELECT Top_Speed,  Power FROM vehicle WHERE Build_Year  =  1996
SELECT Top_Speed,  Power FROM vehicle WHERE Build_Year  =  1996
SELECT Build_Year,  Model,  Builder FROM vehicle
SELECT Build_Year,  Model,  Builder FROM vehicle
SELECT count(*) FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.vehicle_id  =  T2.vehicle_id WHERE T2.build_year  =  2012
SELECT count(DISTINCT T1.driver_id) FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.vehicle_id  =  T2.vehicle_id WHERE T2.build_year  =  2012
SELECT count(*) FROM driver WHERE Racing_Series  =  'NASCAR'
SELECT count(*) FROM driver WHERE Racing_Series  =  "NASCAR"
SELECT avg(top_speed) FROM vehicle
SELECT avg(top_speed) FROM vehicle
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID  =  T3.Vehicle_ID WHERE T3.Power  >  5000
SELECT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID  =  T3.Vehicle_ID WHERE T3.Power  >  5000
SELECT Model FROM vehicle WHERE Total_Production  >  100 OR Top_Speed  >  150
SELECT Model FROM vehicle WHERE Total_Production  >  100 OR Top_Speed  >  150
SELECT Model,  Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model,  Build_Year FROM vehicle WHERE Model LIKE "%DJ%"
SELECT model FROM vehicle WHERE vehicle_id NOT IN (SELECT vehicle_id FROM vehicle_driver)
SELECT model FROM vehicle WHERE vehicle_id NOT IN (SELECT vehicle_id FROM vehicle_driver)
SELECT T1.vehicle_id,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id GROUP BY T1.vehicle_id HAVING count(*)  >=  2 UNION SELECT vehicle_id,  model FROM vehicle WHERE builder  =  'Ziyang'
SELECT T1.vehicle_id,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id GROUP BY T1.vehicle_id HAVING count(*)  =  2 UNION SELECT vehicle_id,  model FROM vehicle WHERE builder  =  'Ziyang'
SELECT T1.vehicle_id,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id JOIN driver AS T3 ON T2.driver_id  =  T3.driver_id WHERE T3.name  =  'Jeff Gordon' UNION SELECT T1.vehicle_id,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id GROUP BY T1.vehicle_id HAVING count(*)  >  2
SELECT T1.vehicle_id,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id JOIN driver AS T3 ON T2.driver_id  =  T3.driver_id WHERE T3.name  =  "Jeff Gordon" UNION SELECT T1.vehicle_id,  T1.model FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.vehicle_id  =  T2.vehicle_id GROUP BY T1.vehicle_id HAVING count(*)  >  2
SELECT count(*) FROM vehicle WHERE top_speed  =  (SELECT max(top_speed) FROM vehicle)
SELECT count(*) FROM vehicle WHERE top_speed  =  (SELECT max(top_speed) FROM vehicle)
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT Racing_Series,  COUNT(*) FROM driver GROUP BY Racing_Series
SELECT Racing_Series,  COUNT(*) FROM driver GROUP BY Racing_Series
SELECT T1.Name,  T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID  =  T3.Vehicle_ID WHERE T3.Model  =  'DJ1'
SELECT T1.Name,  T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID  =  T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID  =  T3.Vehicle_ID WHERE T3.Model  =  'DJ1'
SELECT count(*) FROM driver WHERE driver_id NOT IN (SELECT driver_id FROM vehicle_driver)
SELECT count(*) FROM driver WHERE driver_id NOT IN (SELECT driver_id FROM vehicle_driver)
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT subject_code FROM exams ORDER BY subject_code ASC
SELECT DISTINCT subject_code FROM Exams ORDER BY subject_code
SELECT Exam_Name,  Exam_Date FROM Exams WHERE Subject_Code!= "Database"
SELECT Exam_Date,  Exam_Name FROM Exams WHERE Subject_Code!= "Database"
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE "%data%" ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE "%data%" ORDER BY Exam_Date DESC
SELECT TYPE_OF_QUESTION_CODE,  COUNT(*) FROM Questions GROUP BY TYPE_OF_QUESTION_CODE
SELECT TYPE_OF_QUESTION_CODE,  COUNT(*) FROM Questions GROUP BY TYPE_OF_QUESTION_CODE
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal"
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal"
SELECT count(DISTINCT Comments) FROM Student_Answers
SELECT count(DISTINCT Comments) FROM Student_Answers
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count(*) DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC
SELECT T2.First_Name,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID
SELECT T2.First_Name,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID
SELECT T2.Email_Adress,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID ORDER BY T1.Date_of_Answer DESC
SELECT T2.Email_Adress,  T1.Date_of_Answer FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID ORDER BY T1.Date_of_Answer DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY count(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY count(*) ASC LIMIT 1
SELECT T2.First_Name FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID GROUP BY T1.Student_ID HAVING count(*)  >=  2
SELECT T2.First_Name FROM Student_Answers AS T1 JOIN Students AS T2 ON T1.Student_ID  =  T2.Student_ID GROUP BY T1.Student_ID HAVING count(*)  >=  2
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Last_Name FROM Students WHERE Gender_MFU!= "M"
SELECT Last_Name FROM Students WHERE Gender_MFU!= "M"
SELECT Gender_MFU,  count(*) FROM Students GROUP BY Gender_MFU
SELECT Gender_MFU,  count(*) FROM Students GROUP BY Gender_MFU
SELECT Last_Name FROM Students WHERE Gender_MFU  =  "F" OR Gender_MFU  =  "M"
SELECT Last_Name FROM Students WHERE Gender_MFU  =  "F" OR Gender_MFU  =  "M"
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal" INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Absent"
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Normal" INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments  =  "Absent"
SELECT TYPE_OF_QUESTION_CODE FROM Questions GROUP BY TYPE_OF_QUESTION_CODE HAVING count(*)  >=  3
SELECT TYPE_OF_QUESTION_CODE FROM Questions GROUP BY TYPE_OF_QUESTION_CODE HAVING count(*)  >=  3
SELECT * FROM Students
SELECT * FROM Students
SELECT count(*) FROM Addresses
SELECT count(*) FROM Addresses
SELECT address_id,  address_details FROM Addresses
SELECT address_id,  address_details FROM Addresses
SELECT count(*) FROM Products
SELECT count(*) FROM Products
SELECT product_id,  product_type_code,  product_name FROM Products
SELECT product_id,  product_type_code,  product_name FROM Products
SELECT product_price FROM Products WHERE product_name  =  "Monitor"
SELECT product_price FROM Products WHERE product_name  =  "Monitor"
SELECT min(product_price),  avg(product_price),  max(product_price) FROM Products
SELECT min(product_price),  avg(product_price),  max(product_price) FROM Products
SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Clothes"
SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Clothes"
SELECT count(*) FROM Products WHERE product_type_code  =  "Hardware"
SELECT count(*) FROM Products WHERE product_type_code  =  "Hardware"
SELECT product_name FROM Products WHERE product_price  >  (SELECT avg(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price  >  (SELECT avg(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code  =  "Hardware" AND product_price  >  (SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Hardware")
SELECT product_name FROM Products WHERE product_type_code  =  "Hardware" AND product_price  >  (SELECT avg(product_price) FROM Products WHERE product_type_code  =  "Hardware")
SELECT product_name FROM Products WHERE product_type_code  =  "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_type_code  =  "Clothes" ORDER BY product_price DESC LIMIT 1
SELECT product_id,  product_name FROM Products WHERE product_type_code  =  "Hardware" ORDER BY product_price LIMIT 1
SELECT product_id,  product_name FROM Products WHERE product_type_code  =  "Hardware" ORDER BY product_price LIMIT 1
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products WHERE product_type_code  =  "Hardware" ORDER BY product_price ASC
SELECT product_name FROM Products WHERE product_type_code  =  "Hardware" ORDER BY product_price ASC
SELECT product_type_code,  count(*) FROM Products GROUP BY product_type_code
SELECT product_type_code,  count(*) FROM Products GROUP BY product_type_code
SELECT product_type_code,  avg(product_price) FROM Products GROUP BY product_type_code
SELECT product_type_code,  avg(product_price) FROM Products GROUP BY product_type_code
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*)  >=  2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*)  >=  2
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY count(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM Customers
SELECT count(*) FROM Customers
SELECT customer_id,  customer_name FROM Customers
SELECT customer_id,  customer_name FROM Customers
SELECT customer_address,  customer_phone,  customer_email FROM Customers WHERE customer_name  =  "Jeromy"
SELECT customer_address,  customer_phone,  customer_email FROM Customers WHERE customer_name  =  "Jeromy"
SELECT payment_method_code,  count(*) FROM Customers GROUP BY payment_method_code
SELECT payment_method_code,  count(*) FROM Customers GROUP BY payment_method_code
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT customer_name FROM Customers GROUP BY payment_method_code ORDER BY count(*) ASC LIMIT 1
SELECT customer_name FROM Customers GROUP BY payment_method_code ORDER BY count(*) ASC LIMIT 1
SELECT payment_method_code,  customer_number FROM Customers WHERE customer_name  =  "Jeromy"
SELECT payment_method_code,  customer_number FROM Customers WHERE customer_name  =  "Jeromy"
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT product_id,  product_type_code FROM Products ORDER BY product_name
SELECT product_id,  product_type_code FROM Products ORDER BY product_name
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY count(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY count(*) ASC LIMIT 1
SELECT count(*) FROM Customer_orders
SELECT count(*) FROM Customer_orders
SELECT T1.order_id,  T1.order_date,  T1.order_status_code FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_name  =  "Jeromy"
SELECT T1.order_id,  T1.order_date,  T1.order_status_code FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.customer_name  =  "Jeromy"
SELECT T2.customer_name,  T1.customer_id,  count(*) FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id
SELECT T2.customer_name,  T1.customer_id,  count(*) FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id
SELECT T2.customer_id,  T2.customer_name,  T2.customer_phone,  T2.customer_email FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.customer_id,  T2.customer_name,  T2.customer_phone,  T2.customer_email FROM Customer_orders AS T1 JOIN Customers AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT order_status_code,  count(*) FROM Customer_orders GROUP BY order_status_code
SELECT order_status_code,  count(*) FROM Customer_orders GROUP BY order_status_code
SELECT order_status_code FROM Customer_orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_orders GROUP BY order_status_code ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_orders)
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_orders)
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_items)
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_items)
SELECT count(*) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id WHERE T2.product_name  =  "Monitor"
SELECT sum(T1.order_quantity) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id WHERE T2.product_name  =  "Monitor"
SELECT count(*) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id JOIN Customer_orders AS T3 ON T1.order_id  =  T3.order_id WHERE T2.product_name  =  "Monitor"
SELECT count(DISTINCT T3.customer_id) FROM Order_items AS T1 JOIN Products AS T2 ON T1.product_id  =  T2.product_id JOIN Customer_orders AS T3 ON T1.order_id  =  T3.order_id WHERE T2.product_name  =  "Monitor"
SELECT count(DISTINCT customer_id) FROM Customer_orders
SELECT count(DISTINCT customer_id) FROM Customer_orders
SELECT customer_id FROM Customers EXCEPT SELECT customer_id FROM Customer_orders
SELECT customer_id FROM Customers EXCEPT SELECT customer_id FROM Customer_orders
SELECT T1.order_date,  T1.order_id FROM Customer_Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id WHERE T2.order_quantity  >  6 OR count(*)  >  3
SELECT T1.order_id,  T1.order_date FROM Customer_Orders AS T1 JOIN Order_items AS T2 ON T1.order_id  =  T2.order_id WHERE T2.order_quantity  >  6 OR count(*)  >  3
SELECT count(*) FROM building
SELECT count(*) FROM building
SELECT name FROM building ORDER BY number_of_stories ASC
SELECT name FROM building ORDER BY number_of_stories ASC
SELECT address FROM building ORDER BY completed_year DESC
SELECT address FROM building ORDER BY completed_year DESC
SELECT max(number_of_stories) FROM building WHERE completed_year!= 1980
SELECT max(number_of_stories) FROM building WHERE completed_year!= 1980
SELECT avg(Population) FROM region
SELECT avg(Population) FROM region
SELECT Name FROM region ORDER BY Name ASC
SELECT Name FROM region ORDER BY Name
SELECT Capital FROM region WHERE Area  >  10000
SELECT Capital FROM region WHERE Area  >  10000
SELECT Capital FROM region ORDER BY Population DESC LIMIT 1
SELECT Capital FROM region ORDER BY Population DESC LIMIT 1
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT T1.name,  T2.name FROM building AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id
SELECT T1.name,  T2.name FROM building AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id
SELECT T2.name FROM building AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id GROUP BY T1.region_id HAVING count(*)  >  1
SELECT T2.name FROM building AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id GROUP BY T1.region_id HAVING count(*)  >  1
SELECT T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Region_ID ORDER BY count(*) DESC LIMIT 1
SELECT T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID GROUP BY T1.Region_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Address,  T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID
SELECT T1.address,  T2.name FROM building AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id
SELECT T1.Number_of_Stories FROM building AS T1 JOIN region AS T2 ON T1.Region_ID  =  T2.Region_ID WHERE T2.Name  =  "Abruzzo"
SELECT T1.number_of_stories FROM building AS T1 JOIN region AS T2 ON T1.region_id  =  T2.region_id WHERE T2.name  =  "Abruzzo"
SELECT completed_year,  count(*) FROM building GROUP BY completed_year
SELECT completed_year,  count(*) FROM building GROUP BY completed_year
SELECT completed_year FROM building GROUP BY completed_year ORDER BY count(*) DESC LIMIT 1
SELECT completed_year FROM building GROUP BY completed_year ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT completed_year FROM building WHERE number_of_stories  >  20 INTERSECT SELECT completed_year FROM building WHERE number_of_stories  <  15
SELECT completed_year FROM building WHERE number_of_stories  >  20 INTERSECT SELECT completed_year FROM building WHERE number_of_stories  <  15
SELECT DISTINCT address FROM building
SELECT DISTINCT address FROM building
SELECT completed_year FROM building ORDER BY number_of_stories DESC
SELECT completed_year FROM building ORDER BY number_of_stories DESC
SELECT channel_details FROM channels ORDER BY channel_details
SELECT channel_details FROM channels ORDER BY channel_details
SELECT count(*) FROM services
SELECT count(*) FROM services
SELECT Analytical_Layer_Type_Code FROM analytical_layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Analytical_Layer_Type_Code FROM analytical_layer GROUP BY Analytical_Layer_Type_Code ORDER BY count(*) DESC LIMIT 1
SELECT T3.Service_Details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN services AS T3 ON T2.Service_ID  =  T3.Service_ID WHERE T1.customer_details  =  "Hardy Kutch"
SELECT T3.service_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN services AS T3 ON T2.service_id  =  T3.service_id WHERE T1.customer_details  =  "Hardy Kutch"
SELECT T1.service_details FROM services AS T1 JOIN customers_and_services AS T2 ON T1.service_id  =  T2.service_id GROUP BY T2.service_id HAVING count(*)  >  3
SELECT T1.service_details FROM services AS T1 JOIN customers_and_services AS T2 ON T1.service_id  =  T2.service_id GROUP BY T2.service_id HAVING count(*)  >  3
SELECT t1.customer_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id GROUP BY t1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.customer_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id GROUP BY t1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.customer_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id GROUP BY t1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id ORDER BY count(*) DESC LIMIT 1
SELECT customer_details FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customers_and_services)
SELECT customer_details FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customers_and_services)
SELECT t1.customer_details FROM customers AS t1 JOIN customers_and_services AS t2 ON t1.customer_id  =  t2.customer_id JOIN services AS t3 ON t2.service_id  =  t3.service_id GROUP BY t3.service_id ORDER BY count(*) ASC LIMIT 1
SELECT DISTINCT T1.customer_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN services AS T3 ON T2.service_id  =  T3.service_id GROUP BY T1.customer_details ORDER BY count(*) ASC LIMIT 1
SELECT count(DISTINCT customers_and_services_details) FROM customers_and_services
SELECT count(*) FROM customers_and_services
SELECT customer_details FROM customers WHERE customer_details LIKE "%Kutch%"
SELECT customer_details FROM customers WHERE customer_details LIKE "%Kutch%"
SELECT T3.Service_Details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN services AS T3 ON T2.Service_ID  =  T3.Service_ID WHERE T1.customer_details  =  "Hardy Kutch" UNION SELECT T3.Service_Details FROM customers AS T1 JOIN customer_interactions AS T4 ON T1.Customer_ID  =  T4.Customer_ID JOIN services AS T3 ON T4.Service_ID  =  T3.Service_ID WHERE T4.Status_Code  =  "good"
SELECT T3.service_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN services AS T3 ON T2.service_id  =  T3.service_id WHERE T1.customer_details  =  "Hardy Kutch" UNION SELECT T4.service_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN services AS T3 ON T2.service_id  =  T3.service_id JOIN customer_interactions AS T4 ON T1.customer_id  =  T4.customer_id WHERE T4.status_code  =  "good"
SELECT T3.Service_Details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN services AS T3 ON T2.Service_ID  =  T3.Service_ID JOIN customer_interactions AS T4 ON T2.Customer_ID  =  T4.Customer_ID WHERE T1.customer_details  =  "Hardy Kutch" AND T4.Status_Code  =  "bad" INTERSECT SELECT T3.Service_Details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.Customer_ID  =  T2.Customer_ID JOIN services AS T3 ON T2.Service_ID  =  T3.Service_ID JOIN customer_interactions AS T4 ON T2.Customer_ID  =  T4.Customer_ID WHERE T1.customer_details  =  "Hardy Kutch" AND T4.Status_Code  =  "good"
SELECT T3.service_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN services AS T3 ON T2.service_id  =  T3.service_id JOIN customer_interactions AS T4 ON T2.customer_id  =  T4.customer_id WHERE T1.customer_details  =  "Hardy Kutch" AND T4.status_code  =  "bad" AND T3.service_details IN (SELECT T3.service_details FROM customers AS T1 JOIN customers_and_services AS T2 ON T1.customer_id  =  T2.customer_id JOIN services AS T3 ON T2.service_id  =  T3.service_id WHERE T1.customer_details  =  "Hardy Kutch")
SELECT T1.service_details FROM services AS T1 JOIN customer_interactions AS T2 ON T1.service_id  =  T2.service_id JOIN channels AS T3 ON T2.channel_id  =  T3.channel_id WHERE T3.channel_details  =  "15 ij"
SELECT T1.service_details FROM services AS T1 JOIN customer_interactions AS T2 ON T1.service_id  =  T2.service_id JOIN channels AS T3 ON T2.channel_id  =  T3.channel_id WHERE T3.channel_details  =  "15 ij"
SELECT T1.customer_details FROM customers AS T1 JOIN customer_interactions AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.status_code  =  "Stuck" AND T2.services_and_channels_details  =  "bad"
SELECT T1.customer_details FROM customers AS T1 JOIN customer_interactions AS T2 ON T1.customer_id  =  T2.customer_id WHERE T2.status_code  =  "Stuck" AND T2.services_and_channels_details  =  "bad"
SELECT count(*) FROM integration_platform WHERE Integration_Platform_Details  =  "Success"
SELECT count(*) FROM integration_platform WHERE integration_platform_details  =  "Success"
SELECT T1.customer_details FROM customers AS T1 JOIN customer_interactions AS T2 ON T1.customer_id  =  T2.customer_id JOIN integration_platform AS T3 ON T2.customer_interaction_id  =  T3.customer_interaction_id WHERE T3.integration_platform_details  =  "Failed"
SELECT T1.customer_details FROM customers AS T1 JOIN customer_interactions AS T2 ON T1.customer_id  =  T2.customer_id JOIN integration_platform AS T3 ON T2.customer_interaction_id  =  T3.customer_interaction_id WHERE T3.integration_platform_details  =  "Fail"
SELECT service_details FROM services WHERE service_id NOT IN ( SELECT service_id FROM customers_and_services )
SELECT service_details FROM services WHERE service_id NOT IN (SELECT service_id FROM customers_and_services)
SELECT Analytical_Layer_Type_Code,  COUNT(*) FROM analytical_layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code,  COUNT(*) FROM analytical_layer GROUP BY Analytical_Layer_Type_Code
SELECT T1.service_details FROM services AS T1 JOIN customers_and_services AS T2 ON T1.service_id  =  T2.service_id WHERE T2.customers_and_services_details  =  "unsatisfied"
SELECT T1.service_details FROM services AS T1 JOIN customers_and_services AS T2 ON T1.service_id  =  T2.service_id WHERE T2.customers_and_services_details  =  "unsatisfied"
SELECT count(*) FROM vehicles
SELECT count(*) FROM vehicles
SELECT name FROM vehicles ORDER BY model_year DESC
SELECT name FROM vehicles ORDER BY model_year DESC
SELECT DISTINCT TYPE_of_powertrain FROM vehicles
SELECT DISTINCT TYPE_of_powertrain FROM vehicles
SELECT name,  TYPE_OF_POWERTRAIN,  Annual_fuel_cost FROM vehicles WHERE Model_year  =  2013 OR Model_year  =  2014
SELECT name,  TYPE_of_powertrain,  Annual_fuel_cost FROM vehicles WHERE model_year  =  2013 OR model_year  =  2014
SELECT TYPE_OF_POWERTRAIN FROM vehicles WHERE model_year  =  2014 INTERSECT SELECT TYPE_OF_POWERTRAIN FROM vehicles WHERE model_year  =  2013
SELECT TYPE_OF_POWERTRAIN FROM vehicles WHERE model_year  =  2013 INTERSECT SELECT TYPE_OF_POWERTRAIN FROM vehicles WHERE model_year  =  2014
SELECT TYPE_of_powertrain,  count(*) FROM vehicles GROUP BY TYPE_of_powertrain
SELECT TYPE_of_powertrain,  count(*) FROM vehicles GROUP BY TYPE_of_powertrain
SELECT TYPE_of_powertrain FROM vehicles GROUP BY TYPE_of_powertrain ORDER BY count(*) DESC LIMIT 1
SELECT TYPE_of_powertrain FROM vehicles GROUP BY TYPE_of_powertrain ORDER BY count(*) DESC LIMIT 1
SELECT min(Annual_fuel_cost),  max(Annual_fuel_cost),  avg(Annual_fuel_cost) FROM vehicles
SELECT min(Annual_fuel_cost),  max(Annual_fuel_cost),  avg(Annual_fuel_cost) FROM vehicles
SELECT name,  model_year FROM vehicles WHERE city_fuel_economy_rate  <=  highway_fuel_economy_rate
SELECT name,  model_year FROM vehicles WHERE city_fuel_economy_rate  <=  highway_fuel_economy_rate
SELECT TYPE_of_powertrain,  avg(Annual_fuel_cost) FROM vehicles GROUP BY TYPE_of_powertrain HAVING count(*)  >=  2
SELECT TYPE_of_powertrain,  avg(Annual_fuel_cost) FROM vehicles GROUP BY TYPE_of_powertrain HAVING count(*)  >=  2
SELECT name,  age,  membership_credit FROM customers
SELECT name,  age,  membership_credit FROM customers
SELECT name,  age FROM customers ORDER BY membership_credit DESC LIMIT 1
SELECT name,  age FROM customers ORDER BY membership_credit DESC LIMIT 1
SELECT avg(age) FROM customers WHERE membership_credit  >  (SELECT avg(membership_credit) FROM customers)
SELECT avg(age) FROM customers WHERE membership_credit  >  (SELECT avg(membership_credit) FROM customers)
SELECT * FROM discount
SELECT * FROM discount
SELECT T2.name,  T1.total_hours FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id
SELECT T2.name,  sum(T1.total_hours) FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id
SELECT name FROM vehicles WHERE id NOT IN (SELECT vehicles_id FROM renting_history)
SELECT name FROM vehicles WHERE id NOT IN (SELECT vehicles_id FROM renting_history)
SELECT T2.name FROM renting_history AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.id GROUP BY T1.customer_id HAVING count(*)  >=  2
SELECT T2.name FROM renting_history AS T1 JOIN customers AS T2 ON T1.customer_id  =  T2.id GROUP BY T1.customer_id HAVING count(*)  >=  2
SELECT T2.name,  T2.Model_year FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name,  T2.Model_year FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id ORDER BY T1.total_hours DESC
SELECT T2.name FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id ORDER BY T1.total_hours DESC
SELECT T2.name FROM renting_history AS T1 JOIN discount AS T2 ON T1.discount_id  =  T2.id GROUP BY T1.discount_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM renting_history AS T1 JOIN discount AS T2 ON T1.discount_id  =  T2.id GROUP BY T1.discount_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name,  T2.type_of_powertrain FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id WHERE T1.total_hours  >  30
SELECT T2.name,  T2.type_of_powertrain FROM renting_history AS T1 JOIN vehicles AS T2 ON T1.vehicles_id  =  T2.id GROUP BY T1.vehicles_id HAVING sum(T1.total_hours)  >  30
SELECT TYPE_of_powertrain,  avg(City_fuel_economy_rate),  avg(Highway_fuel_economy_rate) FROM vehicles GROUP BY TYPE_of_powertrain
SELECT TYPE_of_powertrain,  avg(City_fuel_economy_rate),  avg(Highway_fuel_economy_rate) FROM vehicles GROUP BY TYPE_of_powertrain
SELECT avg(amount_of_loan) FROM Student_Loans
SELECT avg(amount_of_loan) FROM Student_Loans
SELECT T1.bio_data,  T1.student_id FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2 UNION SELECT T1.bio_data,  T1.student_id FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  <  2
SELECT T1.bio_data,  T1.student_id FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2 INTERSECT SELECT T1.bio_data,  T1.student_id FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  <  2
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE '%data%' EXCEPT SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE 'net%'
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE '%data%' EXCEPT SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.class_details LIKE 'net%'
SELECT bio_data FROM students WHERE student_id NOT IN (SELECT student_id FROM detention UNION SELECT student_id FROM student_loans)
SELECT bio_data FROM students WHERE student_id NOT IN (SELECT student_id FROM detention UNION SELECT student_id FROM student_loans)
SELECT T1.amount_of_loan,  T1.date_of_loan FROM Student_Loans AS T1 JOIN Achievements AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2
SELECT T1.amount_of_loan,  T1.date_of_loan FROM Student_Loans AS T1 JOIN Achievements AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  >=  2
SELECT T1.teacher_details,  T2.teacher_id FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T2.teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.teacher_details,  T2.teacher_id FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id GROUP BY T2.teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT T1.detention_type_description FROM Ref_Detention_Type AS T1 JOIN Detention AS T2 ON T1.detention_type_code  =  T2.detention_type_code
SELECT DISTINCT T1.detention_type_description FROM Ref_Detention_Type AS T1 JOIN Detention AS T2 ON T1.detention_type_code  =  T2.detention_type_code
SELECT T1.student_details,  T3.address_type_description FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id  =  T2.student_id JOIN Ref_Address_Types AS T3 ON T2.address_type_code  =  T3.address_type_code
SELECT T1.student_details,  T3.address_type_description FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id  =  T2.student_id JOIN Ref_Address_Types AS T3 ON T2.address_type_code  =  T3.address_type_code
SELECT T1.address_details,  T3.bio_data FROM Addresses AS T1 JOIN Students_Addresses AS T2 ON T1.address_id  =  T2.address_id JOIN Students AS T3 ON T2.student_id  =  T3.student_id
SELECT T1.address_details,  T3.bio_data FROM Addresses AS T1 JOIN Students_Addresses AS T2 ON T1.address_id  =  T2.address_id JOIN Students AS T3 ON T2.student_id  =  T3.student_id
SELECT T1.bio_data,  T2.date_of_transcript FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data,  T2.date_of_transcript FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id
SELECT behaviour_monitoring_details,  count(*) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT behaviour_monitoring_details,  count(*) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data,  T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id WHERE T2.behaviour_monitoring_details  =  (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1) INTERSECT SELECT T1.bio_data,  T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id WHERE T2.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING count(*)  =  3)
SELECT T1.bio_data,  T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T2.behaviour_monitoring_details HAVING count(*)  =  (SELECT max(count(*)) FROM Behaviour_Monitoring) INTERSECT SELECT T1.bio_data,  T1.student_details FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T2.behaviour_monitoring_details HAVING count(*)  =  3
SELECT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING behaviour_monitoring_details  =  (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1)
SELECT T1.bio_data FROM students AS T1 JOIN behaviour_monitoring AS T2 ON T1.student_id  =  T2.student_id GROUP BY T2.behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data,  T2.event_date FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data,  T2.event_date FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id
SELECT count(*),  T2.event_type_code,  T3.event_type_description FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id JOIN Ref_Event_Types AS T3 ON T2.event_type_code  =  T3.event_type_code GROUP BY T2.event_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T3.event_type_code,  T3.event_type_description,  count(*) FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id JOIN Ref_Event_Types AS T3 ON T2.event_type_code  =  T3.event_type_code GROUP BY T3.event_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.achievement_details,  T2.achievement_type_description FROM Achievements AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code  =  T2.achievement_type_code
SELECT T1.achievement_details,  T2.achievement_type_description FROM Achievements AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code  =  T2.achievement_type_code
SELECT count(*) FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.student_id NOT IN (SELECT student_id FROM Achievements)
SELECT count(*) FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id WHERE T2.student_id NOT IN (SELECT student_id FROM Achievements)
SELECT date_of_transcript,  transcript_details FROM Transcripts
SELECT date_of_transcript,  transcript_details FROM Transcripts
SELECT achievement_type_code,  achievement_details,  date_achievement FROM Achievements
SELECT achievement_type_code,  achievement_details,  date_achievement FROM Achievements
SELECT datetime_detention_start,  datetime_detention_end FROM Detention
SELECT datetime_detention_start,  datetime_detention_end FROM Detention
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT T1.teacher_details,  T3.student_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Students AS T3 ON T2.student_id  =  T3.student_id
SELECT T1.teacher_details,  T3.student_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Students AS T3 ON T2.student_id  =  T3.student_id
SELECT teacher_id,  count(*) FROM Classes GROUP BY teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT teacher_id,  count(*) FROM Classes GROUP BY teacher_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*),  student_id FROM Classes GROUP BY student_id ORDER BY count(*) DESC LIMIT 1
SELECT student_id,  count(*) FROM Classes GROUP BY student_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.student_id,  T1.student_details FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT T1.student_id,  T1.student_details FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT T1.detention_type_code,  T2.detention_type_description FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code  =  T2.detention_type_code GROUP BY T1.detention_type_code ORDER BY count(*) ASC LIMIT 1
SELECT T1.detention_type_code,  T2.detention_type_description FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code  =  T2.detention_type_code GROUP BY T1.detention_type_code ORDER BY count(*) ASC LIMIT 1
SELECT T1.bio_data,  T1.student_details FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id WHERE T2.amount_of_loan  >  (SELECT avg(amount_of_loan) FROM Student_Loans)
SELECT T1.bio_data,  T1.student_details FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id WHERE T2.amount_of_loan  >  (SELECT avg(amount_of_loan) FROM Student_Loans)
SELECT date_of_loan FROM Student_Loans ORDER BY date_of_loan ASC LIMIT 1
SELECT date_of_loan FROM Student_Loans ORDER BY date_of_loan ASC LIMIT 1
SELECT T1.bio_data FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id ORDER BY T2.amount_of_loan LIMIT 1
SELECT T1.bio_data FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id ORDER BY T2.amount_of_loan LIMIT 1
SELECT T1.date_of_transcript FROM Transcripts AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id ORDER BY T2.amount_of_loan DESC LIMIT 1
SELECT T1.date_of_transcript FROM Transcripts AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id ORDER BY T2.amount_of_loan DESC LIMIT 1
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Transcripts AS T3 ON T2.student_id  =  T3.student_id ORDER BY T3.date_of_transcript LIMIT 1
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id  =  T2.teacher_id JOIN Transcripts AS T3 ON T2.student_id  =  T3.student_id ORDER BY T3.date_of_transcript LIMIT 1
SELECT student_id,  sum(amount_of_loan) FROM student_loans GROUP BY student_id
SELECT student_id,  sum(amount_of_loan) FROM Student_Loans GROUP BY student_id
SELECT T1.student_id,  T1.bio_data,  count(*) FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id
SELECT T1.student_id,  T1.bio_data,  count(*) FROM Students AS T1 JOIN Classes AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id
SELECT count(DISTINCT student_id) FROM Detention
SELECT count(DISTINCT student_id) FROM Detention
SELECT T1.address_type_code,  T2.address_type_description FROM Students_Addresses AS T1 JOIN Ref_Address_Types AS T2 ON T1.address_type_code  =  T2.address_type_code GROUP BY T1.address_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T2.address_type_code,  T2.address_type_description FROM Students_Addresses AS T1 JOIN Ref_Address_Types AS T2 ON T1.address_type_code  =  T2.address_type_code GROUP BY T1.address_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.bio_data FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id EXCEPT SELECT T1.bio_data FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.bio_data FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id  =  T2.student_id EXCEPT SELECT T1.bio_data FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id  =  T2.student_id
SELECT T1.date_from,  T1.date_to FROM Students_Addresses AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT T1.date_from,  T1.date_to FROM Students_Addresses AS T1 JOIN Transcripts AS T2 ON T1.student_id  =  T2.student_id GROUP BY T1.student_id HAVING count(*)  =  2
SELECT datetime_detention_start FROM Detention
SELECT datetime_detention_start FROM Detention
SELECT Name FROM Author
SELECT Name FROM Author
SELECT Name,  Address FROM Client
SELECT Name,  Address FROM Client
SELECT Title,  ISBN,  SalePrice FROM Book
SELECT Title,  ISBN,  SalePrice FROM Book
SELECT count(*) FROM Book
SELECT count(*) FROM Book
SELECT count(*) FROM Author
SELECT count(*) FROM Author
SELECT count(*) FROM Client
SELECT count(*) FROM Client
SELECT Name,  Address FROM Client ORDER BY Name
SELECT Name,  Address FROM Client ORDER BY Name ASC
SELECT T3.Title,  T1.Name FROM Author AS T1 JOIN Author_Book AS T2 ON T1.idAuthor  =  T2.Author JOIN Book AS T3 ON T2.ISBN  =  T3.ISBN
SELECT T3.Title,  T1.Name FROM Author AS T1 JOIN Author_Book AS T2 ON T1.idAuthor  =  T2.Author JOIN Book AS T3 ON T2.ISBN  =  T3.ISBN
SELECT T1.idorder,  T2.name FROM Orders AS T1 JOIN Client AS T2 ON T1.idclient  =  T2.idclient
SELECT T1.idorder,  T2.name FROM Orders AS T1 JOIN Client AS T2 ON T1.idclient  =  T2.idclient
SELECT T1.Name,  COUNT(*) FROM Author AS T1 JOIN Author_Book AS T2 ON T1.idAuthor  =  T2.Author GROUP BY T2.Author
SELECT T1.Name,  COUNT(*) FROM Author AS T1 JOIN Author_Book AS T2 ON T1.idAuthor  =  T2.Author GROUP BY T1.Name
SELECT ISBN,  count(*) FROM Books_Order GROUP BY ISBN
SELECT ISBN,  amount FROM Books_Order GROUP BY ISBN
SELECT ISBN,  sum(amount) FROM Books_Order GROUP BY ISBN
SELECT ISBN,  sum(amount) FROM Books_Order GROUP BY ISBN
SELECT T2.Title FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN GROUP BY T1.ISBN ORDER BY count(*) DESC LIMIT 1
SELECT T2.Title FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN  =  T2.ISBN GROUP BY T1.ISBN ORDER BY count(*) DESC LIMIT 1
SELECT T2.Title,  T2.PurchasePrice FROM Books_Order AS T1 JOIN BOOk AS T2 ON T1.ISBN  =  T2.ISBN GROUP BY T1.ISBN ORDER BY sum(amount) DESC LIMIT 1
SELECT T2.Title,  T2.PurchasePrice FROM Books_Order AS T1 JOIN BOOk AS T2 ON T1.ISBN  =  T2.ISBN GROUP BY T1.ISBN ORDER BY sum(amount) DESC LIMIT 1
SELECT T1.Title FROM book AS T1 JOIN books_order AS T2 ON T1.ISBN  =  T2.ISBN
SELECT DISTINCT T1.Title FROM book AS T1 JOIN books_order AS T2 ON T1.ISBN  =  T2.ISBN
SELECT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient  =  T2.IdClient GROUP BY T1.Name HAVING COUNT(*)  >=  1
SELECT DISTINCT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient  =  T2.IdClient
SELECT T2.Name,  COUNT(*) FROM Orders AS T1 JOIN Client AS T2 ON T1.IdClient  =  T2.IdClient GROUP BY T1.IdClient
SELECT T2.Name,  COUNT(*) FROM Orders AS T1 JOIN Client AS T2 ON T1.IdClient  =  T2.IdClient GROUP BY T1.IdClient
SELECT T2.Name FROM Orders AS T1 JOIN Client AS T2 ON T1.IdClient  =  T2.IdClient GROUP BY T1.IdClient ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Name FROM Orders AS T1 JOIN Client AS T2 ON T1.IdClient  =  T2.IdClient GROUP BY T1.IdClient ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Name,  sum(T3.amount) FROM Orders AS T1 JOIN Client AS T2 ON T1.IdClient  =  T2.IdClient JOIN Books_Order AS T3 ON T1.IdOrder  =  T3.IdOrder GROUP BY T2.Name
SELECT T2.Name,  sum(T3.amount) FROM Orders AS T1 JOIN Client AS T2 ON T1.IdClient  =  T2.IdClient JOIN Books_Order AS T3 ON T1.IdOrder  =  T3.IdOrder GROUP BY T2.Name
SELECT T2.Name FROM Orders AS T1 JOIN Client AS T2 ON T1.IdClient  =  T2.IdClient JOIN Books_Order AS T3 ON T1.IdOrder  =  T3.IdOrder GROUP BY T1.IdClient ORDER BY sum(T3.amount) DESC LIMIT 1
SELECT T2.Name FROM Orders AS T1 JOIN Client AS T2 ON T1.IdClient  =  T2.IdClient JOIN Books_Order AS T3 ON T1.IdOrder  =  T3.IdOrder GROUP BY T1.IdClient ORDER BY sum(T3.amount) DESC LIMIT 1
SELECT title FROM book WHERE ISBN NOT IN (SELECT ISBN FROM books_order)
SELECT title FROM book WHERE ISBN NOT IN (SELECT ISBN FROM books_order)
SELECT Name FROM Client WHERE IdClient NOT IN (SELECT IdClient FROM Orders)
SELECT Name FROM Client WHERE IdClient NOT IN (SELECT IdClient FROM Orders)
SELECT max(SalePrice),  min(SalePrice) FROM Book
SELECT max(SalePrice),  min(SalePrice) FROM Book
SELECT avg(PurchasePrice),  avg(SalePrice) FROM Book
SELECT avg(PurchasePrice),  avg(SalePrice) FROM Book
SELECT max(SalePrice - PurchasePrice) FROM Book
SELECT SalePrice - PurchasePrice FROM Book ORDER BY SalePrice - PurchasePrice DESC LIMIT 1
SELECT title FROM book WHERE saleprice  >  (SELECT avg(saleprice) FROM book)
SELECT Title FROM book WHERE SalePrice  >  (SELECT avg(SalePrice) FROM book)
SELECT title FROM book ORDER BY SalePrice LIMIT 1
SELECT Title FROM book WHERE SalePrice  =  (SELECT min(SalePrice) FROM book)
SELECT title FROM book ORDER BY purchaseprice DESC LIMIT 1
SELECT Title FROM book ORDER BY PurchasePrice DESC LIMIT 1
SELECT avg(T1.SalePrice) FROM Book AS T1 JOIN Author_book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "George Orwell"
SELECT avg(T1.SalePrice) FROM Book AS T1 JOIN Author_book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "George Orwell"
SELECT T1.SalePrice FROM Book AS T1 JOIN Author_book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "Plato"
SELECT T1.SalePrice FROM Book AS T1 JOIN Author_book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "Plato"
SELECT T1.Title FROM Book AS T1 JOIN Author_book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "George Orwell" ORDER BY T1.SalePrice LIMIT 1
SELECT T1.Title FROM Book AS T1 JOIN Author_book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "George Orwell" ORDER BY T1.SalePrice LIMIT 1
SELECT T1.Title FROM Book AS T1 JOIN Author_book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "Plato" AND T1.SalePrice  <  (SELECT avg(SalePrice) FROM Book)
SELECT T1.Title FROM Book AS T1 JOIN Author_book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name  =  "Plato" AND T1.SalePrice  <  (SELECT avg(SalePrice) FROM Book)
SELECT T3.Name FROM Book AS T1 JOIN Author_book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T1.Title  =  "Pride and Prejudice"
SELECT T3.Name FROM Book AS T1 JOIN Author_book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T1.Title  =  "Pride and Prejudice"
SELECT T1.Title FROM Book AS T1 JOIN Author_book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name LIKE '%Plato%'
SELECT T1.Title FROM Book AS T1 JOIN Author_book AS T2 ON T1.ISBN  =  T2.ISBN JOIN Author AS T3 ON T2.Author  =  T3.idAuthor WHERE T3.Name LIKE "%Plato%"
SELECT count(*) FROM Book AS T1 JOIN Books_Order AS T2 ON T1.ISBN  =  T2.ISBN WHERE T1.Title  =  "Pride and Prejudice"
SELECT count(*) FROM Book AS T1 JOIN Books_Order AS T2 ON T1.ISBN  =  T2.ISBN WHERE T1.Title  =  "Pride and Prejudice"
SELECT T2.idorder FROM Book AS T1 JOIN Books_Order AS T2 ON T1.ISBN  =  T2.ISBN WHERE T1.Title  =  "Pride and Prejudice" INTERSECT SELECT T2.idorder FROM Book AS T1 JOIN Books_Order AS T2 ON T1.ISBN  =  T2.ISBN WHERE T1.Title  =  "The Little Prince"
SELECT T2.idorder FROM Book AS T1 JOIN Books_Order AS T2 ON T1.ISBN  =  T2.ISBN WHERE T1.Title  =  "Pride and Prejudice" INTERSECT SELECT T2.idorder FROM Book AS T1 JOIN Books_Order AS T2 ON T1.ISBN  =  T2.ISBN WHERE T1.Title  =  "The Little Prince"
SELECT T2.ISBN FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T1.IdClient  =  T3.IdClient WHERE T3.Name  =  "Peter Doe" INTERSECT SELECT T2.ISBN FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T1.IdClient  =  T3.IdClient WHERE T3.Name  =  "James Smith"
SELECT T2.ISBN FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T1.IdClient  =  T3.IdClient WHERE T3.Name  =  "Peter Doe" INTERSECT SELECT T2.ISBN FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T1.IdClient  =  T3.IdClient WHERE T3.Name  =  "James Smith"
SELECT T4.Title FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T1.IdClient  =  T3.IdClient JOIN book AS T4 ON T2.ISBN  =  T4.ISBN WHERE T3.Name  =  "Peter Doe" EXCEPT SELECT T4.Title FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T1.IdClient  =  T3.IdClient JOIN book AS T4 ON T2.ISBN  =  T4.ISBN WHERE T3.Name  =  "James Smith"
SELECT T4.Title FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T1.IdClient  =  T3.IdClient JOIN book AS T4 ON T2.ISBN  =  T4.ISBN WHERE T3.Name  =  "Peter Doe" EXCEPT SELECT T4.Title FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T1.IdClient  =  T3.IdClient JOIN book AS T4 ON T2.ISBN  =  T4.ISBN WHERE T3.Name  =  "James Smith"
SELECT T3.Name FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T1.IdClient  =  T3.IdClient JOIN Book AS T4 ON T2.ISBN  =  T4.ISBN WHERE T4.Title  =  "Pride and Prejudice"
SELECT T3.Name FROM Orders AS T1 JOIN Books_Order AS T2 ON T1.IdOrder  =  T2.IdOrder JOIN Client AS T3 ON T1.IdClient  =  T3.IdClient JOIN Book AS T4 ON T2.ISBN  =  T4.ISBN WHERE T4.Title  =  "Pride and Prejudice"
SELECT count(*) FROM book
SELECT Title FROM book ORDER BY Title ASC
SELECT Title FROM book ORDER BY Pages DESC
SELECT TYPE,  Release FROM book
SELECT max(Chapters),  min(Chapters) FROM book
SELECT Title FROM book WHERE TYPE!= "Poet"
SELECT avg(Rating) FROM review
SELECT T1.Title,  T2.Rating FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID
SELECT T2.Rating FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T1.Chapters DESC LIMIT 1
SELECT T2.rank FROM book AS T1 JOIN review AS T2 ON T1.book_id  =  T2.book_id ORDER BY T1.pages LIMIT 1
SELECT T1.Title FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T2.Rank DESC LIMIT 1
SELECT avg(T2.Readers_in_Million) FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID WHERE T1.Type  =  "Novel"
SELECT TYPE,  count(*) FROM book GROUP BY TYPE
SELECT TYPE FROM book GROUP BY TYPE ORDER BY COUNT(*) DESC LIMIT 1
SELECT TYPE FROM book GROUP BY TYPE HAVING count(*)  >=  3
SELECT T1.Title FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T2.Rating ASC
SELECT T1.Title,  T1.Audio FROM book AS T1 JOIN review AS T2 ON T1.Book_ID  =  T2.Book_ID ORDER BY T2.Readers_in_Million DESC
SELECT count(*) FROM book WHERE book_id NOT IN (SELECT book_id FROM review)
SELECT TYPE FROM book WHERE Chapters  >  75 INTERSECT SELECT TYPE FROM book WHERE Chapters  <  50
SELECT count(DISTINCT TYPE) FROM book
SELECT TYPE,  Title FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
SELECT count(*) FROM customer
SELECT count(*) FROM customer
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
SELECT Nationality,  Card_Credit FROM customer
SELECT Nationality,  Card_Credit FROM customer
SELECT Name FROM customer WHERE Nationality  =  "England" OR Nationality  =  "Australia"
SELECT Name FROM customer WHERE Nationality  =  "England" OR Nationality  =  "Australia"
SELECT avg(card_credit) FROM customer WHERE level_of_membership  >  1
SELECT avg(card_credit) FROM customer WHERE LEVEL_OF_MEMBERSHIP  >  1
SELECT card_credit FROM customer ORDER BY level_of_membership DESC LIMIT 1
SELECT card_credit FROM customer ORDER BY level_of_membership DESC LIMIT 1
SELECT Nationality,  COUNT(*) FROM customer GROUP BY Nationality
SELECT Nationality,  COUNT(*) FROM customer GROUP BY Nationality
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM customer WHERE Card_Credit  <  50 INTERSECT SELECT Nationality FROM customer WHERE Card_Credit  >  75
SELECT Nationality FROM customer WHERE Card_Credit  >  50 INTERSECT SELECT Nationality FROM customer WHERE Card_Credit  <  75
SELECT T1.Name,  T2.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID
SELECT T1.name,  T2.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.customer_id  =  T2.customer_id
SELECT T1.Name,  T2.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID ORDER BY T2.Quantity DESC
SELECT T1.name,  T2.dish_name FROM customer AS T1 JOIN customer_order AS T2 ON T1.customer_id  =  T2.customer_id ORDER BY T2.quantity DESC
SELECT T1.Name,  sum(T2.Quantity) FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID GROUP BY T1.Name
SELECT T1.Name,  sum(T2.Quantity) FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID GROUP BY T1.Name
SELECT T1.name FROM customer AS T1 JOIN customer_order AS T2 ON T1.customer_id  =  T2.customer_id GROUP BY T1.customer_id HAVING sum(T2.quantity)  >  1
SELECT T1.Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID  =  T2.Customer_ID GROUP BY T1.Customer_ID HAVING sum(T2.Quantity)  >  1
SELECT DISTINCT manager FROM branch
SELECT DISTINCT manager FROM branch
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order)
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order)
SELECT count(*) FROM member
SELECT Name FROM member ORDER BY Age ASC
SELECT Name,  Nationality FROM member
SELECT Name FROM member WHERE Nationality!= "England"
SELECT Name FROM member WHERE Age  =  19 OR Age  =  20
SELECT Name FROM member ORDER BY Age DESC LIMIT 1
SELECT Nationality,  COUNT(*) FROM member GROUP BY Nationality
SELECT Nationality FROM member GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(*)  >=  2
SELECT T3.Name,  T2.Club_Name FROM club_leader AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID JOIN member AS T3 ON T1.Member_ID  =  T3.Member_ID
SELECT T3.Name FROM club_leader AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID JOIN member AS T3 ON T1.Member_ID  =  T3.Member_ID WHERE T2.Overall_Ranking  >  100
SELECT T3.Name FROM club_leader AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID JOIN member AS T3 ON T1.Member_ID  =  T3.Member_ID WHERE T1.Year_Join  <  2018
SELECT T3.Name FROM club_leader AS T1 JOIN club AS T2 ON T1.Club_ID  =  T2.Club_ID JOIN member AS T3 ON T1.Member_ID  =  T3.Member_ID WHERE T2.Club_Name  =  "Houston"
SELECT Name FROM member WHERE Member_ID NOT IN (SELECT Member_ID FROM club_leader)
SELECT Nationality FROM member WHERE Age  >  22 INTERSECT SELECT Nationality FROM member WHERE Age  <  19
SELECT avg(T2.age) FROM club_leader AS T1 JOIN member AS T2 ON T1.member_id  =  T2.member_id
SELECT club_name FROM club WHERE club_name LIKE '%state%'
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT Collecrtion_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name  =  "Top collection"
SELECT Collecrtion_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name  =  "Top collection"
SELECT document_subset_name FROM Document_Subsets
SELECT document_subset_name FROM Document_Subsets
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name  =  'Best for 2000'
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name  =  'Best for 2000'
SELECT document_object_id FROM Document_Objects
SELECT document_object_id FROM Document_Objects
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT document_object_id FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT Owner FROM Document_Objects WHERE Description  =  'Braeden Collection'
SELECT OWNER FROM Document_Objects WHERE Description  =  'Braeden Collection'
SELECT T1.Owner FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Document_Object_ID  =  T2.Parent_Document_Object_ID WHERE T1.Owner  =  'Marlin'
SELECT T1.Owner FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Document_Object_ID  =  T2.Parent_Document_Object_ID WHERE T1.Owner  =  'Marlin'
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID!= "null"
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID  =  "null"
SELECT count(*) FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT count(*) FROM Document_Objects WHERE OWNER  =  "Marlin"
SELECT document_object_id FROM Document_Objects EXCEPT SELECT parent_document_object_id FROM Document_Objects
SELECT document_object_id FROM Document_Objects WHERE parent_document_object_id  =  "null"
SELECT Parent_Document_Object_ID,  count(*) FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT Parent_Document_Object_ID,  count(*) FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT Collection_Name FROM Collections
SELECT DISTINCT collection_name FROM Collections
SELECT Collection_Description FROM Collections WHERE Collection_Name  =  "Best"
SELECT Collection_Description FROM Collections WHERE Collection_Name  =  'Best'
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Parent_Collection_ID WHERE T2.Collection_Name  =  "Nice"
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Parent_Collection_ID WHERE T2.Collection_Name  =  "Nice"
SELECT Collection_Name FROM Collections EXCEPT SELECT T1.Collection_Name FROM Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Parent_Collection_ID
SELECT Collection_Name FROM Collections EXCEPT SELECT Collection_Name FROM Collections WHERE Parent_Collection_ID!= "null"
SELECT document_object_id FROM Document_Objects GROUP BY document_object_id HAVING count(*)  >  1
SELECT document_object_id FROM Document_Objects GROUP BY document_object_id HAVING count(*)  >  1
SELECT count(*) FROM Collections WHERE Parent_Collection_ID  =  (SELECT Collection_ID FROM Collections WHERE Collection_Name  =  "Best")
SELECT count(*) FROM Collections WHERE Parent_Collection_ID  =  (SELECT Collection_ID FROM Collections WHERE Collection_Name  =  "Best")
SELECT T1.document_object_id FROM document_subset_members AS T1 JOIN document_objects AS T2 ON T1.document_object_id  =  T2.document_object_id WHERE T2.owner  =  "Ransom"
SELECT T1.related_document_object_id FROM document_subset_members AS T1 JOIN document_objects AS T2 ON T1.document_object_id  =  T2.document_object_id WHERE T2.owner  =  "Ransom"
SELECT T1.collection_subset_id,  T1.collection_subset_name,  count(*) FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.collection_subset_id  =  T2.collection_subset_id GROUP BY T1.collection_subset_id
SELECT T1.collection_subset_id,  T1.collection_subset_name,  count(*) FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.collection_subset_id  =  T2.collection_subset_id GROUP BY T1.collection_subset_id
SELECT document_object_id,  count(*) FROM Document_Objects GROUP BY document_object_id ORDER BY count(*) DESC LIMIT 1
SELECT document_object_id,  count(*) FROM Document_Objects GROUP BY document_object_id
SELECT document_object_id,  count(*) FROM Document_Subset_Members GROUP BY document_object_id ORDER BY count(*) ASC LIMIT 1
SELECT document_object_id FROM document_subset_members GROUP BY document_object_id ORDER BY count(*) ASC LIMIT 1
SELECT document_object_id,  count(*) FROM document_subset_members GROUP BY document_object_id HAVING count(document_object_id) BETWEEN 2 AND 4
SELECT document_object_id,  count(*) FROM Document_Subset_Members GROUP BY document_object_id HAVING count(document_object_id) BETWEEN 2 AND 4
SELECT T2.Owner FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID WHERE T2.Owner  =  "Braeden"
SELECT DISTINCT T2.Owner FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.Document_Object_ID  =  T2.Document_Object_ID WHERE T2.Owner  =  "Braeden"
SELECT DISTINCT T1.document_subset_name FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.document_subset_id  =  T2.document_subset_id JOIN Document_Objects AS T3 ON T2.document_object_id  =  T3.document_object_id WHERE T3.owner  =  "Braeden"
SELECT DISTINCT T1.Document_Subset_Name FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID JOIN Document_Objects AS T3 ON T2.Document_Object_ID  =  T3.Document_Object_ID WHERE T3.Owner  =  "Braeden"
SELECT T2.document_subset_id,  T2.document_subset_name,  count(DISTINCT T1.document_object_id) FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.document_subset_id  =  T2.document_subset_id GROUP BY T2.document_subset_id
SELECT T2.document_subset_id,  T2.document_subset_name,  count(DISTINCT T1.document_object_id) FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.document_subset_id  =  T2.document_subset_id GROUP BY T2.document_subset_id
SELECT T2.document_subset_id,  T2.document_subset_name,  count(DISTINCT T1.document_object_id) FROM document_subset_members AS T1 JOIN document_subsets AS T2 ON T1.document_subset_id  =  T2.document_subset_id GROUP BY T2.document_subset_id ORDER BY count(DISTINCT T1.document_object_id) DESC LIMIT 1
SELECT t2.document_subset_id,  t2.document_subset_name,  count(*) FROM document_subset_members AS t1 JOIN document_subsets AS t2 ON t1.document_subset_id  =  t2.document_subset_id GROUP BY t2.document_subset_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.document_object_id FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.document_subset_id  =  T2.document_subset_id WHERE T2.document_subset_name  =  'Best for 2000'
SELECT T1.document_object_id FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.document_subset_id  =  T2.document_subset_id WHERE T2.document_subset_name  =  'Best for 2000'
SELECT T2.document_subset_name,  T1.document_object_id FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.document_subset_id  =  T2.document_subset_id
SELECT DISTINCT T2.document_subset_name,  T1.document_object_id FROM document_subset_members AS T1 JOIN document_subsets AS T2 ON T1.document_subset_id  =  T2.document_subset_id
SELECT t1.collection_name FROM collections AS t1 JOIN documents_in_collections AS t2 ON t1.collection_id  =  t2.collection_id JOIN document_objects AS t3 ON t2.document_object_id  =  t3.document_object_id WHERE t3.owner  =  'Ransom'
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID JOIN Document_Objects AS T3 ON T2.Document_Object_ID  =  T3.Document_Object_ID WHERE T3.Owner  =  'Ransom'
SELECT count(*),  T2.document_object_id FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.collection_id  =  T2.collection_id GROUP BY T2.document_object_id
SELECT document_object_id,  count(*) FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.collection_id  =  T2.collection_id GROUP BY document_object_id
SELECT count(*) FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T1.Collection_Name  =  'Best'
SELECT count(*) FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T1.Collection_Name  =  'Best'
SELECT T2.document_object_id FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T1.collection_name  =  "Best"
SELECT count(*) FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T1.Collection_Name  =  "Best"
SELECT T1.collection_name,  T1.collection_id,  count(*) FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.collection_id  =  T2.collection_id GROUP BY T1.collection_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.collection_name,  T1.collection_id,  count(*) FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.collection_id  =  T2.collection_id WHERE T1.collection_name  =  'Best' GROUP BY T1.collection_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID JOIN Documents_in_Collections AS T3 ON T3.Document_Object_ID  =  T1.Document_Object_ID JOIN Collections AS T4 ON T3.Collection_ID  =  T4.Collection_ID WHERE T2.Document_Subset_Name  =  "Best for 2000" AND T4.Collection_Name  =  "Best"
SELECT DISTINCT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID JOIN Documents_in_Collections AS T3 ON T3.Document_Object_ID  =  T1.Document_Object_ID JOIN Collections AS T4 ON T3.Collection_ID  =  T4.Collection_ID WHERE T2.Document_Subset_Name  =  'Best for 2000' AND T4.Collection_Name  =  'Best'
SELECT T1.document_object_id FROM Collections AS T2 JOIN Documents_in_Collections AS T1 ON T2.collection_id  =  T1.collection_id WHERE T2.collection_name  =  "Best" EXCEPT SELECT T1.document_object_id FROM Document_Subsets AS T4 JOIN Document_Subset_Members AS T3 ON T4.document_subset_id  =  T3.document_subset_id JOIN Documents_in_Collections AS T1 ON T3.document_object_id  =  T1.document_object_id JOIN Collections AS T2 ON T2.collection_id  =  T1.collection_id WHERE T4.document_subset_name  =  "Best for 2000"
SELECT DISTINCT T1.document_object_id FROM Collections AS T2 JOIN Documents_in_Collections AS T1 ON T2.collection_id  =  T1.collection_id WHERE T2.collection_name  =  'Best' EXCEPT SELECT DISTINCT T3.document_object_id FROM Document_Subset_Members AS T4 JOIN Documents_in_Collections AS T3 ON T4.document_object_id  =  T3.document_object_id JOIN Document_Subsets AS T5 ON T5.document_subset_id  =  T4.document_subset_id WHERE T5.document_subset_name  =  'Best for 2000'
SELECT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID JOIN Documents_in_Collections AS T3 ON T3.Document_Object_ID  =  T1.Document_Object_ID JOIN Collections AS T4 ON T3.Collection_ID  =  T4.Collection_ID WHERE T2.Document_Subset_Name  =  "Best for 2000" OR T4.Collection_Name  =  "Best"
SELECT DISTINCT T1.Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Subsets AS T2 ON T1.Document_Subset_ID  =  T2.Document_Subset_ID JOIN Documents_in_Collections AS T3 ON T3.Document_Object_ID  =  T1.Document_Object_ID JOIN Collections AS T4 ON T3.Collection_ID  =  T4.Collection_ID WHERE T2.Document_Subset_Name  =  'Best for 2000' OR T4.Collection_Name  =  'Best'
SELECT T2.Collection_Name FROM Collection_Subset_Members AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  "Best"
SELECT T2.Collection_Name FROM Collection_Subset_Members AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  "Best"
SELECT count(*) FROM Collection_Subset_Members AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  "Best"
SELECT count(DISTINCT T1.Collection_ID) FROM Collection_Subset_Members AS T1 JOIN Collections AS T2 ON T1.Collection_ID  =  T2.Collection_ID WHERE T2.Collection_Name  =  'Best'
SELECT T1.Collection_Subset_Name FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID JOIN Collections AS T3 ON T2.Collection_ID  =  T3.Collection_ID WHERE T3.Collection_Name  =  "Best"
SELECT T1.Collection_Subset_Name FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_Subset_ID  =  T2.Collection_Subset_ID JOIN Collections AS T3 ON T3.Collection_ID  =  T2.Collection_ID WHERE T3.Collection_Name  =  'Best'
SELECT count(*) FROM songs WHERE name LIKE "%Love%"
SELECT name FROM songs ORDER BY name ASC
SELECT name,  language FROM songs
SELECT max(voice_sound_quality),  min(voice_sound_quality) FROM performance_score
SELECT T1.voice_sound_quality,  T1.rhythm_tempo,  T1.stage_presence FROM performance_score AS T1 JOIN participants AS T2 ON T1.participant_id  =  T2.id WHERE T2.name  =  'Freeway'
SELECT id,  language,  original_artist FROM songs WHERE name!= "Love"
SELECT name,  original_artist FROM songs WHERE english_translation  =  "All the streets of love"
SELECT DISTINCT T2.stage_presence FROM songs AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.songs_id WHERE T1.language  =  'English'
SELECT T1.id,  T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id GROUP BY T1.id HAVING count(*)  >=  2
SELECT T1.id,  T1.name,  T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id GROUP BY T1.id ORDER BY count(*) DESC
SELECT T1.id,  T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id WHERE T2.voice_sound_quality  =  5 OR T2.rhythm_tempo  =  5
SELECT T1.voice_sound_quality FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id  =  T2.id WHERE T2.name  =  "The Balkan Girls" AND T2.language  =  "English"
SELECT T1.id,  T1.name FROM songs AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.songs_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM performance_score WHERE stage_presence  <  7 OR stage_presence  >  9
SELECT count(*) FROM songs WHERE id NOT IN (SELECT songs_id FROM performance_score)
SELECT T1.language,  avg(T2.rhythm_tempo) FROM songs AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.songs_id GROUP BY T1.language
SELECT DISTINCT T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id JOIN songs AS T3 ON T2.songs_id  =  T3.id WHERE T3.language  =  'English'
SELECT T1.name,  T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id JOIN songs AS T3 ON T2.songs_id  =  T3.id WHERE T3.language  =  'Croatian' INTERSECT SELECT T1.name,  T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id  =  T2.participant_id JOIN songs AS T3 ON T2.songs_id  =  T3.id WHERE T3.language  =  'English'
SELECT name FROM songs WHERE name LIKE "%Is%"
SELECT T2.original_artist FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id  =  T2.id WHERE T1.rhythm_tempo  >  5 ORDER BY T1.voice_sound_quality DESC
SELECT count(*) FROM City
SELECT count(*) FROM City
SELECT DISTINCT state FROM city
SELECT DISTINCT state FROM City
SELECT count(DISTINCT country) FROM City
SELECT count(DISTINCT country) FROM City
SELECT city_name,  city_code,  state,  country FROM City
SELECT city_name,  city_code,  state,  country FROM City
SELECT latitude,  longitude FROM City WHERE city_name  =  "Baltimore"
SELECT latitude,  longitude FROM City WHERE city_name  =  "Baltimore"
SELECT city_name FROM City WHERE state  =  "PA"
SELECT city_name FROM City WHERE state  =  "PA"
SELECT COUNT(*) FROM City WHERE country  =  "Canada"
SELECT COUNT(*) FROM City WHERE country  =  "Canada"
SELECT city_name FROM City WHERE country  =  'USA' ORDER BY latitude
SELECT city_name FROM City WHERE country  =  'USA' ORDER BY latitude
SELECT state,  count(*) FROM City GROUP BY state
SELECT state,  count(*) FROM City GROUP BY state
SELECT country,  COUNT(*) FROM city GROUP BY country
SELECT count(*),  country FROM City GROUP BY country
SELECT state FROM City GROUP BY state HAVING count(*)  >=  2
SELECT state FROM City GROUP BY state HAVING count(*)  >=  2
SELECT state FROM City GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT state FROM City GROUP BY state ORDER BY count(*) DESC LIMIT 1
SELECT country FROM City GROUP BY country ORDER BY count(*) ASC LIMIT 1
SELECT country FROM City GROUP BY country ORDER BY count(*) ASC LIMIT 1
SELECT T2.Fname,  T2.Lname FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.state  =  "MD"
SELECT T2.Fname,  T2.Lname FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.state  =  "MD"
SELECT count(*) FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.country  =  "China"
SELECT count(*) FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.country  =  "China"
SELECT T2.Fname,  T2.Major FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.city_name  =  "Baltimore"
SELECT T2.Fname,  T2.Major FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code WHERE T1.city_name  =  "Baltimore"
SELECT count(*),  T1.country FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.country
SELECT count(*),  T1.country FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.country
SELECT count(*),  T1.city_name FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.city_name
SELECT count(*),  T1.city_name FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.city_name
SELECT T1.state FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state ORDER BY count(*) DESC LIMIT 1
SELECT T1.state FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state ORDER BY count(*) DESC LIMIT 1
SELECT T1.country FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.country ORDER BY count(*) ASC LIMIT 1
SELECT T1.country FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.country ORDER BY count(*) ASC LIMIT 1
SELECT T1.city_name FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T2.city_code HAVING count(*)  >=  3
SELECT T1.city_name FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.city_name HAVING count(*)  >=  3
SELECT T1.state FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state HAVING count(*)  >  5
SELECT T1.state FROM City AS T1 JOIN Student AS T2 ON T1.city_code  =  T2.city_code GROUP BY T1.state HAVING count(*)  >  5
SELECT StuID FROM Student EXCEPT SELECT StuID FROM City WHERE country  =  'USA'
SELECT StuID FROM Student EXCEPT SELECT StuID FROM City WHERE country  =  'USA'
SELECT StuID FROM City WHERE state  =  "PA" INTERSECT SELECT StuID FROM Student WHERE Sex  =  "F"
SELECT StuID FROM City WHERE state  =  "PA" INTERSECT SELECT StuID FROM Student WHERE Sex  =  "F"
SELECT StuID FROM City WHERE country!= 'USA' INTERSECT SELECT StuID FROM Student WHERE Sex  =  'M'
SELECT StuID FROM City WHERE country!= 'USA' INTERSECT SELECT StuID FROM Student WHERE Sex  =  'M'
SELECT distance FROM Direct_distance WHERE city1_code  =  "BAL" AND city2_code  =  "CHI"
SELECT distance FROM Direct_distance WHERE city1_code  =  "BAL" AND city2_code  =  "CHI"
SELECT distance FROM Direct_distance WHERE city1_code  =  (SELECT city_code FROM City WHERE city_name  =  "Boston") AND city2_code  =  (SELECT city_code FROM City WHERE city_name  =  "Newark")
SELECT distance FROM Direct_distance WHERE city1_code  =  (SELECT city_code FROM City WHERE city_name  =  "Boston") AND city2_code  =  (SELECT city_code FROM City WHERE city_name  =  "Newark")
SELECT avg(distance),  min(distance),  max(distance) FROM Direct_distance
SELECT avg(distance),  min(distance),  max(distance) FROM Direct_distance
SELECT city1_code,  city2_code FROM Direct_distance ORDER BY distance DESC LIMIT 1
SELECT city1_code,  city2_code FROM Direct_distance ORDER BY distance DESC LIMIT 1
SELECT city1_code,  city2_code FROM Direct_distance WHERE distance  >  (SELECT avg(distance) FROM Direct_distance)
SELECT city1_code FROM Direct_distance WHERE distance  >  (SELECT avg(distance) FROM Direct_distance)
SELECT city1_code,  city2_code FROM Direct_distance WHERE distance  <  1000
SELECT city1_code FROM Direct_distance WHERE distance  <  1000
SELECT sum(distance) FROM Direct_distance WHERE city1_code  =  "BAL"
SELECT sum(distance) FROM Direct_distance WHERE city1_code  =  "BAL"
SELECT avg(T1.distance) FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.city_name  =  "Boston"
SELECT avg(T1.distance) FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.city_name  =  "Boston"
SELECT T2.city_name FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.city_name  =  "Chicago" ORDER BY distance LIMIT 1
SELECT T2.city_name FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.city_name  =  "Chicago" ORDER BY distance LIMIT 1
SELECT T2.city_name FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.city_name  =  "Boston" ORDER BY distance DESC LIMIT 1
SELECT T2.city_name FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.city_name  =  "Boston" ORDER BY distance DESC LIMIT 1
SELECT city1_code,  sum(distance) FROM Direct_distance GROUP BY city1_code
SELECT city1_code,  sum(distance) FROM Direct_distance GROUP BY city1_code
SELECT T2.city_name,  avg(T1.distance) FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code  =  T2.city_code GROUP BY T2.city_name
SELECT T2.city_name,  avg(distance) FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city1_code  =  T2.city_code GROUP BY T2.city_name
SELECT T1.distance FROM Direct_distance AS T1 JOIN Student AS T2 ON T1.city1_code  =  T2.city_code WHERE T2.Fname  =  "Linda" AND T2.Lname  =  "Smith" UNION SELECT T1.distance FROM Direct_distance AS T1 JOIN Student AS T2 ON T1.city2_code  =  T2.city_code WHERE T2.Fname  =  "Tracy" AND T2.Lname  =  "Kim"
SELECT distance FROM Direct_distance WHERE city1_code  =  (SELECT city_code FROM Student WHERE Fname  =  "Linda" AND Lname  =  "Smith") AND city2_code  =  (SELECT city_code FROM Student WHERE Fname  =  "Tracy" AND Lname  =  "Kim")
SELECT T2.Fname,  T2.Lname FROM Direct_distance AS T1 JOIN Student AS T2 ON T1.city1_code  =  T2.city_code WHERE T1.city2_code  =  (SELECT city_code FROM Student WHERE Fname  =  "Linda" AND Lname  =  "Smith") ORDER BY T1.distance DESC LIMIT 1
SELECT T2.Fname,  T2.Lname FROM Direct_distance AS T1 JOIN Student AS T2 ON T1.city1_code  =  T2.city_code WHERE T1.city2_code  =  (SELECT city_code FROM Student WHERE Fname  =  "Linda" AND Lname  =  "Smith") ORDER BY T1.distance DESC LIMIT 1
SELECT T2.state FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T1.Fname  =  "Linda"
SELECT T2.state FROM Student AS T1 JOIN City AS T2 ON T1.city_code  =  T2.city_code WHERE T1.Fname  =  "Linda"
SELECT * FROM Sailors WHERE age  >  30
SELECT * FROM Sailors WHERE age  >  30
SELECT name,  age FROM Sailors WHERE age  <  30
SELECT name,  age FROM Sailors WHERE age  <  30
SELECT DISTINCT bid FROM Reserves WHERE sid  =  1
SELECT DISTINCT bid FROM Reserves WHERE sid = 1
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid WHERE T2.bid  =  102
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid WHERE T2.bid  =  102
SELECT DISTINCT bid FROM Reserves
SELECT DISTINCT bid FROM Reserves
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT sid FROM Sailors WHERE age  >  (SELECT min(age) FROM Sailors)
SELECT sid FROM Sailors WHERE age!= (SELECT min(age) FROM Sailors)
SELECT DISTINCT name FROM Sailors WHERE age  >  (SELECT min(age) FROM Sailors WHERE rating  >  7)
SELECT DISTINCT name FROM Sailors WHERE age  >  (SELECT min(age) FROM Sailors WHERE rating  >  7)
SELECT T1.name,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid GROUP BY T1.sid HAVING count(*)  >=  1
SELECT T1.name,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid
SELECT T1.sid,  T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid GROUP BY T1.sid HAVING count(*)  >  1
SELECT DISTINCT T1.name FROM sailors AS T1 JOIN reserves AS T2 ON T1.sid  =  T2.sid GROUP BY T1.name HAVING count(*)  >=  2
SELECT T2.sid FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid WHERE T1.color  =  "red" OR T1.color  =  "blue"
SELECT T2.sid FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid WHERE T1.color  =  "red" OR T1.color  =  "blue"
SELECT T3.name,  T3.sid FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T2.sid  =  T3.sid WHERE T1.color  =  "red" OR T1.color  =  "blue"
SELECT T3.name,  T3.sid FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T2.sid  =  T3.sid WHERE T1.color  =  "red" OR T1.color  =  "blue"
SELECT T2.sid FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid WHERE T1.color  =  "red" INTERSECT SELECT T2.sid FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid WHERE T1.color  =  "blue"
SELECT T2.sid FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid WHERE T1.color  =  "red" INTERSECT SELECT T2.sid FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid WHERE T1.color  =  "blue"
SELECT T3.name,  T3.sid FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T2.sid  =  T3.sid WHERE T1.color  =  "red" INTERSECT SELECT T3.name,  T3.sid FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T2.sid  =  T3.sid WHERE T1.color  =  "blue"
SELECT T3.name,  T3.sid FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T2.sid  =  T3.sid WHERE T1.color  =  "red" INTERSECT SELECT T3.name,  T3.sid FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid  =  T2.bid JOIN Sailors AS T3 ON T2.sid  =  T3.sid WHERE T1.color  =  "blue"
SELECT sid FROM Sailors EXCEPT SELECT sid FROM Reserves
SELECT sid FROM Sailors EXCEPT SELECT sid FROM Reserves
SELECT name,  sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT name,  sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid FROM Sailors EXCEPT SELECT sid FROM Reserves
SELECT sid FROM Sailors EXCEPT SELECT sid FROM Reserves
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid WHERE T2.bid  =  103
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid WHERE T2.bid  =  103
SELECT name FROM Sailors WHERE rating  >  (SELECT max(rating) FROM Sailors WHERE name  =  'Luis')
SELECT name FROM Sailors WHERE rating  >  (SELECT max(rating) FROM Sailors WHERE name  =  'Luis')
SELECT name FROM Sailors WHERE rating  >  (SELECT max(rating) FROM Sailors WHERE name  =  'Luis')
SELECT name FROM Sailors WHERE rating  >  (SELECT max(rating) FROM Sailors WHERE name  =  'Luis')
SELECT T1.name,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid WHERE T1.rating  >  2
SELECT T1.name,  T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid WHERE T1.rating  >=  3
SELECT name,  age FROM Sailors ORDER BY age DESC LIMIT 1
SELECT name,  age FROM Sailors ORDER BY age DESC LIMIT 1
SELECT count(*) FROM Sailors
SELECT count(*) FROM Sailors
SELECT avg(age) FROM Sailors WHERE rating  =  7
SELECT avg(age) FROM Sailors WHERE rating  =  7
SELECT count(*) FROM sailors WHERE name LIKE 'D%'
SELECT count(*) FROM sailors WHERE name LIKE 'D%'
SELECT avg(rating),  max(age) FROM Sailors
SELECT avg(rating),  max(age) FROM Sailors
SELECT count(*),  bid FROM Reserves GROUP BY bid
SELECT count(*),  bid FROM Reserves GROUP BY bid
SELECT count(*),  bid FROM Reserves WHERE bid  >  50 GROUP BY bid
SELECT count(*),  bid FROM Reserves WHERE bid  >  50 GROUP BY bid
SELECT count(*),  bid FROM Reserves GROUP BY bid HAVING count(*)  >  1
SELECT count(*),  bid FROM Reserves GROUP BY bid HAVING count(*)  >  1
SELECT count(*),  bid FROM Reserves WHERE sid  >  1 GROUP BY bid
SELECT count(*),  bid FROM Reserves WHERE sid  >  1 GROUP BY bid
SELECT T1.rating,  avg(T1.age) FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  = 'red' GROUP BY T1.rating
SELECT T1.rating,  avg(T1.age) FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.color  = 'red' GROUP BY T1.rating
SELECT name,  rating,  age FROM Sailors ORDER BY rating,  age
SELECT name,  rating,  age FROM Sailors ORDER BY rating,  age
SELECT count(*) FROM Boats
SELECT count(*) FROM Boats
SELECT count(*) FROM Boats WHERE color  = 'red'
SELECT count(*) FROM Boats WHERE color  = 'red'
SELECT T3.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T3.bid  =  T2.bid WHERE T1.age BETWEEN 20 AND 30
SELECT T3.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T1.age BETWEEN 20 AND 30
SELECT name FROM Sailors WHERE rating  >  (SELECT min(rating) FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  = 'red')
SELECT name FROM Sailors WHERE rating  >  (SELECT min(rating) FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid  =  T2.bid WHERE T2.color  = 'red')
SELECT rating FROM Sailors ORDER BY rating DESC LIMIT 1
SELECT max(rating) FROM Sailors
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.name  =  'Melon'
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid  =  T2.sid JOIN Boats AS T3 ON T2.bid  =  T3.bid WHERE T3.name  =  'Melon'
SELECT name,  age FROM Sailors ORDER BY rating DESC
SELECT name,  age FROM Sailors ORDER BY rating DESC
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1
SELECT DISTINCT Model FROM headphone ORDER BY Model
SELECT DISTINCT Model FROM headphone ORDER BY Model ASC
SELECT CLASS FROM headphone GROUP BY CLASS ORDER BY count(*) DESC LIMIT 1
SELECT CLASS FROM headphone GROUP BY CLASS ORDER BY count(*) DESC LIMIT 1
SELECT CLASS FROM headphone GROUP BY CLASS HAVING count(*)  >  2
SELECT CLASS FROM headphone GROUP BY CLASS HAVING count(*)  >  2
SELECT count(*),  CLASS FROM headphone WHERE price  >  200 GROUP BY CLASS
SELECT count(*),  CLASS FROM headphone WHERE price  >  200 GROUP BY CLASS
SELECT count(DISTINCT Earpads) FROM headphone
SELECT count(DISTINCT Earpads) FROM headphone
SELECT Earpads FROM headphone GROUP BY Earpads ORDER BY COUNT(*) DESC LIMIT 2
SELECT Earpads FROM headphone GROUP BY Earpads ORDER BY COUNT(*) DESC LIMIT 2
SELECT model,  CLASS,  Construction FROM headphone ORDER BY price LIMIT 1
SELECT model,  CLASS,  Construction FROM headphone ORDER BY price LIMIT 1
SELECT avg(Price),  Construction FROM headphone GROUP BY Construction
SELECT avg(Price),  Construction FROM headphone GROUP BY Construction
SELECT CLASS FROM headphone WHERE Earpads  =  "Bowls" INTERSECT SELECT CLASS FROM headphone WHERE Earpads  =  "Comfort Pads"
SELECT CLASS FROM headphone WHERE Earpads  =  "Bowls" INTERSECT SELECT CLASS FROM headphone WHERE Earpads  =  "Comfort Pads"
SELECT Earpads FROM headphone EXCEPT SELECT Earpads FROM headphone WHERE Construction  =  "Plastic"
SELECT Earpads FROM headphone WHERE Construction!= "Plastic"
SELECT Model FROM headphone WHERE Price  <  (SELECT avg(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price  <  (SELECT avg(Price) FROM headphone)
SELECT name FROM store ORDER BY date_opened
SELECT name FROM store ORDER BY date_opened
SELECT name,  parking FROM store WHERE neighborhood  =  "Tarzana"
SELECT name,  parking FROM store WHERE neighborhood  =  "Tarzana"
SELECT count(DISTINCT Neighborhood) FROM store
SELECT count(DISTINCT Neighborhood) FROM store
SELECT count(*),  neighborhood FROM store GROUP BY neighborhood
SELECT count(*),  neighborhood FROM store GROUP BY neighborhood
SELECT T1.name,  count(*) FROM store AS T1 JOIN stock AS T2 ON T1.store_id  =  T2.store_id GROUP BY T1.store_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name,  sum(T2.quantity) FROM store AS T1 JOIN stock AS T2 ON T1.store_id  =  T2.store_id GROUP BY T1.store_id
SELECT name FROM store WHERE store_id NOT IN (SELECT store_id FROM stock)
SELECT name FROM store WHERE store_id NOT IN (SELECT store_id FROM stock)
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT T1.Model FROM headphone AS T1 JOIN stock AS T2 ON T1.Headphone_ID  =  T2.Headphone_ID GROUP BY T1.Model ORDER BY sum(T2.Quantity) DESC LIMIT 1
SELECT T1.Model FROM headphone AS T1 JOIN stock AS T2 ON T1.Headphone_ID  =  T2.Headphone_ID GROUP BY T1.Headphone_ID ORDER BY sum(T2.Quantity) DESC LIMIT 1
SELECT sum(T2.quantity) FROM store AS T1 JOIN stock AS T2 ON T1.store_id  =  T2.store_id WHERE T1.name  =  "Woodman"
SELECT sum(T2.quantity) FROM store AS T1 JOIN stock AS T2 ON T1.store_id  =  T2.store_id WHERE T1.name  =  "Woodman"
SELECT Neighborhood FROM store EXCEPT SELECT T1.Neighborhood FROM store AS T1 JOIN stock AS T2 ON T1.Store_ID  =  T2.Store_ID
SELECT Neighborhood FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT count(*) FROM Author
SELECT count(*) FROM Author
SELECT count(*) FROM Paper
SELECT count(*) FROM Paper
SELECT count(*) FROM Affiliation
SELECT count(*) FROM Affiliation
SELECT COUNT ( DISTINCT paper_id ) FROM Paper WHERE venue  =  "NAACL" AND YEAR  =  2000
SELECT COUNT ( DISTINCT paper_id ) FROM Paper WHERE venue  =  "NAACL" AND YEAR  =  2000
SELECT DISTINCT COUNT ( t3.paper_id ) FROM Paper AS t3 JOIN Author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN Affiliation AS t1 ON t2.affiliation_id  =  t1.affiliation_id WHERE t1.name  =  "Columbia University" AND t3.year  =  2009
SELECT COUNT ( DISTINCT t3.paper_id ) FROM Paper AS t3 JOIN Author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN Affiliation AS t1 ON t2.affiliation_id  =  t1.affiliation_id WHERE t1.name  =  "Columbia University" AND t3.year  =  2009
SELECT name,  address FROM Affiliation
SELECT name,  address FROM Affiliation
SELECT DISTINCT venue,  YEAR FROM paper ORDER BY YEAR
SELECT DISTINCT venue FROM paper ORDER BY YEAR
SELECT DISTINCT t1.title,  t1.paper_id FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Affiliation AS t3 ON t2.affiliation_id  =  t3.affiliation_id WHERE t3.name  =  "Harvard University"
SELECT DISTINCT t1.title,  t1.paper_id FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Affiliation AS t3 ON t2.affiliation_id  =  t3.affiliation_id WHERE t3.name  =  "Harvard University"
SELECT DISTINCT t3.paper_id,  t3.title FROM Paper AS t3 JOIN Author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN Author AS t1 ON t2.author_id  =  t1.author_id WHERE t1.name  =  "Mckeown"
SELECT DISTINCT t1.title,  t1.paper_id FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Author AS t3 ON t2.author_id  =  t3.author_id WHERE t3.name  =  "Mckeown"
SELECT DISTINCT t1.title,  t1.paper_id FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Affiliation AS t3 ON t2.affiliation_id  =  t3.affiliation_id WHERE t3.name  =  "Stanford University" INTERSECT SELECT DISTINCT t1.title,  t1.paper_id FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Affiliation AS t3 ON t2.affiliation_id  =  t3.affiliation_id WHERE t3.name  =  "Columbia University"
SELECT DISTINCT t1.title,  t1.paper_id FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Affiliation AS t3 ON t2.affiliation_id  =  t3.affiliation_id WHERE t3.name  =  "Stanford University" INTERSECT SELECT DISTINCT t1.title,  t1.paper_id FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Affiliation AS t3 ON t2.affiliation_id  =  t3.affiliation_id WHERE t3.name  =  "Columbia University"
SELECT DISTINCT t3.paper_id,  t3.title FROM Paper AS t3 JOIN Author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN Author AS t1 ON t2.author_id  =  t1.author_id WHERE t1.name  =  "Mckeown,  Kathleen" AND t2.author_id  =  (SELECT author_id FROM Author WHERE name  =  "Rambow,  Owen")
SELECT DISTINCT t1.title,  t1.paper_id FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Author AS t3 ON t2.author_id  =  t3.author_id WHERE t3.name  =  "Mckeown,  Kathleen" INTERSECT SELECT DISTINCT t1.title,  t1.paper_id FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Author AS t3 ON t2.author_id  =  t3.author_id WHERE t3.name  =  "Rambow,  Owen"
SELECT DISTINCT t1.title,  t1.paper_id FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Author AS t3 ON t2.author_id  =  t3.author_id WHERE t3.name  =  "Mckeown" EXCEPT SELECT DISTINCT t1.title,  t1.paper_id FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Author AS t3 ON t2.author_id  =  t3.author_id WHERE t3.name  =  "Rambow"
SELECT DISTINCT t1.title,  t1.paper_id FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Author AS t3 ON t2.author_id  =  t3.author_id WHERE t3.name  =  "Mckeown" EXCEPT SELECT DISTINCT t1.title,  t1.paper_id FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Author AS t3 ON t2.author_id  =  t3.author_id WHERE t3.name  =  "Rambow"
SELECT DISTINCT t3.paper_id,  t3.title FROM Paper AS t3 JOIN Author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN Author AS t1 ON t2.author_id  =  t1.author_id WHERE t1.name  =  "Mckeown,  Kathleen" OR t1.name  =  "Rambow,  Owen"
SELECT DISTINCT t1.title,  t1.paper_id FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Author AS t3 ON t2.author_id  =  t3.author_id WHERE t3.name  =  "Mckeown,  Kathleen" OR t3.name  =  "Rambow,  Owen"
SELECT T1.name,  COUNT(*) FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id GROUP BY T1.name ORDER BY COUNT(*) DESC
SELECT T1.name,  COUNT(*) FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id GROUP BY T1.author_id ORDER BY COUNT(*) DESC
SELECT T1.name FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T2.affiliation_id ORDER BY count(*) ASC
SELECT T1.name FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T2.affiliation_id ORDER BY count(*) DESC
SELECT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id GROUP BY T1.author_id HAVING COUNT(*)  >  50
SELECT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id GROUP BY T1.author_id HAVING COUNT(*)  >  50
SELECT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id GROUP BY T2.author_id HAVING count(*)  =  1
SELECT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id GROUP BY T1.author_id HAVING count(*)  =  1
SELECT venue,  YEAR FROM paper GROUP BY venue,  YEAR ORDER BY COUNT ( DISTINCT paper_id ) DESC LIMIT 1
SELECT venue,  YEAR FROM paper GROUP BY venue,  YEAR ORDER BY COUNT ( DISTINCT paper_id ) DESC LIMIT 1
SELECT venue FROM paper GROUP BY venue ORDER BY count(*) ASC LIMIT 1
SELECT venue FROM paper GROUP BY venue ORDER BY count(*) ASC LIMIT 1
SELECT DISTINCT COUNT ( t1.paper_id ) FROM Citation AS t1 JOIN Citation AS t2 ON t1.cited_paper_id  =  t2.paper_id WHERE t2.cited_paper_id  =  "A00-1002"
SELECT COUNT ( DISTINCT cited_paper_id ) FROM Citation WHERE cited_paper_id  =  "A00-1002"
SELECT COUNT ( DISTINCT cited_paper_id ) FROM Citation WHERE paper_id  =  "D12-1027"
SELECT COUNT ( DISTINCT cited_paper_id ) FROM Citation WHERE paper_id  =  "D12-1027"
SELECT cited_paper_id,  COUNT ( DISTINCT paper_id ) FROM Citation GROUP BY cited_paper_id ORDER BY COUNT ( DISTINCT paper_id ) DESC LIMIT 1
SELECT cited_paper_id,  COUNT ( DISTINCT paper_id ) FROM Citation GROUP BY cited_paper_id ORDER BY COUNT ( DISTINCT paper_id ) DESC LIMIT 1
SELECT DISTINCT t2.title FROM Citation AS t1 JOIN Paper AS t2 ON t1.cited_paper_id  =  t2.paper_id GROUP BY t2.paper_id ORDER BY COUNT ( DISTINCT t1.paper_id ) DESC LIMIT 1
SELECT DISTINCT t2.title FROM Citation AS t1 JOIN Paper AS t2 ON t1.cited_paper_id  =  t2.paper_id GROUP BY t2.paper_id ORDER BY COUNT ( DISTINCT t1.paper_id ) DESC LIMIT 1
SELECT cited_paper_id,  COUNT ( DISTINCT paper_id ) FROM Citation GROUP BY cited_paper_id ORDER BY COUNT ( DISTINCT paper_id ) DESC LIMIT 10
SELECT cited_paper_id,  COUNT ( DISTINCT paper_id ) FROM Citation GROUP BY cited_paper_id ORDER BY COUNT ( DISTINCT paper_id ) DESC LIMIT 10
SELECT DISTINCT COUNT ( t3.cited_paper_id ) FROM citation AS t3 JOIN author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN author AS t1 ON t2.author_id  =  t1.author_id WHERE t1.name  =  "Mckeown, Kathleen"
SELECT COUNT ( DISTINCT t3.cited_paper_id ) FROM citation AS t3 JOIN author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN author AS t1 ON t2.author_id  =  t1.author_id WHERE t1.name  =  "Mckeown, Kathleen"
SELECT DISTINCT COUNT ( t3.paper_id ) FROM citation AS t2 JOIN author_list AS t3 ON t2.paper_id  =  t3.paper_id JOIN author AS t1 ON t3.author_id  =  t1.author_id WHERE t1.name  =  "Mckeown, Kathleen"
SELECT DISTINCT COUNT ( t3.cited_paper_id ) FROM citation AS t3 JOIN author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN author AS t1 ON t2.author_id  =  t1.author_id WHERE t1.name  =  "Mckeown, Kathleen"
SELECT t3.name,  COUNT ( DISTINCT t1.cited_paper_id ) FROM Citation AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Author AS t3 ON t2.author_id  =  t3.author_id GROUP BY t3.name ORDER BY COUNT ( DISTINCT t1.cited_paper_id ) DESC LIMIT 1
SELECT t3.name,  COUNT ( DISTINCT t1.cited_paper_id ) FROM Citation AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Author AS t3 ON t2.author_id  =  t3.author_id GROUP BY t3.author_id ORDER BY COUNT ( DISTINCT t1.cited_paper_id ) DESC LIMIT 1
SELECT DISTINCT t3.venue,  t3.year FROM paper AS t3 JOIN author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN author AS t1 ON t2.author_id  =  t1.author_id WHERE t1.name  =  "Mckeown, Kathleen"
SELECT DISTINCT t3.venue,  t3.year FROM paper AS t3 JOIN author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN author AS t1 ON t2.author_id  =  t1.author_id WHERE t1.name  =  "Mckeown, Kathleen"
SELECT DISTINCT t3.venue,  t3.year FROM paper AS t3 JOIN author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN affiliation AS t1 ON t2.affiliation_id  =  t1.affiliation_id WHERE t1.name  =  "Columbia University"
SELECT DISTINCT t3.venue,  t3.year FROM paper AS t3 JOIN author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN affiliation AS t1 ON t2.affiliation_id  =  t1.affiliation_id WHERE t1.name  =  "Columbia University"
SELECT t3.name FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Author AS t3 ON t2.author_id  =  t3.author_id WHERE t1.year  =  2009 GROUP BY t3.name ORDER BY count(*) DESC LIMIT 1
SELECT t3.name FROM Paper AS t1 JOIN Author_list AS t2 ON t1.paper_id  =  t2.paper_id JOIN Author AS t3 ON t2.author_id  =  t3.author_id WHERE t1.year  =  2009 GROUP BY t3.name ORDER BY count(*) DESC LIMIT 1
SELECT T3.name FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id  =  T3.affiliation_id WHERE T1.year  =  2009 GROUP BY T3.name ORDER BY count(*) DESC LIMIT 3
SELECT T3.name FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id  =  T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id  =  T3.affiliation_id WHERE T1.year  =  2009 GROUP BY T3.name ORDER BY count(*) DESC LIMIT 3
SELECT COUNT ( DISTINCT t3.paper_id ) FROM paper AS t3 JOIN author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN affiliation AS t1 ON t2.affiliation_id  =  t1.affiliation_id WHERE t1.name  =  "Columbia University" AND t3.year  <=  2009
SELECT COUNT ( DISTINCT t3.paper_id ) FROM paper AS t3 JOIN author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN affiliation AS t1 ON t2.affiliation_id  =  t1.affiliation_id WHERE t1.name  =  "Columbia University" AND t3.year  <=  2009
SELECT COUNT ( DISTINCT t3.paper_id ) FROM Paper AS t3 JOIN Author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN Affiliation AS t1 ON t2.affiliation_id  =  t1.affiliation_id WHERE t1.name  =  "Stanford University" AND t3.year BETWEEN 2000 AND 2009
SELECT COUNT ( DISTINCT t3.paper_id ) FROM Paper AS t3 JOIN Author_list AS t2 ON t3.paper_id  =  t2.paper_id JOIN Affiliation AS t1 ON t2.affiliation_id  =  t1.affiliation_id WHERE t1.name  =  "Stanford University" AND t3.year BETWEEN 2000 AND 2009
SELECT DISTINCT t2.title FROM Author_list AS t1 JOIN Paper AS t2 ON t1.paper_id  =  t2.paper_id GROUP BY t2.paper_id ORDER BY COUNT (DISTINCT t1.author_id) DESC LIMIT 1
SELECT DISTINCT t2.title FROM Author_list AS t1 JOIN Paper AS t2 ON t1.paper_id  =  t2.paper_id GROUP BY t2.paper_id ORDER BY count(*) DESC LIMIT 1
SELECT COUNT ( DISTINCT t1.author_id ) FROM author_list AS t1 JOIN author AS t2 ON t1.author_id  =  t2.author_id WHERE t2.name  =  "Mckeown, Kathleen"
SELECT count(*) FROM author_list AS T1 JOIN author AS T2 ON T1.author_id  =  T2.author_id WHERE T2.name  =  "Mckeown, Kathleen"
SELECT t1.author_id FROM author_list AS t1 JOIN author AS t2 ON t1.author_id  =  t2.author_id WHERE t2.name  =  "Mckeown, Kathleen" GROUP BY t1.author_id ORDER BY count(*) DESC LIMIT 1
SELECT t1.name FROM author_list AS t2 JOIN author AS t1 ON t2.author_id  =  t1.author_id WHERE t1.name  =  "Mckeown, Kathleen" GROUP BY t1.name ORDER BY count(*) DESC LIMIT 1
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
SELECT DISTINCT paper_id,  title FROM Paper EXCEPT SELECT DISTINCT t1.paper_id,  t1.title FROM Paper AS t1 JOIN Citation AS t2 ON t1.paper_id  =  t2.cited_paper_id
SELECT paper_id,  title FROM Paper WHERE paper_id NOT IN (SELECT paper_id FROM Citation)
SELECT T1.name FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id WHERE T1.address LIKE '%China%' GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id WHERE T1.address LIKE '%China%' GROUP BY T1.name ORDER BY count(*) DESC LIMIT 1
SELECT COUNT ( DISTINCT paper_id ),  YEAR,  venue FROM Paper GROUP BY YEAR,  venue
SELECT venue,  YEAR,  COUNT(*) FROM Paper GROUP BY venue,  YEAR
SELECT T1.name,  count(*) FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T1.name
SELECT T1.name,  count(*) FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id  =  T2.affiliation_id GROUP BY T1.name
SELECT DISTINCT t2.title FROM Citation AS t1 JOIN Paper AS t2 ON t1.cited_paper_id  =  t2.paper_id GROUP BY t2.paper_id HAVING COUNT ( DISTINCT t1.paper_id )  >  50
SELECT DISTINCT t2.title FROM Citation AS t1 JOIN Paper AS t2 ON t1.cited_paper_id  =  t2.paper_id GROUP BY t2.paper_id HAVING COUNT ( DISTINCT t1.paper_id )  >  50
SELECT count(*) FROM Author WHERE author_id NOT IN (SELECT DISTINCT t1.author_id FROM Citation AS t2 JOIN Author_list AS t1 ON t2.cited_paper_id  =  t1.paper_id GROUP BY t1.paper_id HAVING COUNT ( DISTINCT t2.paper_id )  >  50)
SELECT count(*) FROM Author WHERE author_id NOT IN (SELECT DISTINCT t1.author_id FROM Citation AS t2 JOIN Author_list AS t1 ON t2.cited_paper_id  =  t1.paper_id GROUP BY t1.author_id HAVING count(*)  >  50)
SELECT DISTINCT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id JOIN Paper AS T3 ON T2.paper_id  =  T3.paper_id WHERE T3.venue  =  "NAACL" INTERSECT SELECT DISTINCT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id JOIN Paper AS T3 ON T2.paper_id  =  T3.paper_id WHERE T3.venue  =  "ACL" AND T3.year  =  2009
SELECT DISTINCT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id JOIN Paper AS T3 ON T2.paper_id  =  T3.paper_id WHERE T3.venue  =  "NAACL" INTERSECT SELECT DISTINCT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id JOIN Paper AS T3 ON T2.paper_id  =  T3.paper_id WHERE T3.venue  =  "ACL" AND T3.year  =  2009
SELECT name FROM Author EXCEPT SELECT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id  =  T2.author_id JOIN Paper AS T3 ON T2.paper_id  =  T3.paper_id WHERE T3.venue  =  "ACL"
SELECT name FROM Author WHERE author_id NOT IN (SELECT author_id FROM Author_list AS T1 JOIN Paper AS T2 ON T1.paper_id  =  T2.paper_id WHERE T2.venue  =  "ACL")
SELECT count(*) FROM conference
SELECT count(*) FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT conference_name,  YEAR,  LOCATION FROM conference
SELECT Conference_Name,  YEAR,  LOCATION FROM conference
SELECT conference_name,  count(*) FROM conference GROUP BY conference_name
SELECT conference_name,  count(*) FROM conference GROUP BY conference_name
SELECT YEAR,  COUNT(*) FROM conference GROUP BY YEAR
SELECT count(*),  YEAR FROM conference GROUP BY YEAR
SELECT YEAR FROM conference GROUP BY YEAR ORDER BY count(*) ASC LIMIT 1
SELECT YEAR FROM conference GROUP BY YEAR ORDER BY count(*) ASC LIMIT 1
SELECT LOCATION FROM conference GROUP BY LOCATION HAVING COUNT(*)  >=  2
SELECT LOCATION FROM conference GROUP BY LOCATION HAVING COUNT(*)  >=  2
SELECT institution_name,  LOCATION,  founded FROM institution
SELECT institution_name,  LOCATION,  founded FROM institution
SELECT count(*) FROM institution WHERE founded BETWEEN 1850 AND 1900
SELECT count(*) FROM institution WHERE founded BETWEEN 1850 AND 1900
SELECT institution_name,  LOCATION FROM institution ORDER BY founded DESC LIMIT 1
SELECT institution_name,  LOCATION FROM institution ORDER BY founded DESC LIMIT 1
SELECT T1.institution_name,  count(*) FROM institution AS T1 JOIN staff AS T2 ON T1.institution_id  =  T2.institution_id WHERE T1.founded  >  1800 GROUP BY T1.institution_name
SELECT T1.institution_id,  count(*),  T2.name FROM institution AS T1 JOIN staff AS T2 ON T1.institution_id  =  T2.institution_id WHERE T1.founded  >  1800 GROUP BY T1.institution_id
SELECT institution_name FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM staff)
SELECT institution_name FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM staff)
SELECT name FROM staff WHERE age  >  (SELECT avg(age) FROM staff)
SELECT name FROM staff WHERE age  >  (SELECT avg(age) FROM staff)
SELECT max(Age),  min(Age) FROM staff WHERE Nationality  =  'United States'
SELECT max(age),  min(age) FROM staff
SELECT T1.conference_name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.conference_id  =  T2.conference_id JOIN staff AS T3 ON T2.staff_id  =  T3.staff_id WHERE T3.Nationality  =  'Canada'
SELECT T1.conference_name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.conference_id  =  T2.conference_id JOIN staff AS T3 ON T2.staff_id  =  T3.staff_id WHERE T3.Nationality  =  "Canada"
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.role  =  'Speaker' INTERSECT SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.role  =  'Sponsor'
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.role  =  'Speaker' INTERSECT SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id WHERE T2.role  =  'Sponsor'
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id JOIN Conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T3.Conference_Name  =  'ACL' INTERSECT SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id JOIN Conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T3.Conference_Name  =  'Naccl'
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id JOIN Conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T3.Conference_Name  =  "ACL" INTERSECT SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id JOIN Conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T3.Conference_Name  =  "Naccl"
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id JOIN Conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T3.year  =  2003 OR T3.year  =  2004
SELECT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_id  =  T2.staff_id JOIN Conference AS T3 ON T2.Conference_ID  =  T3.Conference_ID WHERE T3.year  =  2003 OR T3.year  =  2004
SELECT T1.Conference_Name,  T1.Year,  count(*) FROM Conference AS T1 JOIN Conference_participation AS T2 ON T1.Conference_ID  =  T2.Conference_ID GROUP BY T1.Conference_Name,  T1.Year
SELECT T1.Conference_ID,  T1.Conference_Name,  T1.Year,  count(*) FROM Conference AS T1 JOIN Conference_participation AS T2 ON T1.Conference_ID  =  T2.Conference_ID GROUP BY T1.Conference_ID
SELECT T1.conference_name FROM Conference AS T1 JOIN Conference_participation AS T2 ON T1.conference_id  =  T2.conference_id GROUP BY T1.conference_name ORDER BY count(*) DESC LIMIT 2
SELECT T1.Conference_Name FROM Conference AS T1 JOIN Conference_participation AS T2 ON T1.Conference_ID  =  T2.Conference_ID GROUP BY T1.Conference_Name ORDER BY count(*) DESC LIMIT 2
SELECT name,  nationality FROM staff WHERE staff_id NOT IN (SELECT staff_id FROM Conference_participation AS T1 JOIN Conference AS T2 ON T1.Conference_ID  =  T2.Conference_ID WHERE T2.Conference_Name  =  "ACL")
SELECT name,  nationality FROM staff WHERE staff_id NOT IN (SELECT staff_id FROM Conference_participation AS T1 JOIN Conference AS T2 ON T1.Conference_ID  =  T2.Conference_ID WHERE T2.Conference_Name  =  "ACL")
SELECT institution_name,  LOCATION FROM institution WHERE institution_id NOT IN (SELECT T1.institution_id FROM staff AS T1 JOIN Conference_participation AS T2 ON T1.staff_id  =  T2.staff_id JOIN Conference AS T3 ON T2.Conference_id  =  T3.Conference_id WHERE T3.year  =  2004)
SELECT institution_name,  LOCATION FROM institution WHERE institution_id NOT IN (SELECT T1.institution_id FROM staff AS T1 JOIN Conference_participation AS T2 ON T1.staff_id  =  T2.staff_id JOIN Conference AS T3 ON T2.Conference_id  =  T3.Conference_id WHERE T3.year  =  2004)
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM PilotSkills WHERE age  <  (SELECT avg(age) FROM PilotSkills) ORDER BY age
SELECT pilot_name FROM PilotSkills WHERE age  <  (SELECT avg(age) FROM PilotSkills) ORDER BY age ASC
SELECT * FROM PilotSkills WHERE age  <  30
SELECT * FROM pilotskills WHERE age  <  30
SELECT pilot_name FROM PilotSkills WHERE plane_name  =  "Piper Cub" AND age  <  35
SELECT pilot_name FROM PilotSkills WHERE age  <  35 AND plane_name  =  "Piper Cub"
SELECT LOCATION FROM hangar WHERE plane_name  =  "F-14 Fighter"
SELECT LOCATION FROM hangar WHERE plane_name  =  "F-14 Fighter"
SELECT count(DISTINCT LOCATION) FROM hangar
SELECT count(DISTINCT LOCATION) FROM hangar
SELECT plane_name FROM pilotskills WHERE pilot_name  =  "Jones" AND age  =  32
SELECT plane_name FROM pilotskills WHERE pilot_name  =  "Jones" AND age  =  32
SELECT count(*) FROM pilotskills WHERE age  >  40
SELECT count(*) FROM pilotskills WHERE age  >  40
SELECT count(*) FROM pilotskills WHERE plane_name  =  "B-52 Bomber" AND age  <  35
SELECT count(*) FROM pilotskills WHERE plane_name  =  "B-52 Bomber" AND age  <  35
SELECT pilot_name FROM pilotskills WHERE plane_name  =  "Piper Cub" ORDER BY age LIMIT 1
SELECT pilot_name FROM pilotskills WHERE plane_name  =  "Piper Cub" AND age  =  (SELECT min(age) FROM pilotskills WHERE plane_name  =  "Piper Cub")
SELECT plane_name FROM pilotskills GROUP BY plane_name ORDER BY count(*) DESC LIMIT 1
SELECT plane_name FROM pilotskills GROUP BY plane_name ORDER BY count(*) DESC LIMIT 1
SELECT plane_name FROM pilotskills GROUP BY plane_name ORDER BY count(*) ASC LIMIT 1
SELECT plane_name FROM pilotskills GROUP BY plane_name ORDER BY count(*) ASC LIMIT 1
SELECT count(*) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Chicago'
SELECT count(*) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Chicago'
SELECT plane_name FROM pilotskills WHERE pilot_name  =  "Smith" AND age  =  41
SELECT plane_name FROM pilotskills WHERE pilot_name  =  "Smith" AND age  =  41
SELECT count(DISTINCT plane_name) FROM pilotskills
SELECT count(DISTINCT plane_name) FROM pilotskills
SELECT count(*) FROM pilotskills WHERE pilot_name  =  "Smith"
SELECT count(*) FROM pilotskills WHERE pilot_name  =  "Smith"
SELECT count(DISTINCT plane_name) FROM pilotskills WHERE age  >  40
SELECT count(*) FROM pilotskills WHERE age  >  40
SELECT pilot_name FROM pilotskills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM pilotskills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM pilotskills ORDER BY age DESC
SELECT pilot_name FROM pilotskills ORDER BY age DESC
SELECT LOCATION FROM hangar ORDER BY plane_name
SELECT LOCATION FROM hangar ORDER BY plane_name
SELECT DISTINCT plane_name FROM pilotskills ORDER BY plane_name
SELECT DISTINCT plane_name FROM pilotskills ORDER BY plane_name
SELECT count(*) FROM pilotskills WHERE age  >  40 OR age  <  30
SELECT count(*) FROM pilotskills WHERE age  >  40 OR age  <  30
SELECT pilot_name,  age FROM pilotskills WHERE plane_name  =  'Piper Cub' AND age  >  35 OR plane_name  =  'F-14 Fighter' AND age  <  30
SELECT pilot_name,  age FROM pilotskills WHERE plane_name  =  'Piper Cub' AND age  >  35 OR plane_name  =  'F-14 Fighter' AND age  <  30
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' EXCEPT SELECT pilot_name FROM pilotskills WHERE plane_name  =  'B-52 Bomber'
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' EXCEPT SELECT pilot_name FROM pilotskills WHERE plane_name  =  'B-52 Bomber'
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' INTERSECT SELECT pilot_name FROM pilotskills WHERE plane_name  =  'B-52 Bomber'
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' INTERSECT SELECT pilot_name FROM pilotskills WHERE plane_name  =  'B-52 Bomber'
SELECT avg(age),  min(age) FROM pilotskills
SELECT avg(age),  min(age) FROM pilotskills
SELECT T1.pilot_name FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Austin' INTERSECT SELECT T1.pilot_name FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Boston'
SELECT T1.pilot_name FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Austin' INTERSECT SELECT T1.pilot_name FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Boston'
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' OR plane_name  =  'F-14 Fighter'
SELECT pilot_name FROM pilotskills WHERE plane_name  =  'Piper Cub' OR plane_name  =  'F-14 Fighter'
SELECT avg(age),  plane_name FROM pilotskills GROUP BY plane_name
SELECT plane_name,  avg(age) FROM pilotskills GROUP BY plane_name
SELECT count(*),  plane_name FROM pilotskills GROUP BY plane_name
SELECT count(*),  plane_name FROM pilotskills GROUP BY plane_name
SELECT pilot_name,  plane_name FROM pilotskills ORDER BY plane_name,  age DESC LIMIT 1
SELECT DISTINCT plane_name,  pilot_name FROM pilotskills ORDER BY pilot_name DESC,  plane_name
SELECT plane_name,  max(age) FROM pilotskills GROUP BY plane_name
SELECT plane_name,  pilot_name FROM pilotskills ORDER BY age DESC LIMIT 1
SELECT max(age),  pilot_name FROM pilotskills GROUP BY pilot_name
SELECT pilot_name,  max(age) FROM pilotskills GROUP BY pilot_name
SELECT count(*),  avg(T1.age),  T2.location FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name GROUP BY T2.location
SELECT T2.location,  count(*),  avg(T1.age) FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name GROUP BY T2.location
SELECT count(*),  plane_name FROM pilotskills GROUP BY plane_name HAVING avg(age)  <  35
SELECT plane_name,  count(*) FROM pilotskills GROUP BY plane_name HAVING avg(age)  <  35
SELECT T2.location FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name ORDER BY T1.age LIMIT 1
SELECT T2.location FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name ORDER BY T1.age LIMIT 1
SELECT T1.pilot_name,  T1.age FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  'Austin'
SELECT T1.pilot_name,  T1.age FROM pilotskills AS T1 JOIN hangar AS T2 ON T1.plane_name  =  T2.plane_name WHERE T2.location  =  "Austin"
SELECT pilot_name FROM pilotskills WHERE age  >  (SELECT min(age) FROM pilotskills WHERE plane_name  =  'Piper Cub') ORDER BY pilot_name
SELECT pilot_name FROM pilotskills WHERE age  >  (SELECT max(age) FROM pilotskills WHERE plane_name  =  'Piper Cub') ORDER BY pilot_name
SELECT count(*) FROM pilotskills WHERE age  <  (SELECT min(age) FROM pilotskills WHERE plane_name  =  'F-14 Fighter')
SELECT count(*) FROM pilotskills WHERE age  <  (SELECT min(age) FROM pilotskills WHERE plane_name  =  'F-14 Fighter')
SELECT DISTINCT plane_name FROM pilotskills WHERE plane_name LIKE '%Bomber%'
SELECT DISTINCT plane_name FROM pilotskills WHERE plane_name LIKE '%Bomber%'
SELECT count(*) FROM pilotskills WHERE age  >  (SELECT min(age) FROM pilotskills WHERE plane_name  =  'Piper Cub')
SELECT count(*) FROM pilotskills WHERE age  >  (SELECT min(age) FROM pilotskills WHERE plane_name  =  'Piper Cub')
SELECT name FROM district ORDER BY area_km DESC LIMIT 1
SELECT Area_km,  Government_website FROM district ORDER BY Population LIMIT 1
SELECT Name,  Population FROM district WHERE Area_km  >  (SELECT avg(Area_km) FROM district)
SELECT max(Area_km),  avg(Area_km) FROM district
SELECT sum(Population) FROM district ORDER BY Area_km DESC LIMIT 3
SELECT district_id,  name,  government_website FROM district ORDER BY Population
SELECT Name FROM district WHERE Government_website LIKE '%gov%'
SELECT district_id,  name FROM district WHERE Population  >  4000 OR Area_km  >  3000
SELECT Name,  Speach_title FROM spokesman
SELECT avg(Points),  avg(Age) FROM spokesman WHERE Rank_position  =  1
SELECT Name,  Points FROM spokesman WHERE Age  <  40
SELECT Name FROM spokesman ORDER BY Age DESC LIMIT 1
SELECT Name FROM spokesman WHERE Points  <  (SELECT avg(Points) FROM spokesman)
SELECT t1.name FROM district AS t1 JOIN spokesman_district AS t2 ON t1.district_id  =  t2.district_id GROUP BY t1.district_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM spokesman AS T1 JOIN spokesman_district AS T2 ON T1.spokesman_id  =  T2.spokesman_id WHERE T2.start_year  <  2004
SELECT T1.name,  count(*) FROM district AS T1 JOIN spokesman_district AS T2 ON T1.district_id  =  T2.district_id GROUP BY T1.district_id
SELECT T3.name FROM spokesman AS T1 JOIN spokesman_district AS T2 ON T1.spokesman_id  =  T2.spokesman_id JOIN district AS T3 ON T2.district_id  =  T3.district_id WHERE T1.rank_position  =  1 INTERSECT SELECT T3.name FROM spokesman AS T1 JOIN spokesman_district AS T2 ON T1.spokesman_id  =  T2.spokesman_id JOIN district AS T3 ON T2.district_id  =  T3.district_id WHERE T1.rank_position  =  2
SELECT T1.name FROM district AS T1 JOIN spokesman_district AS T2 ON T1.district_id  =  T2.district_id GROUP BY T2.district_id HAVING count(*)  >  1
SELECT count(*) FROM district WHERE district_id NOT IN (SELECT district_id FROM spokesman_district)
SELECT name FROM spokesman WHERE spokesman_id NOT IN (SELECT spokesman_id FROM spokesman_district)
SELECT sum(T1.Population),  avg(T1.Population) FROM district AS T1 JOIN spokesman_district AS T2 ON T1.District_ID  =  T2.District_ID
SELECT title FROM sculptures ORDER BY YEAR DESC LIMIT 1
SELECT title FROM sculptures ORDER BY YEAR DESC LIMIT 1
SELECT title,  LOCATION FROM paintings ORDER BY YEAR LIMIT 1
SELECT title,  LOCATION FROM paintings ORDER BY YEAR LIMIT 1
SELECT title FROM sculptures WHERE LOCATION  =  "Gallery 226"
SELECT title FROM sculptures WHERE LOCATION  =  "Gallery 226"
SELECT title,  LOCATION FROM paintings
SELECT title,  LOCATION FROM paintings
SELECT title,  LOCATION FROM sculptures
SELECT title,  LOCATION FROM sculptures
SELECT medium FROM paintings WHERE paintingID = 80
SELECT medium FROM paintings WHERE paintingID = 80
SELECT fname,  lname FROM artists WHERE birthyear  >  1850
SELECT fname,  lname FROM artists WHERE birthyear  >  1850
SELECT title,  YEAR FROM sculptures WHERE LOCATION!= "Gallery 226"
SELECT title,  YEAR FROM sculptures WHERE LOCATION!= "Gallery 226"
SELECT DISTINCT T1.fname,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  <  1900
SELECT DISTINCT T1.fname,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  <  1900
SELECT DISTINCT T1.birthyear FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  >  1920
SELECT DISTINCT T1.birthyear FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.year  >  1920
SELECT fname,  lname FROM artists ORDER BY deathYear DESC LIMIT 1
SELECT fname,  lname FROM artists ORDER BY deathYear DESC LIMIT 1
SELECT birthYear - deathYear FROM artists ORDER BY birthYear - deathYear LIMIT 1
SELECT birthYear FROM artists ORDER BY deathYear - birthYear LIMIT 1
SELECT fname,  deathYear - birthYear FROM artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT fname,  deathYear - birthYear FROM artists ORDER BY deathYear - birthYear DESC LIMIT 1
SELECT count(*) FROM paintings WHERE LOCATION  =  "Gallery 240"
SELECT count(*) FROM paintings WHERE LOCATION  =  "Gallery 240"
SELECT count(*) FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.deathyyear  -  T1.birthyear  =  (SELECT max(deathyyear  -  birthyear) FROM artists)
SELECT count(*) FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid ORDER BY T1.deathyyear - T1.birthyear DESC LIMIT 1
SELECT T2.title,  T2.year FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.fname  =  "Mary"
SELECT T2.title,  T2.year FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.fname  =  "Mary"
SELECT T2.width_mm FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.birthyear  <  1850
SELECT T2.width_mm FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.birthyear  <  1850
SELECT T2.location,  T2.medium FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.fname  =  "Pablo"
SELECT T2.location,  T2.mediumOn FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T1.fname  =  "Pablo"
SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid INTERSECT SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.painterid  =  T2.painterid
SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid UNION SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid
SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  "oil" INTERSECT SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  "lithograph"
SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  "oil" INTERSECT SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  "lithograph"
SELECT T1.birthyear FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.year  =  1884 AND T2.mediumOn  =  "canvas"
SELECT T1.birthYear FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.year  =  1884
SELECT DISTINCT T1.fname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.location  =  "Gallery 241" AND T2.medium  =  "oil"
SELECT T1.fname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.location  =  "Gallery 241" AND T2.medium  =  "oil"
SELECT count(*),  medium FROM paintings GROUP BY medium
SELECT count(*),  medium FROM paintings GROUP BY medium
SELECT avg(height_mm),  medium FROM paintings GROUP BY medium
SELECT avg(height_mm),  medium FROM paintings GROUP BY medium
SELECT count(*),  LOCATION FROM paintings WHERE YEAR  <  1900 GROUP BY LOCATION
SELECT count(*),  LOCATION FROM paintings WHERE YEAR  <  1900 GROUP BY LOCATION
SELECT title FROM paintings WHERE YEAR  >  1910 AND medium  =  "oil"
SELECT title FROM paintings WHERE YEAR  >  1910 AND medium  =  "oil"
SELECT DISTINCT painterID FROM paintings WHERE medium  =  "oil" AND LOCATION  =  "Gallery 240"
SELECT DISTINCT painterID FROM paintings WHERE medium  =  "oil" AND LOCATION  =  "Gallery 240"
SELECT DISTINCT title FROM paintings WHERE height_mm  >  (SELECT max(height_mm) FROM paintings WHERE medium  =  "canvas")
SELECT DISTINCT title FROM paintings WHERE height_mm  >  (SELECT min(height_mm) FROM paintings WHERE medium  =  "canvas")
SELECT DISTINCT paintingid FROM paintings WHERE YEAR  <  (SELECT min(YEAR) FROM paintings WHERE LOCATION  =  "Gallery 240")
SELECT DISTINCT paintingid FROM paintings WHERE YEAR  <  (SELECT min(YEAR) FROM paintings WHERE LOCATION  =  "Gallery 240")
SELECT paintingID FROM paintings ORDER BY YEAR LIMIT 1
SELECT paintingID FROM paintings ORDER BY YEAR ASC LIMIT 1
SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.title LIKE "%female%"
SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid WHERE T2.title LIKE "%female%"
SELECT DISTINCT title FROM paintings ORDER BY title
SELECT DISTINCT title FROM paintings ORDER BY title
SELECT DISTINCT title FROM paintings ORDER BY LENGTH (title)
SELECT DISTINCT title FROM paintings ORDER BY height_mm
SELECT title FROM paintings WHERE YEAR BETWEEN 1900 AND 1950 UNION SELECT title FROM sculptures WHERE YEAR BETWEEN 1900 AND 1950
SELECT title FROM paintings WHERE YEAR BETWEEN 1900 AND 1950 UNION SELECT title FROM sculptures WHERE YEAR BETWEEN 1900 AND 1950
SELECT T2.title FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid JOIN sculptures AS T3 ON T1.artistid  =  T3.sculptorid WHERE T1.artistid  =  222
SELECT T2.title FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid JOIN sculptures AS T3 ON T1.artistid  =  T3.sculptorid WHERE T1.artistid  =  222
SELECT T1.artistid FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.year  <  1900 GROUP BY T1.artistid ORDER BY count(*) DESC LIMIT 1
SELECT T1.artistid FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.year  <  1900 GROUP BY T1.artistid ORDER BY count(*) DESC LIMIT 1
SELECT T1.fname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid GROUP BY T1.fname ORDER BY count(*) DESC LIMIT 1
SELECT T1.fname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid GROUP BY T2.sculptorid ORDER BY count(*) DESC LIMIT 1
SELECT title FROM paintings WHERE width_mm  <  600 OR height_mm  >  800
SELECT title FROM paintings WHERE width_mm  <  600 OR height_mm  >  800
SELECT LOCATION FROM paintings WHERE YEAR  <  1885 OR YEAR  >  1930
SELECT DISTINCT LOCATION FROM paintings WHERE YEAR  <  1885 OR YEAR  >  1930
SELECT paintingID FROM paintings WHERE height_mm  >  500 AND height_mm  <  2000
SELECT paintingID FROM paintings WHERE height_mm  >  500 AND height_mm  <  2000
SELECT LOCATION FROM paintings WHERE medium  =  "panel" INTERSECT SELECT LOCATION FROM paintings WHERE medium  =  "canvas"
SELECT LOCATION FROM paintings WHERE medium  =  "panel" INTERSECT SELECT LOCATION FROM paintings WHERE medium  =  "canvas"
SELECT LOCATION FROM paintings WHERE YEAR  <  1885 INTERSECT SELECT LOCATION FROM paintings WHERE YEAR  >  1930
SELECT LOCATION FROM paintings WHERE YEAR  <  1885 INTERSECT SELECT LOCATION FROM paintings WHERE YEAR  >  1930
SELECT avg(height_mm),  avg(width_mm) FROM paintings WHERE medium  =  "oil" AND LOCATION  =  "Gallery 241"
SELECT avg(height_mm),  avg(width_mm) FROM paintings WHERE medium  =  "oil" AND LOCATION  =  "Gallery 241"
SELECT max(height_mm),  paintingid FROM paintings WHERE YEAR  <  1900
SELECT height_mm,  paintingID FROM paintings WHERE YEAR  <  1900 ORDER BY height_mm DESC LIMIT 1
SELECT max(height_mm),  max(width_mm),  YEAR FROM paintings GROUP BY YEAR
SELECT max(height_mm),  max(width_mm),  YEAR FROM paintings GROUP BY YEAR
SELECT avg(height_mm),  avg(width_mm),  painterID FROM paintings GROUP BY painterID ORDER BY painterID
SELECT avg(height_mm),  avg(width_mm),  painterID FROM paintings GROUP BY painterID ORDER BY painterID
SELECT T1.fname,  count(*) FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid GROUP BY T1.artistid HAVING count(*)  >=  2
SELECT T1.fname,  count(*) FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid GROUP BY T1.fname HAVING count(*)  >=  2
SELECT T1.deathyear FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid GROUP BY T1.artistid HAVING count(*)  <=  3
SELECT T1.deathyear FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid GROUP BY T1.artistid HAVING count(*)  <  4
SELECT T1.deathyear FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid GROUP BY T1.artistid ORDER BY count(*) ASC LIMIT 1
SELECT T1.deathyear FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid GROUP BY T1.artistid ORDER BY count(*) ASC LIMIT 1
SELECT paintingid,  height_mm FROM paintings WHERE width_mm  =  (SELECT max(width_mm) FROM paintings WHERE LOCATION  =  "Gallery 240")
SELECT height_mm,  paintingid FROM paintings WHERE width_mm  =  (SELECT max(width_mm) FROM paintings WHERE LOCATION  =  "Gallery 240")
SELECT paintingID FROM paintings WHERE YEAR  <  (SELECT min(YEAR) FROM paintings WHERE LOCATION  =  "Gallery 240")
SELECT paintingID FROM paintings WHERE YEAR  <  (SELECT min(YEAR) FROM paintings WHERE LOCATION  =  "Gallery 240")
SELECT paintingID FROM paintings WHERE height_mm  >  (SELECT max(height_mm) FROM paintings WHERE YEAR  >  1900)
SELECT paintingID FROM paintings WHERE height_mm  >  (SELECT max(height_mm) FROM paintings WHERE YEAR  >  1900)
SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  "oil" GROUP BY T1.artistid ORDER BY count(*) DESC LIMIT 3
SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid WHERE T2.medium  =  "oil" GROUP BY T1.artistid ORDER BY count(*) DESC LIMIT 1
SELECT paintingid,  LOCATION,  title FROM paintings WHERE medium  =  "oil" ORDER BY YEAR
SELECT paintingid,  LOCATION,  title FROM paintings WHERE medium  =  "oil" ORDER BY YEAR
SELECT YEAR,  LOCATION,  title FROM paintings WHERE height_mm  >  1000 ORDER BY title
SELECT YEAR,  LOCATION,  title FROM paintings WHERE height_mm  >  1000 ORDER BY title
SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN paintings AS T2 ON T1.artistid  =  T2.painterid EXCEPT SELECT T1.fname,  T1.lname FROM artists AS T1 JOIN sculptures AS T2 ON T1.artistid  =  T2.sculptorid
SELECT fname,  lname FROM artists WHERE artistid NOT IN (SELECT sculptorid FROM sculptures)
SELECT LOCATION FROM paintings WHERE YEAR  <  1885 EXCEPT SELECT LOCATION FROM paintings WHERE mediumOn  =  "canvas"
SELECT title FROM paintings WHERE YEAR  <  1885 AND medium!= "canvas"
SELECT count(*) FROM race
SELECT count(*) FROM race
SELECT Winning_driver,  Winning_team FROM race ORDER BY Winning_team ASC
SELECT Winning_driver,  Winning_team FROM race ORDER BY Winning_team ASC
SELECT Winning_driver FROM race WHERE Pole_Position!= "Junior Strous"
SELECT Winning_driver FROM race WHERE Pole_Position!= "Junior Strous"
SELECT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Entrant FROM driver WHERE Age  >=  20
SELECT DISTINCT Entrant FROM driver WHERE Age  >=  20
SELECT max(age),  min(age) FROM driver
SELECT max(age),  min(age) FROM driver
SELECT count(DISTINCT Engine) FROM driver WHERE Age  >  30 OR Age  <  20
SELECT count(DISTINCT Engine) FROM driver WHERE Age  >  30 OR Age  <  20
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT T1.driver_name,  T2.race_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id
SELECT T1.driver_name,  T2.race_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id
SELECT T1.Driver_Name,  COUNT(*) FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T1.Driver_Name
SELECT T1.driver_name,  count(*) FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id GROUP BY T1.driver_name
SELECT T1.Age FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T2.Driver_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Age FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID GROUP BY T2.Driver_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.driver_name,  T1.age FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id GROUP BY T1.driver_id HAVING count(*)  >=  2
SELECT T1.driver_name,  T1.age FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id GROUP BY T1.driver_id HAVING count(*)  >=  2
SELECT T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T1.Age  >=  26
SELECT T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T1.Age  >=  26
SELECT Driver_Name FROM driver WHERE Constructor!= "Bugatti"
SELECT Driver_Name FROM driver WHERE Constructor!= 'Bugatti'
SELECT Constructor,  COUNT(*) FROM driver GROUP BY Constructor
SELECT Constructor,  COUNT(*) FROM driver GROUP BY Constructor
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*)  >=  2
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*)  >=  2
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Constructor FROM driver WHERE Age  <  20 INTERSECT SELECT Constructor FROM driver WHERE Age  >  30
SELECT Constructor FROM driver WHERE Age  <  20 INTERSECT SELECT Constructor FROM driver WHERE Age  >  30
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(*)  >  1
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(*)  >  1
SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T2.Pole_Position  =  "James Hinchcliffe" INTERSECT SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T2.Pole_Position  =  "Carl Skerlong"
SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T2.Pole_Position  =  "James Hinchcliffe" INTERSECT SELECT T1.Driver_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID  =  T2.Driver_ID WHERE T2.Pole_Position  =  "Carl Skerlong"
SELECT driver_name FROM driver EXCEPT SELECT T2.driver_name FROM race AS T1 JOIN driver AS T2 ON T1.driver_id  =  T2.driver_id WHERE T1.pole_position  =  "James Hinchcliffe"
SELECT T1.driver_name FROM driver AS T1 JOIN race AS T2 ON T1.driver_id  =  T2.driver_id WHERE T2.pole_position!= "James Hinchcliffe"
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
SELECT max(health_score),  min(health_score) FROM countries WHERE name!= "Norway"
SELECT max(health_score),  min(health_score) FROM countries WHERE name!= "Norway"
SELECT count(DISTINCT language_id) FROM official_languages
SELECT count(DISTINCT language_id) FROM official_languages
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1
SELECT T1.name,  T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id
SELECT T1.name,  T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id
SELECT T2.name,  COUNT(*) FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.name
SELECT T2.name,  COUNT(*) FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.name
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T1.language_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.name ORDER BY count(*) DESC LIMIT 1
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T1.language_id HAVING count(*)  >=  2
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T1.language_id HAVING count(*)  >=  2
SELECT avg(T1.overall_score) FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T3.name  =  "English"
SELECT avg(T1.overall_score) FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T3.name  =  "English"
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T2.name ORDER BY count(*) DESC LIMIT 3
SELECT T2.name FROM official_languages AS T1 JOIN languages AS T2 ON T1.language_id  =  T2.id GROUP BY T1.language_id ORDER BY count(*) DESC LIMIT 3
SELECT T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id GROUP BY T3.name ORDER BY avg(T1.overall_score) DESC
SELECT T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id GROUP BY T3.id ORDER BY avg(T1.overall_score) DESC
SELECT T1.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT T1.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T1.overall_score  >  95 INTERSECT SELECT T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T1.overall_score  <  90
SELECT T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T1.overall_score  >  95 INTERSECT SELECT T3.name FROM countries AS T1 JOIN official_languages AS T2 ON T1.id  =  T2.country_id JOIN languages AS T3 ON T2.language_id  =  T3.id WHERE T1.overall_score  <  90
SELECT country,  town_city FROM Addresses
SELECT country,  town_city FROM Addresses
SELECT T1.county_state_province FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id
SELECT T1.county_state_province FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id
SELECT feature_description FROM Features WHERE feature_name  =  "rooftop"
SELECT feature_description FROM Features WHERE feature_name  =  "rooftop"
SELECT T1.feature_name,  T1.feature_description FROM Features AS T1 JOIN Property_Features AS T2 ON T1.feature_id  =  T2.feature_id GROUP BY T2.feature_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.feature_name,  T1.feature_description FROM Features AS T1 JOIN Property_Features AS T2 ON T1.feature_id  =  T2.feature_id GROUP BY T2.feature_id ORDER BY count(*) DESC LIMIT 1
SELECT min(room_count) FROM Properties
SELECT min(room_count) FROM Properties
SELECT count(*) FROM Properties WHERE parking_lots  =  1 OR garage_yn  =  1
SELECT count(*) FROM Properties WHERE parking_lots  =  1 OR garage_yn  =  1
SELECT T2.age_category_code FROM Ref_User_Categories AS T1 JOIN Users AS T2 ON T1.user_category_code  =  T2.user_category_code WHERE T1.user_category_description LIKE '%Mother%'
SELECT T2.age_category_code FROM Ref_User_Categories AS T1 JOIN Users AS T2 ON T1.user_category_code  =  T2.user_category_code WHERE T1.user_category_description LIKE "%Mother%"
SELECT T1.first_name FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id GROUP BY T1.user_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.first_name FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id GROUP BY T1.user_id ORDER BY count(*) DESC LIMIT 1
SELECT avg(T3.room_count) FROM Property_Features AS T1 JOIN Features AS T2 ON T1.feature_id  =  T2.feature_id JOIN Properties AS T3 ON T3.property_id  =  T1.property_id WHERE T2.feature_name  =  "garden"
SELECT avg(T3.room_count) FROM Property_Features AS T1 JOIN Features AS T2 ON T1.feature_id  =  T2.feature_id JOIN Properties AS T3 ON T3.property_id  =  T1.property_id WHERE T2.feature_name  =  "garden"
SELECT T2.town_city FROM Properties AS T1 JOIN Addresses AS T2 ON T1.property_address_id  =  T2.address_id JOIN Property_Features AS T3 ON T1.property_id  =  T3.property_id JOIN Features AS T4 ON T3.feature_id  =  T4.feature_id WHERE T4.feature_name  =  "swimming pool"
SELECT T2.town_city FROM Properties AS T1 JOIN Addresses AS T2 ON T1.property_address_id  =  T2.address_id JOIN Property_Features AS T3 ON T1.property_id  =  T3.property_id JOIN Features AS T4 ON T3.feature_id  =  T4.feature_id WHERE T4.feature_name  =  "swimming pool"
SELECT property_id,  vendor_requested_price FROM Properties ORDER BY vendor_requested_price LIMIT 1
SELECT property_id,  vendor_requested_price FROM Properties ORDER BY vendor_requested_price LIMIT 1
SELECT avg(room_count) FROM Properties
SELECT avg(room_count) FROM Properties
SELECT count(DISTINCT room_size) FROM Rooms
SELECT count(DISTINCT room_size) FROM Rooms
SELECT user_id,  search_string FROM User_Searches GROUP BY user_id HAVING count(*)  >=  2
SELECT user_id,  search_seq FROM User_Searches GROUP BY user_id HAVING count(*)  >=  2
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1
SELECT search_datetime,  search_string FROM User_Searches ORDER BY search_string DESC
SELECT search_string,  search_datetime FROM User_Searches ORDER BY search_string DESC
SELECT T1.zip_postcode FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id EXCEPT SELECT T1.zip_postcode FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id GROUP BY T2.owner_user_id HAVING count(*)  <=  2
SELECT T1.zip_postcode FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id EXCEPT SELECT T1.zip_postcode FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id  =  T2.property_address_id GROUP BY T2.owner_user_id HAVING count(*)  <=  2
SELECT T1.user_category_code,  T1.user_id FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  =  1
SELECT T1.user_id,  T1.user_category_code FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  =  1
SELECT T1.age_category_code FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id ORDER BY T2.search_datetime LIMIT 1
SELECT T1.age_category_code FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id ORDER BY T2.search_datetime LIMIT 1
SELECT login_name FROM Users WHERE user_category_code  =  "Senior Citizen" ORDER BY first_name
SELECT login_name FROM Users WHERE user_category_code  =  "Senior Citizen" ORDER BY first_name
SELECT count(*) FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id WHERE T1.is_buyer  =  1
SELECT count(*) FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id WHERE T1.is_buyer  =  1
SELECT date_registered FROM Users WHERE login_name  =  "ratione"
SELECT date_registered FROM Users WHERE login_name  =  "ratione"
SELECT first_name,  middle_name,  last_name,  login_name FROM Users WHERE is_seller  =  1
SELECT first_name,  middle_name,  last_name,  login_name FROM Users WHERE is_seller  =  1
SELECT T1.line_1_number_building,  T1.line_2_number_street,  T1.town_city FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id WHERE T2.age_category_code  =  "Senior Citizen"
SELECT T1.line_1_number_building,  T1.line_2_number_street,  T1.town_city FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id WHERE T2.age_category_code  =  "Senior Citizen"
SELECT count(*) FROM Properties WHERE other_property_details LIKE "%,%" AND other_property_details LIKE "%,%"
SELECT count(*) FROM Properties WHERE other_property_details LIKE "%parking_lots% AND other_property_details LIKE "%garage_yn%"
SELECT count(*),  property_id FROM Property_Photos GROUP BY property_id
SELECT count(*),  property_id FROM Property_Photos GROUP BY property_id
SELECT T1.owner_user_id,  count(*) FROM Properties AS T1 JOIN Property_Photos AS T2 ON T1.property_id  =  T2.property_id GROUP BY T1.owner_user_id
SELECT T1.owner_user_id,  count(*) FROM Properties AS T1 JOIN Property_Photos AS T2 ON T1.property_id  =  T2.property_id GROUP BY T1.owner_user_id
SELECT sum(T1.price_max) FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id  =  T2.user_id WHERE T2.user_category_code  =  "Single Mother" OR T2.user_category_code  =  "Student"
SELECT sum(T1.price_max) FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id  =  T2.user_id WHERE T2.user_category_code  =  "Single Mother" OR T2.user_category_code  =  "Student"
SELECT T1.datestamp,  T2.property_name FROM User_Property_History AS T1 JOIN Properties AS T2 ON T1.property_id  =  T2.property_id ORDER BY T1.datestamp
SELECT T1.datestamp,  T2.property_name FROM User_Property_History AS T1 JOIN Properties AS T2 ON T1.property_id  =  T2.property_id ORDER BY T1.datestamp
SELECT T1.property_type_description,  T1.property_type_code FROM Ref_Property_Types AS T1 JOIN Properties AS T2 ON T1.property_type_code  =  T2.property_type_code GROUP BY T1.property_type_code ORDER BY count(*) DESC LIMIT 1
SELECT T1.property_type_description FROM Ref_Property_Types AS T1 JOIN Properties AS T2 ON T1.property_type_code  =  T2.property_type_code GROUP BY T2.property_type_code ORDER BY count(*) DESC LIMIT 1
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code  =  'Over 60'
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code  =  'Over 60'
SELECT room_size,  count(*) FROM Rooms GROUP BY room_size
SELECT room_size,  count(*) FROM Rooms GROUP BY room_size
SELECT T1.country FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id WHERE T2.first_name  =  "Robbie"
SELECT T1.country FROM Addresses AS T1 JOIN Users AS T2 ON T1.address_id  =  T2.user_address_id WHERE T2.first_name  =  "Robbie"
SELECT T2.first_name,  T2.middle_name,  T2.last_name FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id  =  T2.user_id WHERE T1.property_address_id  =  T2.user_address_id
SELECT T2.first_name,  T2.last_name FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id  =  T2.user_id
SELECT search_string FROM User_Searches WHERE user_id NOT IN (SELECT owner_user_id FROM Properties)
SELECT search_string FROM User_Searches WHERE user_id NOT IN (SELECT owner_user_id FROM Properties)
SELECT T1.last_name,  T1.user_id FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id JOIN Properties AS T3 ON T1.user_id  =  T3.owner_user_id GROUP BY T1.user_id HAVING count(*)  >=  2 INTERSECT SELECT T1.last_name,  T1.user_id FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  <=  2
SELECT T1.last_name,  T1.user_id FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id  =  T2.user_id GROUP BY T1.user_id HAVING count(*)  <=  2 INTERSECT SELECT T1.last_name,  T1.user_id FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id  =  T2.owner_user_id GROUP BY T1.user_id HAVING count(*)  >=  2
SELECT count(*) FROM bike WHERE weight  >  780
SELECT product_name,  weight FROM bike ORDER BY price ASC
SELECT heat,  name,  nation FROM cyclist
SELECT max(weight),  min(weight) FROM bike
SELECT avg(price) FROM bike WHERE material  =  'Carbon CC'
SELECT name,  result FROM cyclist WHERE nation!= 'Russia'
SELECT DISTINCT T1.id,  T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.bike_id WHERE T2.purchase_year  >  2015
SELECT T1.id,  T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.bike_id GROUP BY T1.id HAVING count(*)  >=  4 AND T1.product_name  =  "RACING"
SELECT T1.id,  T1.name FROM cyclist AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.cyclist_id GROUP BY T1.id ORDER BY count(*) DESC LIMIT 1
SELECT DISTINCT T3.product_name FROM cyclist AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.cyclist_id JOIN bike AS T3 ON T2.bike_id  =  T3.id WHERE T1.nation  =  'Russia' OR T1.nation  =  'Great Britain'
SELECT count(DISTINCT heat) FROM cyclist
SELECT count(*) FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes WHERE purchase_year  >  2015)
SELECT DISTINCT T3.product_name FROM cyclist AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.cyclist_id JOIN bike AS T3 ON T2.bike_id  =  T3.id WHERE T1.result  <  '4:21.558'
SELECT T3.product_name,  T3.price FROM cyclist AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.cyclist_id JOIN bike AS T3 ON T2.bike_id  =  T3.id WHERE T1.name  =  'Bradley Wiggins' INTERSECT SELECT T3.product_name,  T3.price FROM cyclist AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id  =  T2.cyclist_id JOIN bike AS T3 ON T2.bike_id  =  T3.id WHERE T1.name  =  'Antonio Tauler'
SELECT name,  nation,  result FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes)
SELECT product_name FROM bike WHERE material LIKE '%fiber%'
SELECT cyclist_id,  count(*) FROM cyclists_own_bikes GROUP BY cyclist_id ORDER BY cyclist_id
SELECT flavor,  max(price) FROM goods WHERE food  =  "Cake" GROUP BY flavor
SELECT id,  flavor FROM goods WHERE food  =  "Cake" ORDER BY price DESC LIMIT 1
SELECT flavor,  min(price) FROM goods WHERE food  =  "Cookie" GROUP BY flavor
SELECT id,  flavor FROM goods WHERE food  =  "Cookie" ORDER BY price LIMIT 1
SELECT id FROM goods WHERE flavor  =  "Apple"
SELECT id FROM goods WHERE flavor  =  "Apple"
SELECT id FROM goods WHERE price  <  3
SELECT id FROM goods WHERE price  <  3
SELECT DISTINCT T3.customerid FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T3.receiptnumber  =  T2.receipt WHERE T1.flavor  =  "Lemon" AND T1.food  =  "Cake"
SELECT DISTINCT T3.customerid FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T3.receiptnumber  =  T2.receipt WHERE T1.flavor  =  "Lemon" AND T1.food  =  "Cake"
SELECT count(*),  T1.food FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T3.receiptnumber  =  T2.receipt GROUP BY T1.food
SELECT count(*),  T1.food FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T3.receiptnumber  =  T2.receipt GROUP BY T1.food
SELECT customerId FROM receipts GROUP BY customerId HAVING count(*)  >=  15
SELECT customerid FROM receipts GROUP BY customerid HAVING count(*)  >=  15
SELECT T2.lastname FROM receipts AS T1 JOIN customers AS T2 ON T1.customerid  =  T2.id GROUP BY T1.customerid HAVING count(*)  >  10
SELECT T2.lastname FROM receipts AS T1 JOIN customers AS T2 ON T1.customerid  =  T2.id GROUP BY T1.customerid HAVING count(*)  >  10
SELECT count(*) FROM goods WHERE food  =  "Cake"
SELECT count(DISTINCT food) FROM goods WHERE food  =  "Cake"
SELECT DISTINCT flavor FROM goods WHERE food  =  "Croissant"
SELECT DISTINCT flavor FROM goods WHERE food  =  "Croissant"
SELECT DISTINCT T1.item FROM items AS T1 JOIN receipts AS T2 ON T1.receipt  =  T2.receiptnumber WHERE T2.customerid  =  15
SELECT DISTINCT T1.item FROM items AS T1 JOIN receipts AS T2 ON T1.receipt  =  T2.receiptnumber WHERE T2.customerid  =  15
SELECT food,  avg(price),  max(price),  min(price) FROM goods GROUP BY food
SELECT food,  avg(price),  min(price),  max(price) FROM goods GROUP BY food
SELECT T1.receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.food  =  "Cake" INTERSECT SELECT T1.receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.food  =  "Cookie"
SELECT T1.receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.food  =  "Cake" INTERSECT SELECT T1.receipt FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.food  =  "Cookie"
SELECT T1.receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id JOIN customers AS T4 ON T1.customerid  =  T4.id WHERE T4.lastname  =  "LOGAN" AND T3.food  =  "Croissant"
SELECT T1.receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id JOIN customers AS T4 ON T1.customerid  =  T4.id WHERE T4.lastname  =  "LOGAN" AND T3.food  =  "Croissant"
SELECT T1.receiptnumber,  T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id ORDER BY T3.price DESC LIMIT 1
SELECT T1.receiptnumber,  T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id ORDER BY T3.price DESC LIMIT 1
SELECT item FROM items GROUP BY item ORDER BY count(*) ASC LIMIT 1
SELECT item FROM items GROUP BY item ORDER BY count(*) ASC LIMIT 1
SELECT food,  count(*) FROM goods GROUP BY food
SELECT food,  count(*) FROM goods GROUP BY food
SELECT avg(price),  food FROM goods GROUP BY food
SELECT avg(price),  food FROM goods GROUP BY food
SELECT id FROM goods WHERE flavor  =  "Apricot" AND price  <  5
SELECT id FROM goods WHERE flavor  =  "Apricot" AND price  <  5
SELECT Flavor FROM goods WHERE Price  >  10 AND Food  =  "Cake"
SELECT Flavor FROM goods WHERE Price  >  10 AND Food  =  "Cake"
SELECT DISTINCT id,  price FROM goods WHERE price  <  (SELECT avg(price) FROM goods)
SELECT DISTINCT id,  price FROM goods WHERE price  <  (SELECT avg(price) FROM goods)
SELECT DISTINCT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE food  =  "Tart")
SELECT DISTINCT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE food  =  "Tart")
SELECT DISTINCT T1.receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  13
SELECT DISTINCT T1.receiptnumber FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  13
SELECT T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  15
SELECT T1.date FROM receipts AS T1 JOIN items AS T2 ON T1.receiptnumber  =  T2.receipt JOIN goods AS T3 ON T2.item  =  T3.id WHERE T3.price  >  15
SELECT id FROM goods WHERE id LIKE "%APP%"
SELECT id FROM goods WHERE id LIKE "%APP%"
SELECT price FROM goods WHERE id LIKE "%70%"
SELECT id,  price FROM goods WHERE id LIKE "%70%"
SELECT lastname FROM customers ORDER BY lastname
SELECT lastname FROM customers ORDER BY lastname
SELECT id FROM goods ORDER BY id
SELECT DISTINCT id FROM goods
SELECT T3.receiptnumber FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id JOIN receipts AS T3 ON T3.receiptnumber  =  T1.receipt WHERE T2.flavor  =  "Apple" OR T3.customerid  =  12
SELECT T3.receiptnumber FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id JOIN receipts AS T3 ON T1.receipt  =  T3.receiptnumber WHERE T2.flavor  =  "Apple" UNION SELECT T3.receiptnumber FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id JOIN receipts AS T3 ON T1.receipt  =  T3.receiptnumber WHERE T3.customerid  =  12
SELECT date FROM receipts ORDER BY date DESC LIMIT 1
SELECT receiptnumber,  date FROM receipts ORDER BY date DESC LIMIT 1
SELECT T3.receiptnumber FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id JOIN receipts AS T3 ON T1.receipt  =  T3.receiptnumber WHERE T2.price  >  10 OR T3.date  =  (SELECT min(date) FROM receipts)
SELECT T3.receiptnumber FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id JOIN receipts AS T3 ON T1.receipt  =  T3.receiptnumber WHERE T2.price  >  10 UNION SELECT T3.receiptnumber FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id JOIN receipts AS T3 ON T1.receipt  =  T3.receiptnumber ORDER BY T3.date LIMIT 1
SELECT id FROM goods WHERE food  =  "Cookie" AND price BETWEEN 3 AND 7 UNION SELECT id FROM goods WHERE food  =  "Cake" AND price BETWEEN 3 AND 7
SELECT id FROM goods WHERE food  =  "Cookie" OR food  =  "Cake" AND price BETWEEN 3 AND 7
SELECT T1.firstname,  T1.lastname FROM customers AS T1 JOIN receipts AS T2 ON T1.id  =  T2.customerid ORDER BY T2.date LIMIT 1
SELECT T1.firstname,  T1.lastname FROM customers AS T1 JOIN receipts AS T2 ON T1.id  =  T2.customerid ORDER BY T2.date LIMIT 1
SELECT avg(price) FROM goods WHERE flavor  =  "Blackberry" OR flavor  =  "Blueberry"
SELECT avg(price) FROM goods WHERE flavor  =  "Blackberry" OR flavor  =  "Blueberry"
SELECT min(Price) FROM goods WHERE Flavor  =  "Cheese"
SELECT id FROM goods WHERE flavor  =  "Cheese" ORDER BY price LIMIT 1
SELECT max(price),  min(price),  avg(price),  flavor FROM goods GROUP BY flavor ORDER BY flavor
SELECT max(price),  min(price),  avg(price),  flavor FROM goods GROUP BY flavor ORDER BY flavor
SELECT min(price),  max(price),  food FROM goods GROUP BY food ORDER BY food
SELECT min(price),  max(price) FROM goods WHERE food  =  "Cake" ORDER BY food
SELECT date FROM receipts GROUP BY date ORDER BY count(*) DESC LIMIT 3
SELECT date FROM receipts GROUP BY date ORDER BY count(*) DESC LIMIT 3
SELECT customerId,  count(*) FROM receipts GROUP BY customerId ORDER BY count(*) DESC LIMIT 1
SELECT customerId,  count(*) FROM receipts GROUP BY customerId ORDER BY count(*) DESC LIMIT 1
SELECT date,  count(DISTINCT customerid) FROM receipts GROUP BY date
SELECT date,  count(*) FROM receipts GROUP BY date
SELECT T4.firstname,  T4.lastname FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T3.receiptnumber  =  T2.receipt JOIN customers AS T4 ON T3.customerid  =  T4.id WHERE T1.flavor  =  "Apple" AND T1.food  =  "Tart"
SELECT T4.firstname,  T4.lastname FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T3.receiptnumber  =  T2.receipt JOIN customers AS T4 ON T3.customerid  =  T4.id WHERE T1.flavor  =  "Apple" AND T1.food  =  "Tart"
SELECT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE food  =  "Croissant")
SELECT id FROM goods WHERE price  <  (SELECT min(price) FROM goods WHERE food  =  "Croissant")
SELECT id FROM goods WHERE food  =  "Cake" AND price  >=  (SELECT avg(price) FROM goods WHERE food  =  "Tart")
SELECT id FROM goods WHERE price  >=  (SELECT avg(price) FROM goods WHERE food  =  "Tart")
SELECT id FROM goods WHERE price  >  (SELECT avg(price) FROM goods) * 2
SELECT id FROM goods WHERE price  >  (SELECT avg(price) FROM goods) * 2
SELECT id,  flavor,  food FROM goods ORDER BY price
SELECT id,  flavor,  food FROM goods ORDER BY price
SELECT id,  flavor FROM goods WHERE food  =  "Cake" ORDER BY flavor
SELECT id,  flavor FROM goods WHERE food  =  "Cake" ORDER BY flavor
SELECT T1.item FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.flavor  =  "Chocolate" EXCEPT SELECT T1.item FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id GROUP BY T1.item HAVING count(*)  >  10
SELECT T1.item FROM items AS T1 JOIN goods AS T2 ON T1.item  =  T2.id WHERE T2.flavor  =  "Chocolate" GROUP BY T1.item HAVING count(*)  <=  10
SELECT Flavor FROM goods WHERE Food  =  "Cake" EXCEPT SELECT Flavor FROM goods WHERE Food  =  "Tart"
SELECT Flavor FROM goods WHERE Food  =  "Cake" EXCEPT SELECT Flavor FROM goods WHERE Food  =  "Tart"
SELECT item FROM items GROUP BY item ORDER BY count(*) DESC LIMIT 3
SELECT item FROM items GROUP BY item ORDER BY count(*) DESC LIMIT 3
SELECT T3.customerid FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T3.receiptnumber  =  T2.receipt GROUP BY T3.customerid HAVING sum(T1.price)  >  150
SELECT T3.customerid FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T3.receiptnumber  =  T2.receipt WHERE T1.price  >  150 GROUP BY T3.customerid HAVING sum(T1.price)  >  150
SELECT T3.customerid FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T3.receiptnumber  =  T2.receipt GROUP BY T3.customerid HAVING avg(T1.price)  >  5
SELECT T3.customerid FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T3.receiptnumber  =  T2.receipt WHERE T1.price  >  5 GROUP BY T3.customerid HAVING avg(T1.price)  >  5
SELECT T3.date FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T3.receiptnumber  =  T2.receipt WHERE T1.price  >  100 GROUP BY T3.date HAVING sum(T1.price)  >  100
SELECT T3.date FROM goods AS T1 JOIN items AS T2 ON T1.id  =  T2.item JOIN receipts AS T3 ON T3.receiptnumber  =  T2.receipt WHERE T1.price  >  100 GROUP BY T3.date HAVING sum(T1.price)  >  100
SELECT count(*) FROM driver
SELECT count(*) FROM driver
SELECT count(*),  Make FROM driver WHERE Points  >  150 GROUP BY Make
SELECT Make,  COUNT(*) FROM driver WHERE Points  >  150 GROUP BY Make
SELECT avg(age),  make FROM driver GROUP BY make
SELECT avg(age),  make FROM driver GROUP BY make
SELECT avg(Laps) FROM driver WHERE Age  <  20
SELECT avg(Laps) FROM driver WHERE Age  <  20
SELECT Manager,  Sponsor FROM team ORDER BY Car_Owner
SELECT manager,  sponsor FROM team ORDER BY car_owner
SELECT Make FROM team GROUP BY Make HAVING COUNT(*)  >  1
SELECT Make FROM team GROUP BY Make HAVING COUNT(*)  >  1
SELECT Make FROM team WHERE Car_Owner  =  "Buddy Arrington"
SELECT Make FROM team WHERE Car_Owner  =  "Buddy Arrington"
SELECT max(Points),  min(Points) FROM driver
SELECT max(Points),  min(Points) FROM driver
SELECT count(*) FROM driver WHERE Points  <  150
SELECT count(*) FROM driver WHERE Points  <  150
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT T2.Driver,  T1.Country FROM country AS T1 JOIN driver AS T2 ON T1.Country_Id  =  T2.Country
SELECT T2.Driver,  T1.Country FROM country AS T1 JOIN driver AS T2 ON T1.Country_Id  =  T2.Country
SELECT max(T2.Points) FROM country AS T1 JOIN driver AS T2 ON T1.Country_id  =  T2.Country WHERE T1.Capital  =  "Dublin"
SELECT max(T2.Points) FROM country AS T1 JOIN driver AS T2 ON T1.Country_id  =  T2.Country WHERE T1.Capital  =  "Dublin"
SELECT avg(T2.Age) FROM country AS T1 JOIN driver AS T2 ON T1.Country_id  =  T2.Country WHERE T1.Official_native_language  =  "English"
SELECT avg(T2.Age) FROM country AS T1 JOIN driver AS T2 ON T1.Country_id  =  T2.Country WHERE T1.Official_native_language  =  "English"
SELECT T1.Country FROM country AS T1 JOIN driver AS T2 ON T1.Country_Id  =  T2.Country WHERE T2.Points  >  150
SELECT T1.Country FROM country AS T1 JOIN driver AS T2 ON T1.Country_Id  =  T2.Country WHERE T2.Points  >  150
SELECT T1.Capital FROM country AS T1 JOIN driver AS T2 ON T1.Country_id  =  T2.Country ORDER BY T2.Points DESC LIMIT 1
SELECT T1.Capital FROM country AS T1 JOIN driver AS T2 ON T1.Country_id  =  T2.Country ORDER BY T2.Points DESC LIMIT 1
SELECT Make,  COUNT(*) FROM driver GROUP BY Make
SELECT Make,  COUNT(*) FROM driver GROUP BY Make
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*)  >=  3
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*)  >=  3
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT team FROM team WHERE team_id NOT IN (SELECT team_id FROM team_driver)
SELECT T2.Country FROM driver AS T1 JOIN country AS T2 ON T1.Country  =  T2.Country_Id WHERE T1.Make  =  "Dodge" INTERSECT SELECT T2.Country FROM driver AS T1 JOIN country AS T2 ON T1.Country  =  T2.Country_Id WHERE T1.Make  =  "Chevrolet"
SELECT T2.Country FROM driver AS T1 JOIN country AS T2 ON T1.Country  =  T2.Country_Id WHERE T1.Make  =  "Dodge" INTERSECT SELECT T2.Country FROM driver AS T1 JOIN country AS T2 ON T1.Country  =  T2.Country_Id WHERE T1.Make  =  "Chevrolet"
SELECT sum(Points),  avg(Points) FROM driver
SELECT sum(Points),  avg(Points) FROM driver
SELECT Country FROM country WHERE Country_Id NOT IN (SELECT Country FROM driver)
SELECT Country FROM country WHERE Country_Id NOT IN (SELECT Country FROM driver)
SELECT T1.manager,  T1.sponsor FROM team AS T1 JOIN team_driver AS T2 ON T1.team_id  =  T2.team_id GROUP BY T1.team_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.manager,  T1.sponsor FROM team AS T1 JOIN team_driver AS T2 ON T1.team_id  =  T2.team_id GROUP BY T1.team_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.manager,  T1.car_owner FROM team AS T1 JOIN team_driver AS T2 ON T1.team_id  =  T2.team_id GROUP BY T1.team_id HAVING count(*)  >=  2
SELECT T1.manager,  T1.car_owner FROM team AS T1 JOIN team_driver AS T2 ON T1.team_id  =  T2.team_id GROUP BY T1.team_id HAVING count(*)  >=  2
SELECT count(*) FROM institution
SELECT count(*) FROM institution
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Name ASC
SELECT name FROM institution ORDER BY founded ASC
SELECT name FROM institution ORDER BY founded
SELECT city,  province FROM institution
SELECT city,  province FROM institution
SELECT max(Enrollment),  min(Enrollment) FROM institution
SELECT max(Enrollment),  min(Enrollment) FROM institution
SELECT affiliation FROM institution WHERE city!= "Vancouver"
SELECT affiliation FROM institution WHERE city!= 'Vancouver'
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution ORDER BY Enrollment DESC LIMIT 1
SELECT Stadium FROM institution ORDER BY Enrollment DESC LIMIT 1
SELECT T2.name,  T1.nickname FROM championship AS T1 JOIN institution AS T2 ON T1.institution_id  =  T2.institution_id
SELECT T2.name,  T1.nickname FROM championship AS T1 JOIN institution AS T2 ON T1.institution_id  =  T2.institution_id
SELECT T1.Nickname FROM championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T2.Enrollment LIMIT 1
SELECT T1.Nickname FROM championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T2.Enrollment LIMIT 1
SELECT T2.name FROM championship AS T1 JOIN institution AS T2 ON T1.institution_id  =  T2.institution_id ORDER BY T1.number_of_championships DESC
SELECT T2.name FROM championship AS T1 JOIN institution AS T2 ON T1.institution_id  =  T2.institution_id ORDER BY T1.number_of_championships DESC
SELECT T2.name FROM championship AS T1 JOIN institution AS T2 ON T1.institution_id  =  T2.institution_id GROUP BY T1.institution_id HAVING count(*)  >=  1
SELECT T2.name FROM championship AS T1 JOIN institution AS T2 ON T1.institution_id  =  T2.institution_id GROUP BY T1.institution_id HAVING count(*)  >=  1
SELECT sum(T1.Number_of_Championships) FROM championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID WHERE T2.Affiliation  =  'Public'
SELECT sum(T1.Number_of_Championships) FROM championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID WHERE T2.Affiliation  =  'Public'
SELECT affiliation,  count(*) FROM institution GROUP BY affiliation
SELECT affiliation,  count(*) FROM institution GROUP BY affiliation
SELECT affiliation FROM institution GROUP BY affiliation ORDER BY count(*) DESC LIMIT 1
SELECT affiliation FROM institution GROUP BY affiliation ORDER BY count(*) DESC LIMIT 1
SELECT founded FROM institution GROUP BY founded HAVING count(*)  >  1
SELECT founded,  count(*) FROM institution GROUP BY founded HAVING count(*)  >  1
SELECT T1.Nickname FROM championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T2.Capacity DESC
SELECT T1.Nickname FROM championship AS T1 JOIN institution AS T2 ON T1.Institution_ID  =  T2.Institution_ID ORDER BY T2.Capacity DESC
SELECT sum(enrollment) FROM institution WHERE city  =  "Vancouver" OR city  =  "Calgary"
SELECT Enrollment FROM institution WHERE City  =  'Vancouver' OR City  =  'Calgary'
SELECT Province FROM institution WHERE Founded  <  1920 INTERSECT SELECT Province FROM institution WHERE Founded  >  1950
SELECT Province FROM institution WHERE Founded  <  1920 INTERSECT SELECT Province FROM institution WHERE Founded  >  1950
SELECT count(DISTINCT Province) FROM institution
SELECT count(DISTINCT Province) FROM institution
SELECT * FROM warehouses
SELECT * FROM warehouses
SELECT DISTINCT T1.Contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.Warehouse  =  T2.Code WHERE T2.Location  =  "New York"
SELECT DISTINCT T1.Contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.Warehouse  =  T2.Code WHERE T2.Location  =  "New York"
SELECT contents FROM boxes WHERE value  >  150
SELECT Contents FROM boxes WHERE Value  >  150
SELECT warehouse,  avg(value) FROM boxes GROUP BY warehouse
SELECT avg(value),  warehouse FROM boxes GROUP BY warehouse
SELECT avg(value),  sum(value) FROM boxes
SELECT avg(value),  sum(value) FROM boxes
SELECT avg(capacity),  sum(capacity) FROM warehouses
SELECT avg(capacity),  sum(capacity) FROM warehouses
SELECT avg(value),  max(value),  contents FROM boxes GROUP BY contents
SELECT avg(value),  max(value),  contents FROM boxes GROUP BY contents
SELECT contents FROM boxes GROUP BY contents ORDER BY sum(value) DESC LIMIT 1
SELECT Contents FROM boxes ORDER BY Value DESC LIMIT 1
SELECT avg(value) FROM boxes
SELECT avg(value) FROM boxes
SELECT DISTINCT Contents FROM boxes
SELECT DISTINCT Contents FROM boxes
SELECT count(DISTINCT contents) FROM boxes
SELECT count(DISTINCT contents) FROM boxes
SELECT DISTINCT LOCATION FROM warehouses
SELECT DISTINCT LOCATION FROM warehouses
SELECT T1.code FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'
SELECT T1.code FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'
SELECT sum(T1.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'
SELECT sum(T1.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' OR T2.location  =  'New York'
SELECT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' INTERSECT SELECT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'New York'
SELECT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'Chicago' INTERSECT SELECT T1.contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  'New York'
SELECT Contents FROM boxes WHERE Code NOT IN (SELECT T1.Code FROM boxes AS T1 JOIN warehouses AS T2 ON T1.Warehouse  =  T2.Code WHERE T2.Location  =  "New York")
SELECT Contents FROM boxes EXCEPT SELECT T1.Contents FROM boxes AS T1 JOIN warehouses AS T2 ON T1.Warehouse  =  T2.Code WHERE T2.Location  =  'New York'
SELECT T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T1.contents  =  "Rocks" EXCEPT SELECT T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T1.contents  =  "Scissors"
SELECT T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T1.contents  =  "Rocks" EXCEPT SELECT T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T1.contents  =  "Scissors"
SELECT DISTINCT warehouse FROM boxes WHERE contents  =  "Rocks" OR contents  =  "Scissors"
SELECT DISTINCT warehouse FROM boxes WHERE contents  =  "Rocks" OR contents  =  "Scissors"
SELECT T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T1.contents  =  "Rocks" INTERSECT SELECT T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T1.contents  =  "Scissors"
SELECT T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T1.contents  =  "Rocks" INTERSECT SELECT T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T1.contents  =  "Scissors"
SELECT code,  contents FROM boxes ORDER BY value
SELECT code,  contents FROM boxes ORDER BY value
SELECT code,  contents FROM boxes ORDER BY value LIMIT 1
SELECT code,  contents FROM boxes ORDER BY value LIMIT 1
SELECT DISTINCT Contents FROM boxes WHERE Value  >  (SELECT avg(Value) FROM boxes)
SELECT DISTINCT contents FROM boxes WHERE value  >  (SELECT avg(value) FROM boxes)
SELECT DISTINCT contents FROM boxes ORDER BY contents
SELECT DISTINCT Contents FROM boxes ORDER BY Contents ASC
SELECT code FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  "Rocks")
SELECT code FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  "Rocks")
SELECT code,  contents FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  "Scissors")
SELECT code,  contents FROM boxes WHERE value  >  (SELECT max(value) FROM boxes WHERE contents  =  "Scissors")
SELECT sum(T1.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.capacity  =  (SELECT max(capacity) FROM warehouses)
SELECT sum(T1.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code ORDER BY T2.capacity DESC LIMIT 1
SELECT warehouse,  avg(value) FROM boxes GROUP BY warehouse HAVING avg(value)  >  150
SELECT avg(value),  warehouse FROM boxes GROUP BY warehouse HAVING avg(value)  >  150
SELECT sum(value),  count(*),  contents FROM boxes GROUP BY contents
SELECT sum(value),  count(*),  contents FROM boxes GROUP BY contents
SELECT sum(capacity),  avg(capacity),  max(capacity),  location FROM warehouses GROUP BY location
SELECT location,  sum(capacity),  avg(capacity),  max(capacity) FROM warehouses GROUP BY location
SELECT sum(capacity),  LOCATION FROM warehouses GROUP BY LOCATION
SELECT sum(capacity) FROM warehouses
SELECT max(T1.value),  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code GROUP BY T2.location
SELECT T2.location,  max(T1.value) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code GROUP BY T2.location
SELECT warehouse,  count(*) FROM boxes GROUP BY warehouse
SELECT count(*),  warehouse FROM boxes GROUP BY warehouse
SELECT count(DISTINCT T2.location) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T1.contents  =  "Rocks"
SELECT count(DISTINCT T2.location) FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T1.contents  =  "Rocks"
SELECT T1.code,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code
SELECT T1.code,  T2.location FROM boxes AS T1 JOIN warehouses AS T2 ON T1.warehouse  =  T2.code
SELECT T1.code FROM boxes AS T1 JOIN Warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  "Chicago"
SELECT T1.code FROM boxes AS T1 JOIN Warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location  =  "Chicago"
SELECT count(*),  warehouse FROM boxes GROUP BY warehouse
SELECT count(*),  warehouse FROM boxes GROUP BY warehouse
SELECT count(DISTINCT contents),  warehouse FROM boxes GROUP BY warehouse
SELECT count(DISTINCT contents),  warehouse FROM boxes GROUP BY warehouse
SELECT T1.code FROM boxes AS T1 JOIN Warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.capacity  >  (SELECT sum(value) FROM boxes AS T1 JOIN Warehouses AS T2 ON T1.warehouse  =  T2.code)
SELECT T2.code FROM boxes AS T1 JOIN Warehouses AS T2 ON T1.warehouse  =  T2.code GROUP BY T1.warehouse HAVING count(*)  >  T2.capacity
SELECT sum(value) FROM boxes WHERE warehouse NOT IN (SELECT code FROM Warehouses WHERE LOCATION  =  "Chicago")
SELECT sum(T1.value) FROM boxes AS T1 JOIN Warehouses AS T2 ON T1.warehouse  =  T2.code WHERE T2.location!= "Chicago"
SELECT University_Name,  City,  State FROM University ORDER BY University_Name
SELECT University_Name,  City,  State FROM University ORDER BY University_Name
SELECT count(*) FROM University WHERE State  =  'Illinois' OR State  =  'Ohio'
SELECT count(*) FROM University WHERE State  =  'Illinois' OR State  =  'Ohio'
SELECT max(Enrollment),  avg(Enrollment),  min(Enrollment) FROM University
SELECT max(Enrollment),  avg(Enrollment),  min(Enrollment) FROM University
SELECT Team_Name FROM University WHERE Enrollment  >  (SELECT avg(Enrollment) FROM University)
SELECT Team_Name FROM university WHERE Enrollment  >  (SELECT avg(Enrollment) FROM university)
SELECT DISTINCT Home_Conference FROM University
SELECT DISTINCT Home_Conference FROM University
SELECT Home_Conference,  COUNT(*) FROM University GROUP BY Home_Conference
SELECT Home_Conference,  COUNT(*) FROM University GROUP BY Home_Conference
SELECT State FROM University GROUP BY State ORDER BY COUNT(*) DESC LIMIT 1
SELECT State FROM University GROUP BY State ORDER BY COUNT(*) DESC LIMIT 1
SELECT Home_Conference FROM University WHERE Enrollment  >  2000 GROUP BY Home_Conference HAVING avg(Enrollment)  >  2000
SELECT Home_Conference FROM University GROUP BY Home_Conference HAVING avg(Enrollment)  >  2000
SELECT Home_Conference FROM University GROUP BY Home_Conference ORDER BY sum(Enrollment) LIMIT 1
SELECT Home_Conference FROM University GROUP BY Home_Conference ORDER BY sum(Enrollment) LIMIT 1
SELECT major_name,  major_code FROM Major ORDER BY major_code
SELECT Major_Name,  Major_Code FROM Major ORDER BY Major_Code
SELECT T3.Major_Name,  T1.Rank FROM Major_Ranking AS T1 JOIN University AS T2 ON T1.University_ID  =  T2.University_ID JOIN Major AS T3 ON T1.Major_ID  =  T3.Major_ID WHERE T2.University_Name  =  "Augustana College"
SELECT T1.Rank,  T3.Major_Name FROM Major_Ranking AS T1 JOIN University AS T2 ON T1.University_ID  =  T2.University_ID JOIN Major AS T3 ON T1.Major_ID  =  T3.Major_ID WHERE T2.University_Name  =  "Augustana College"
SELECT T2.university_name,  T2.city,  T2.state FROM Major_Ranking AS T1 JOIN University AS T2 ON T1.university_id  =  T2.university_id JOIN Major AS T3 ON T1.major_id  =  T3.major_id WHERE T1.rank  =  1 AND T3.major_name  =  "Accounting"
SELECT T2.University_Name,  T2.City,  T2.State FROM Major_Ranking AS T1 JOIN University AS T2 ON T1.University_ID  =  T2.University_ID JOIN Major AS T3 ON T1.Major_ID  =  T3.Major_ID WHERE T1.Rank  =  1 AND T3.Major_Name  =  "Accounting"
SELECT T2.University_Name FROM Major_Ranking AS T1 JOIN University AS T2 ON T1.University_ID  =  T2.University_ID WHERE T1.Rank  =  1 GROUP BY T1.University_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.University_Name FROM Major_Ranking AS T1 JOIN University AS T2 ON T1.University_ID  =  T2.University_ID WHERE T1.Rank  =  1 GROUP BY T1.University_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT University_Name FROM University WHERE University_ID NOT IN (SELECT University_ID FROM Major_Ranking WHERE Rank  =  1)
SELECT University_Name FROM University WHERE University_ID NOT IN (SELECT University_ID FROM Major_Ranking WHERE Rank  =  1)
SELECT T2.University_Name FROM Major_Ranking AS T1 JOIN University AS T2 ON T1.University_ID  =  T2.University_ID JOIN Major AS T3 ON T1.Major_ID  =  T3.Major_ID WHERE T3.Major_Name  =  "Accounting" INTERSECT SELECT T2.University_Name FROM Major_Ranking AS T1 JOIN University AS T2 ON T1.University_ID  =  T2.University_ID JOIN Major AS T3 ON T1.Major_ID  =  T3.Major_ID WHERE T3.Major_Name  =  "Urban Education"
SELECT T2.University_Name FROM Major_Ranking AS T1 JOIN University AS T2 ON T1.University_ID  =  T2.University_ID JOIN Major AS T3 ON T1.Major_ID  =  T3.Major_ID WHERE T3.Major_Name  =  "Accounting" INTERSECT SELECT T2.University_Name FROM Major_Ranking AS T1 JOIN University AS T2 ON T1.University_ID  =  T2.University_ID JOIN Major AS T3 ON T1.Major_ID  =  T3.Major_ID WHERE T3.Major_Name  =  "Urban Education"
SELECT T1.University_Name,  T2.Rank FROM University AS T1 JOIN Overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T1.State  =  "Wisconsin"
SELECT T1.University_Name,  T2.Rank FROM University AS T1 JOIN Overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T1.State  =  "Wisconsin"
SELECT T1.University_Name FROM University AS T1 JOIN Overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Research_point DESC LIMIT 1
SELECT T1.University_Name FROM University AS T1 JOIN Overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Research_point DESC LIMIT 1
SELECT T1.University_Name FROM University AS T1 JOIN Overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Reputation_point ASC
SELECT T1.University_Name FROM University AS T1 JOIN Overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Reputation_point ASC
SELECT T2.University_Name FROM Major_Ranking AS T1 JOIN University AS T2 ON T1.University_ID  =  T2.University_ID JOIN Major AS T3 ON T1.Major_ID  =  T3.Major_ID WHERE T3.Major_Name  =  "Accounting" AND T1.Rank  >=  3
SELECT T2.University_Name FROM Major_Ranking AS T1 JOIN University AS T2 ON T1.University_ID  =  T2.University_ID JOIN Major AS T3 ON T1.Major_ID  =  T3.Major_ID WHERE T3.Major_Name  =  "Accounting" AND T1.Rank  >=  3
SELECT sum(T1.Enrollment) FROM University AS T1 JOIN Overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T2.Rank  <=  5
SELECT sum(T1.Enrollment) FROM University AS T1 JOIN Overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T2.Rank  <=  5
SELECT T1.University_Name,  T2.Citation_point FROM University AS T1 JOIN Overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID WHERE T2.Reputation_point  >=  3
SELECT T1.University_Name,  T2.Citation_point FROM University AS T1 JOIN Overall_ranking AS T2 ON T1.University_ID  =  T2.University_ID ORDER BY T2.Reputation_point DESC LIMIT 3
SELECT state FROM university WHERE enrollment  <  3000 GROUP BY state HAVING count(*)  >  2
SELECT state FROM university WHERE enrollment  <  3000 GROUP BY state HAVING count(*)  >  2
SELECT title FROM movies WHERE rating  =  "null"
SELECT title FROM movies WHERE rating  =  "null"
SELECT title FROM movies WHERE rating  =  'G'
SELECT title FROM movies WHERE rating  =  'G'
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon'
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon'
SELECT T1.title,  T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie
SELECT T1.title,  T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie
SELECT count(*) FROM movies WHERE rating  =  'G'
SELECT count(*) FROM movies WHERE rating  =  'G'
SELECT count(*) FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie
SELECT count(*) FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Majestic'
SELECT count(DISTINCT T1.title) FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie
SELECT count(DISTINCT title) FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Majestic'
SELECT count(*) FROM movietheaters
SELECT count(*) FROM movietheaters
SELECT rating FROM movies WHERE title LIKE '%Citizen%'
SELECT rating FROM movies WHERE title LIKE '%Citizen%'
SELECT title FROM movies WHERE rating  =  'G' OR rating  =  'PG'
SELECT title FROM movies WHERE rating  =  'G' OR rating  =  'PG'
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon' OR T2.name  =  'Imperial'
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon' OR T2.name  =  'Imperial'
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon' INTERSECT SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Imperial'
SELECT title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Odeon' INTERSECT SELECT title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T2.name  =  'Imperial'
SELECT title FROM movies WHERE code NOT IN (SELECT movie FROM movietheaters WHERE name  =  'Odeon')
SELECT title FROM movies WHERE code NOT IN (SELECT movie FROM movietheaters WHERE name  =  'Odeon')
SELECT title FROM movies ORDER BY title
SELECT title FROM movies ORDER BY title
SELECT title FROM movies ORDER BY rating
SELECT title FROM movies ORDER BY rating
SELECT name FROM movietheaters GROUP BY name ORDER BY count(*) DESC LIMIT 1
SELECT name FROM movietheaters GROUP BY name ORDER BY count(*) DESC LIMIT 1
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie GROUP BY T1.title ORDER BY count(*) DESC LIMIT 1
SELECT T1.title FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie GROUP BY T1.title ORDER BY count(*) DESC LIMIT 1
SELECT rating,  count(*) FROM movies GROUP BY rating
SELECT rating,  count(*) FROM movies GROUP BY rating
SELECT count(*) FROM movies WHERE rating!= "null"
SELECT count(*) FROM movies WHERE rating!= "null"
SELECT name FROM movietheaters WHERE movie!= "None"
SELECT name FROM movietheaters WHERE movie!= "None"
SELECT name FROM MovieTheaters WHERE movie  =  'None'
SELECT name FROM MovieTheaters WHERE movie  =  'None'
SELECT T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T1.rating  =  'G'
SELECT T2.name FROM movies AS T1 JOIN movietheaters AS T2 ON T1.code  =  T2.movie WHERE T1.rating  =  'G'
SELECT title FROM movies
SELECT title FROM movies
SELECT DISTINCT rating FROM movies
SELECT DISTINCT rating FROM movies
SELECT * FROM movies WHERE rating  =  "Unrated"
SELECT * FROM movies WHERE rating  =  "Unrated"
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters)
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters)
SELECT T2.Name FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Recipient  =  T2.AccountNumber ORDER BY T1.Weight DESC LIMIT 1
SELECT T2.Name FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Recipient  =  T2.AccountNumber ORDER BY T1.Weight DESC LIMIT 1
SELECT sum(T1.weight) FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.accountnumber WHERE T2.name  =  "Leo Wong"
SELECT sum(T1.weight) FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.accountnumber WHERE T2.name  =  "Leo Wong"
SELECT POSITION FROM Employee WHERE Name  =  "Amy Wong"
SELECT POSITION FROM Employee WHERE Name  =  "Amy Wong"
SELECT Salary,  POSITION FROM Employee WHERE Name  =  "Turanga Leela"
SELECT Salary,  POSITION FROM Employee WHERE Name  =  "Turanga Leela"
SELECT avg(Salary) FROM Employee WHERE POSITION  =  'Intern'
SELECT avg(Salary) FROM Employee WHERE POSITION  =  'Intern'
SELECT T1.Level FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee  =  T2.EmployeeID WHERE T2.Position  =  "Physician"
SELECT T1.Level FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee  =  T2.EmployeeID WHERE T2.Position  =  'Physician'
SELECT T1.PackageNumber FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT count(*) FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT T1.packageNumber FROM package AS T1 JOIN client AS T2 ON T1.recipient  =  T2.accountnumber WHERE T2.name  =  "Leo Wong"
SELECT T1.PackageNumber FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Recipient  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT T1.PackageNumber FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber OR T1.Recipient  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT DISTINCT T1.PackageNumber FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber OR T1.Recipient  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT count(*) FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "Ogden Wernstrom" INTERSECT SELECT count(*) FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Recipient  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT count(*) FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "Ogden Wernstrom" INTERSECT SELECT count(*) FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Recipient  =  T2.AccountNumber WHERE T2.Name  =  "Leo Wong"
SELECT T1.Contents FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "John Zoidfarb"
SELECT T1.Contents FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name  =  "John Zoidfarb"
SELECT T1.PackageNumber,  T1.Weight FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name LIKE '%John%'
SELECT T1.PackageNumber,  T1.Weight FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber WHERE T2.Name LIKE "%John%"
SELECT PackageNumber,  Weight FROM PACKAGE ORDER BY Weight LIMIT 3
SELECT PackageNumber,  Weight FROM PACKAGE ORDER BY Weight ASC LIMIT 3
SELECT T2.name,  count(*) FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.accountnumber GROUP BY T1.Sender ORDER BY count(*) DESC LIMIT 1
SELECT T2.Name,  COUNT(*) FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber GROUP BY T1.Sender ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.name,  count(*) FROM package AS T1 JOIN client AS T2 ON T1.recipient  =  T2.accountnumber GROUP BY T1.recipient ORDER BY count(*) LIMIT 1
SELECT T1.Recipient,  min(T1.PackageNumber) FROM package AS T1 JOIN client AS T2 ON T1.Recipient  =  T2.AccountNumber GROUP BY T1.Recipient
SELECT T2.Name FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber GROUP BY T1.Sender HAVING COUNT(*)  >  1
SELECT T2.Name FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber GROUP BY T1.Sender HAVING COUNT(*)  >  1
SELECT Coordinates FROM Planet WHERE Name  =  "Mars"
SELECT Coordinates FROM Planet WHERE Name  =  "Mars"
SELECT Name,  Coordinates FROM Planet ORDER BY Name ASC
SELECT Name,  Coordinates FROM Planet ORDER BY Name
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Employee AS T2 ON T1.Manager  =  T2.EmployeeID WHERE T2.Name  =  "Phillip J. Fry"
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Employee AS T2 ON T1.Manager  =  T2.EmployeeID WHERE T2.Name  =  "Phillip J. Fry"
SELECT Date FROM Shipment
SELECT Date FROM Shipment
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID WHERE T2.Name  =  "Mars"
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID WHERE T2.Name  =  "Mars"
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID JOIN Employee AS T3 ON T1.Manager  =  T3.EmployeeID WHERE T2.Name  =  "Mars" AND T3.Name  =  "Turanga Leela"
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID JOIN Employee AS T3 ON T1.Manager  =  T3.EmployeeID WHERE T2.Name  =  "Mars" AND T3.Name  =  "Turanga Leela"
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID JOIN Employee AS T3 ON T1.Manager  =  T3.EmployeeID WHERE T2.Name  =  "Mars" OR T3.Name  =  "Turanga Leela"
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID JOIN Employee AS T3 ON T1.Manager  =  T3.EmployeeID WHERE T2.Name  =  "Mars" AND T3.Name  =  "Turanga Leela"
SELECT T2.name,  count(*) FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID GROUP BY T1.Planet
SELECT T2.Name,  COUNT(*) FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID GROUP BY T1.Planet
SELECT T2.Name FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID GROUP BY T1.Planet ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Name FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID GROUP BY T1.Planet ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Name,  COUNT(*) FROM Shipment AS T1 JOIN Employee AS T2 ON T1.Manager  =  T2.EmployeeID GROUP BY T1.Manager
SELECT count(*),  T2.name FROM Shipment AS T1 JOIN Employee AS T2 ON T1.Manager  =  T2.EmployeeID GROUP BY T2.name
SELECT sum(T1.Weight) FROM PACKAGE AS T1 JOIN Shipment AS T2 ON T1.Shipment  =  T2.ShipmentID JOIN Planet AS T3 ON T2.Planet  =  T3.PlanetID WHERE T3.Name  =  "Mars"
SELECT sum(T1.Weight) FROM PACKAGE AS T1 JOIN Shipment AS T2 ON T1.Shipment  =  T2.ShipmentID JOIN Planet AS T3 ON T2.Planet  =  T3.PlanetID WHERE T3.Name  =  "Mars"
SELECT T3.name,  sum(T1.weight) FROM package AS T1 JOIN shipment AS T2 ON T1.shipment  =  T2.shipmentid JOIN planet AS T3 ON T2.planet  =  T3.planetid GROUP BY T3.planetid
SELECT sum(T1.weight),  T3.name FROM package AS T1 JOIN shipment AS T2 ON T1.shipment  =  T2.shipmentid JOIN planet AS T3 ON T2.planet  =  T3.planetid GROUP BY T3.name
SELECT T3.Name FROM PACKAGE AS T1 JOIN Shipment AS T2 ON T1.Shipment  =  T2.ShipmentID JOIN Planet AS T3 ON T2.Planet  =  T3.PlanetID GROUP BY T3.PlanetID HAVING sum(T1.Weight)  >  30
SELECT T3.Name FROM PACKAGE AS T1 JOIN Shipment AS T2 ON T1.Shipment  =  T2.ShipmentID JOIN Planet AS T3 ON T2.Planet  =  T3.PlanetID GROUP BY T3.PlanetID HAVING sum(T1.Weight)  >  30
SELECT T1.PackageNumber FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber JOIN Shipment AS T3 ON T1.Shipment  =  T3.ShipmentID JOIN Planet AS T4 ON T3.Planet  =  T4.PlanetID WHERE T4.Name  =  "Omicron Persei 8" AND T2.Name  =  "Zapp Brannigan"
SELECT count(*) FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber JOIN Shipment AS T3 ON T1.Shipment  =  T3.ShipmentID JOIN Planet AS T4 ON T3.Planet  =  T4.PlanetID WHERE T2.Name  =  "Zapp Brannigan" AND T4.Name  =  "Omicron Persei 8"
SELECT T1.PackageNumber FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber JOIN Shipment AS T3 ON T1.Shipment  =  T3.ShipmentID JOIN Planet AS T4 ON T3.Planet  =  T4.PlanetID WHERE T4.Name  =  "Omicron Persei 8" UNION SELECT T1.PackageNumber FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber JOIN Shipment AS T3 ON T1.Shipment  =  T3.ShipmentID JOIN Planet AS T4 ON T3.Planet  =  T4.PlanetID WHERE T2.Name  =  "Zapp Brannigan"
SELECT count(*) FROM PACKAGE AS T1 JOIN Client AS T2 ON T1.Sender  =  T2.AccountNumber JOIN Shipment AS T3 ON T1.Shipment  =  T3.ShipmentID JOIN Planet AS T4 ON T3.Planet  =  T4.PlanetID WHERE T4.Name  =  "Omicron Persei 8" OR T2.Name  =  "Zapp Brannigan"
SELECT PackageNumber,  Weight FROM PACKAGE WHERE Weight BETWEEN 10 AND 30
SELECT PackageNumber,  Weight FROM PACKAGE WHERE Weight BETWEEN 10 AND 30
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID WHERE T2.Name  =  "Mars")
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance AS T1 JOIN Planet AS T2 ON T1.Planet  =  T2.PlanetID WHERE T2.Name  =  "Mars")
SELECT T2.Name FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee  =  T2.EmployeeID JOIN Planet AS T3 ON T1.Planet  =  T3.PlanetID WHERE T3.Name  =  "Omega III"
SELECT T2.Name FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee  =  T2.EmployeeID JOIN Planet AS T3 ON T1.Planet  =  T3.PlanetID WHERE T3.Name  =  "Omega III"
SELECT T3.Name FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee  =  T2.EmployeeID JOIN Planet AS T3 ON T1.Planet  =  T3.PlanetID GROUP BY T3.Name HAVING COUNT(*)  =  1
SELECT T3.Name FROM Has_Clearance AS T1 JOIN Employee AS T2 ON T1.Employee  =  T2.EmployeeID JOIN Planet AS T3 ON T1.Planet  =  T3.PlanetID GROUP BY T3.Name HAVING COUNT(*)  =  1
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT name FROM Employee WHERE salary  >  (SELECT avg(salary) FROM employee) OR salary  >  5000
SELECT name FROM Employee WHERE salary  >  (SELECT avg(salary) FROM employee) OR salary  >  5000
SELECT count(*) FROM employee WHERE employeeid NOT IN (SELECT employee FROM has_clearance AS T1 JOIN planet AS T2 ON T1.planet  =  T2.planetid WHERE T2.name  =  "Mars")
SELECT count(*) FROM employee WHERE employeeid NOT IN (SELECT employee FROM has_clearance AS T1 JOIN planet AS T2 ON T1.planet  =  T2.planetid WHERE T2.name  =  "Mars")
SELECT count(*) FROM game
SELECT count(*) FROM game
SELECT Title,  Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT Title,  Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT avg(units_sold_millions) FROM game WHERE Developers!= 'Nintendo'
SELECT avg(units_sold_millions) FROM game WHERE Developers!= 'Nintendo'
SELECT Platform_name,  Market_district FROM platform
SELECT Platform_name,  Market_district FROM platform
SELECT Platform_name,  Platform_ID FROM platform WHERE Download_rank  =  1
SELECT Platform_name,  Platform_ID FROM platform WHERE Download_rank  =  1
SELECT max(rank_of_the_year),  min(rank_of_the_year) FROM player
SELECT max(rank_of_the_year),  min(rank_of_the_year) FROM player
SELECT count(*) FROM player WHERE rank_of_the_year  <  3
SELECT count(*) FROM player WHERE rank_of_the_year  <=  3
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name FROM player ORDER BY Player_name
SELECT Player_name,  College FROM player ORDER BY Rank_of_the_year DESC
SELECT Player_name,  College FROM player ORDER BY Rank_of_the_year DESC
SELECT T3.player_name,  T3.rank_of_the_year FROM game AS T1 JOIN game_player AS T2 ON T1.game_id  =  T2.game_id JOIN player AS T3 ON T2.player_id  =  T3.player_id WHERE T1.title  =  "Super Mario World"
SELECT T3.player_name,  T3.rank_of_the_year FROM game AS T1 JOIN game_player AS T2 ON T1.game_id  =  T2.game_id JOIN player AS T3 ON T2.player_id  =  T3.player_id WHERE T1.title  =  "Super Mario World"
SELECT DISTINCT T1.Developers FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"
SELECT DISTINCT T1.Developers FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Auburn"
SELECT avg(T1.units_sold_millions) FROM game AS T1 JOIN game_player AS T2 ON T1.game_id  =  T2.game_id JOIN player AS T3 ON T2.player_id  =  T3.player_id WHERE T3.position  =  "Guard"
SELECT avg(T1.units_sold_Millions) FROM game AS T1 JOIN game_player AS T2 ON T1.game_id  =  T2.game_id JOIN player AS T3 ON T2.player_id  =  T3.player_id WHERE T3.position  =  "Guard"
SELECT T1.Title,  T2.Platform_name FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID
SELECT T1.Title,  T2.Platform_name FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID
SELECT T1.Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID WHERE T2.Market_district  =  'Asia' OR T2.Market_district  =  'USA'
SELECT T1.Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID  =  T2.Platform_ID WHERE T2.Market_district  =  'Asia' OR T2.Market_district  =  'USA'
SELECT Franchise,  COUNT(*) FROM game GROUP BY Franchise
SELECT count(*),  Franchise FROM game GROUP BY Franchise
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*)  >=  2
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*)  >=  2
SELECT player_name FROM player WHERE player_id NOT IN (SELECT player_id FROM game_player)
SELECT player_name FROM player WHERE player_id NOT IN (SELECT player_id FROM game_player)
SELECT T1.title FROM game AS T1 JOIN game_player AS T2 ON T1.game_id  =  T2.game_id JOIN player AS T3 ON T2.player_id  =  T3.player_id WHERE T3.college  =  "Oklahoma" INTERSECT SELECT T1.title FROM game AS T1 JOIN game_player AS T2 ON T1.game_id  =  T2.game_id JOIN player AS T3 ON T2.player_id  =  T3.player_id WHERE T3.college  =  "Auburn"
SELECT T1.Title FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID  =  T2.Game_ID JOIN player AS T3 ON T2.Player_ID  =  T3.Player_ID WHERE T3.College  =  "Oklahoma" OR T3.College  =  "Auburn"
SELECT DISTINCT Franchise FROM game
SELECT DISTINCT Franchise FROM game
SELECT title FROM game WHERE game_id NOT IN (SELECT game_id FROM game_player AS T1 JOIN player AS T2 ON T1.player_id  =  T2.player_id WHERE T2.position  =  'Guard')
SELECT title FROM game WHERE game_id NOT IN (SELECT game_id FROM game_player AS T1 JOIN player AS T2 ON T1.player_id  =  T2.player_id WHERE POSITION  =  'Guard')
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press WHERE YEAR_Profits_billion  >  15 OR Month_Profits_billion  >  1
SELECT Name FROM press WHERE YEAR_Profits_billion  >  15 OR Month_Profits_billion  >  1
SELECT avg(YEAR_Profits_billion),  max(YEAR_Profits_billion) FROM press
SELECT avg(YEAR_Profits_billion),  max(YEAR_Profits_billion),  name FROM press GROUP BY name
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1
SELECT name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1 UNION SELECT Name FROM press ORDER BY Month_Profits_billion ASC LIMIT 1
SELECT count(*) FROM author WHERE age  <  30
SELECT count(*) FROM author WHERE age  <  30
SELECT avg(age),  gender FROM author GROUP BY gender
SELECT gender,  avg(age) FROM author GROUP BY gender
SELECT count(*),  gender FROM author WHERE age  >  30 GROUP BY gender
SELECT count(*),  gender FROM author WHERE age  >  30 GROUP BY gender
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Book_Series,  COUNT(*) FROM book GROUP BY Book_Series
SELECT Book_Series,  COUNT(*) FROM book GROUP BY Book_Series
SELECT title,  release_date FROM book ORDER BY sale_amount DESC LIMIT 5
SELECT Title,  Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Book_Series FROM book WHERE Sale_Amount  >  1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount  <  500
SELECT Book_Series FROM book WHERE Sale_Amount  >  1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount  <  500
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID WHERE T2.Book_Series  =  "MM" INTERSECT SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID WHERE T2.Book_Series  =  "LT"
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID WHERE T2.Book_Series  =  "MM" INTERSECT SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID WHERE T2.Book_Series  =  "LT"
SELECT name,  age FROM author WHERE author_id NOT IN (SELECT author_id FROM book)
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book)
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.Name HAVING COUNT(*)  >  1
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.Name HAVING COUNT(*)  >  1
SELECT T2.Title,  T1.Name,  T3.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID JOIN press AS T3 ON T2.Press_ID  =  T3.Press_ID ORDER BY T2.Sale_Amount DESC LIMIT 3
SELECT T2.Title,  T1.Name,  T3.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID JOIN press AS T3 ON T2.Press_ID  =  T3.Press_ID ORDER BY T2.Sale_Amount DESC LIMIT 3
SELECT T2.name,  sum(T1.sale_amount) FROM book AS T1 JOIN press AS T2 ON T1.press_id  =  T2.press_id GROUP BY T2.name
SELECT T2.name,  sum(T1.sale_amount) FROM book AS T1 JOIN press AS T2 ON T1.press_id  =  T2.press_id GROUP BY T2.name
SELECT T2.name,  count(*) FROM book AS T1 JOIN press AS T2 ON T1.press_id  =  T2.press_id WHERE T1.sale_amount  >  1000 GROUP BY T2.name
SELECT T2.name,  count(*) FROM book AS T1 JOIN press AS T2 ON T1.press_id  =  T2.press_id WHERE T1.sale_amount  >  1000 GROUP BY T2.name
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID ORDER BY T2.Sale_Amount DESC LIMIT 1
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID ORDER BY T2.Sale_Amount DESC LIMIT 1
SELECT T1.Name,  T1.Gender FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.Author_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name,  T1.Gender FROM author AS T1 JOIN book AS T2 ON T1.Author_ID  =  T2.Author_ID GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM author WHERE author_id NOT IN (SELECT author_id FROM book AS T1 JOIN press AS T2 ON T1.press_id  =  T2.press_id WHERE T2.name  =  "Accor")
SELECT name FROM author WHERE author_id NOT IN (SELECT author_id FROM book AS T1 JOIN press AS T2 ON T1.press_id  =  T2.press_id WHERE T2.name  =  "Accor")
SELECT T2.name,  T2.year_Profits_billion FROM book AS T1 JOIN press AS T2 ON T1.Press_ID  =  T2.Press_ID GROUP BY T1.Press_ID HAVING count(*)  >  2
SELECT T2.name,  T2.year_Profits_billion FROM book AS T1 JOIN press AS T2 ON T1.Press_ID  =  T2.Press_ID GROUP BY T1.Press_ID HAVING count(*)  >  2
SELECT count(*) FROM Authors
SELECT author_name FROM Authors
SELECT author_name,  other_details FROM Authors
SELECT other_details FROM Authors WHERE author_name  =  "Addison Denesik"
SELECT count(*) FROM Documents
SELECT author_name FROM Documents WHERE document_id = 4
SELECT author_name FROM Documents WHERE document_name  =  "Travel to Brazil"
SELECT count(*) FROM Documents WHERE author_name  =  "Era Kerluke"
SELECT document_name,  document_description FROM Documents
SELECT document_id,  document_name FROM Documents WHERE author_name  =  "Bianka Cummings"
SELECT T2.author_name,  T2.other_details FROM Documents AS T1 JOIN Authors AS T2 ON T1.author_name  =  T2.author_name WHERE T1.document_name  =  "Travel to China"
SELECT author_name,  count(*) FROM Documents GROUP BY author_name
SELECT author_name FROM Documents GROUP BY author_name ORDER BY count(*) DESC LIMIT 1
SELECT author_name FROM Documents GROUP BY author_name HAVING count(*)  >=  2
SELECT count(*) FROM Business_processes
SELECT next_process_id,  process_name,  process_description FROM Business_processes WHERE process_id  =  9
SELECT process_name FROM Business_processes WHERE next_process_id  =  9
SELECT count(*) FROM Process_outcomes
SELECT process_outcome_code,  process_outcome_description FROM Process_outcomes
SELECT process_outcome_description FROM Process_outcomes WHERE process_outcome_code  =  "working"
SELECT count(*) FROM Process_status
SELECT process_status_code,  process_status_description FROM Process_status
SELECT process_status_description FROM Process_status WHERE process_status_code  =  "ct"
SELECT count(*) FROM Staff
SELECT staff_id,  staff_details FROM Staff
SELECT staff_details FROM Staff WHERE staff_id = 100
SELECT count(*) FROM Ref_staff_roles
SELECT staff_role_code,  staff_role_description FROM Ref_staff_roles
SELECT staff_role_description FROM Ref_staff_roles WHERE staff_role_code  =  "HR"
SELECT count(*) FROM Documents_processes
SELECT DISTINCT process_id FROM Documents_processes
SELECT document_id FROM Documents EXCEPT SELECT document_id FROM Documents_processes
SELECT process_id FROM Business_processes EXCEPT SELECT process_id FROM Documents_processes
SELECT T2.process_outcome_description,  T3.process_status_description FROM Documents_processes AS T1 JOIN Process_outcomes AS T2 ON T1.process_outcome_code  =  T2.process_outcome_code JOIN Process_Status AS T3 ON T1.process_status_code  =  T3.process_status_code WHERE T1.document_id  =  0
SELECT T3.process_name FROM Documents_processes AS T1 JOIN Documents AS T2 ON T1.document_id  =  T2.document_id JOIN Business_processes AS T3 ON T1.process_id  =  T3.process_id WHERE T2.document_name  =  "Travel to Brazil"
SELECT process_id,  count(*) FROM Documents_processes GROUP BY process_id
SELECT count(*) FROM Staff_in_processes WHERE document_id = 0 AND process_id = 9
SELECT staff_id,  count(*) FROM Staff_in_processes GROUP BY staff_id
SELECT staff_role_code,  count(*) FROM Staff_in_processes GROUP BY staff_role_code
SELECT count(DISTINCT staff_role_code) FROM Staff_in_processes WHERE staff_id = 3
SELECT count(*) FROM Agencies
SELECT count(*) FROM Agencies
SELECT agency_id,  agency_details FROM Agencies
SELECT agency_id,  agency_details FROM Agencies
SELECT count(*) FROM Clients
SELECT count(*) FROM Clients
SELECT client_id,  client_details FROM Clients
SELECT client_id,  client_details FROM Clients
SELECT agency_id,  count(*) FROM Clients GROUP BY agency_id
SELECT count(*),  agency_id FROM Clients GROUP BY agency_id
SELECT T1.agency_id,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.agency_id,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.agency_id,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id HAVING count(*)  >=  2
SELECT T1.agency_id,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id HAVING count(*)  >=  2
SELECT T2.agency_details FROM Clients AS T1 JOIN Agencies AS T2 ON T1.agency_id  =  T2.agency_id WHERE T1.client_details  =  'Mac'
SELECT T2.agency_details FROM Clients AS T1 JOIN Agencies AS T2 ON T1.agency_id  =  T2.agency_id WHERE T1.client_details  =  "Mac"
SELECT T1.client_details,  T2.agency_details FROM Clients AS T1 JOIN Agencies AS T2 ON T1.agency_id  =  T2.agency_id
SELECT T1.client_details,  T2.agency_details FROM Clients AS T1 JOIN Agencies AS T2 ON T1.agency_id  =  T2.agency_id
SELECT sic_code,  count(*) FROM Clients GROUP BY sic_code
SELECT sic_code,  count(*) FROM Clients GROUP BY sic_code
SELECT client_id,  client_details FROM Clients WHERE sic_code  =  "Bad"
SELECT client_id,  client_details FROM Clients WHERE sic_code  =  "Bad"
SELECT T1.agency_id,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id
SELECT T1.agency_id,  T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id  =  T2.agency_id
SELECT agency_id FROM Agencies EXCEPT SELECT agency_id FROM Clients
SELECT agency_id FROM Agencies EXCEPT SELECT agency_id FROM Clients
SELECT count(*) FROM Invoices
SELECT count(*) FROM Invoices
SELECT invoice_id,  invoice_status,  invoice_details FROM Invoices
SELECT invoice_id,  invoice_status,  invoice_details FROM Invoices
SELECT client_id,  count(*) FROM Invoices GROUP BY client_id
SELECT count(*),  client_id FROM Invoices GROUP BY client_id
SELECT T2.client_id,  T2.client_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id GROUP BY T2.client_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.client_id,  T2.client_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id ORDER BY count(*) DESC LIMIT 1
SELECT client_id FROM Invoices GROUP BY client_id HAVING count(*)  >=  2
SELECT client_id FROM Invoices GROUP BY client_id HAVING count(*)  >=  2
SELECT invoice_status,  count(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status,  count(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status FROM Invoices GROUP BY invoice_status ORDER BY count(*) DESC LIMIT 1
SELECT invoice_status FROM Invoices GROUP BY invoice_status ORDER BY count(*) DESC LIMIT 1
SELECT T1.invoice_status,  T1.invoice_details,  T2.client_id,  T2.client_details,  T3.agency_id,  T3.agency_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id JOIN Agencies AS T3 ON T2.agency_id  =  T3.agency_id
SELECT T1.invoice_status,  T1.invoice_details,  T2.client_id,  T2.client_details,  T3.agency_id,  T3.agency_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id  =  T2.client_id JOIN Agencies AS T3 ON T2.agency_id  =  T3.agency_id
SELECT meeting_type,  other_details FROM meetings
SELECT DISTINCT meeting_type,  other_details FROM meetings
SELECT DISTINCT meeting_outcome,  purpose_of_meeting FROM meetings
SELECT DISTINCT meeting_outcome,  purpose_of_meeting FROM meetings
SELECT T1.payment_id,  T1.payment_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id WHERE T2.invoice_status  =  'Working'
SELECT T1.payment_id,  T1.payment_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id WHERE T2.invoice_status  =  "Working"
SELECT invoice_id,  invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT invoice_id,  invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT count(*) FROM Payments
SELECT count(*) FROM Payments
SELECT payment_id,  invoice_id,  payment_details FROM Payments
SELECT payment_id,  invoice_id,  payment_details FROM Payments
SELECT DISTINCT T1.invoice_id,  T1.invoice_status FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id  =  T2.invoice_id
SELECT DISTINCT T1.invoice_id,  T1.invoice_status FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id  =  T2.invoice_id
SELECT invoice_id,  count(*) FROM Payments GROUP BY invoice_id
SELECT invoice_id,  count(*) FROM Payments GROUP BY invoice_id
SELECT T2.invoice_id,  T2.invoice_status,  T2.invoice_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id GROUP BY T2.invoice_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.invoice_id,  T2.invoice_status,  T2.invoice_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id  =  T2.invoice_id GROUP BY T2.invoice_id ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM Staff
SELECT count(*) FROM Staff
SELECT agency_id,  count(*) FROM Staff GROUP BY agency_id
SELECT agency_id,  count(*) FROM Staff GROUP BY agency_id
SELECT T1.agency_id,  T2.agency_details FROM Staff AS T1 JOIN Agencies AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T2.agency_id,  T2.agency_details FROM Staff AS T1 JOIN Agencies AS T2 ON T1.agency_id  =  T2.agency_id GROUP BY T2.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT meeting_outcome,  count(*) FROM Meetings GROUP BY meeting_outcome
SELECT meeting_outcome,  count(*) FROM Meetings GROUP BY meeting_outcome
SELECT client_id,  count(*) FROM Meetings GROUP BY client_id
SELECT count(*),  client_id FROM Meetings GROUP BY client_id
SELECT meeting_type,  count(*),  client_id FROM Meetings GROUP BY client_id,  meeting_type
SELECT meeting_type,  count(*) FROM Meetings GROUP BY meeting_type
SELECT T1.meeting_id,  T1.meeting_outcome,  T1.meeting_type,  T2.client_details FROM meetings AS T1 JOIN clients AS T2 ON T1.client_id  =  T2.client_id
SELECT T1.meeting_id,  T1.meeting_outcome,  T1.meeting_type,  T2.client_details FROM meetings AS T1 JOIN clients AS T2 ON T1.client_id  =  T2.client_id
SELECT meeting_id,  count(*) FROM Staff_in_meetings GROUP BY meeting_id
SELECT count(*),  meeting_id FROM Staff_in_meetings GROUP BY meeting_id
SELECT staff_id,  count(*) FROM Staff_in_meetings GROUP BY staff_id HAVING count(*)  =  (SELECT min(count(*)) FROM Staff_in_meetings)
SELECT staff_id FROM Staff_in_meetings GROUP BY staff_id ORDER BY count(*) ASC LIMIT 1
SELECT count(DISTINCT staff_id) FROM Staff_in_meetings
SELECT count(DISTINCT staff_id) FROM Staff_in_meetings
SELECT count(*) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_meetings)
SELECT count(*) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_meetings)
SELECT T1.client_id,  T1.client_details FROM Clients AS T1 JOIN meetings AS T2 ON T1.client_id  =  T2.client_id UNION SELECT T1.client_id,  T1.client_details FROM Clients AS T1 JOIN invoices AS T2 ON T1.client_id  =  T2.client_id
SELECT T1.client_id,  T1.client_details FROM Clients AS T1 JOIN meetings AS T2 ON T1.client_id  =  T2.client_id UNION SELECT T1.client_id,  T1.client_details FROM Clients AS T1 JOIN invoices AS T2 ON T1.client_id  =  T2.client_id
SELECT staff_id,  staff_details FROM staff WHERE staff_details LIKE '%s%' INTERSECT SELECT staff_id FROM meetings GROUP BY staff_id HAVING count(*)  >=  1
SELECT staff_id,  staff_details FROM staff WHERE staff_details LIKE '%s%' INTERSECT SELECT staff_id FROM meetings
SELECT T1.client_id,  T1.sic_code,  T1.agency_id FROM clients AS T1 JOIN meetings AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id HAVING count(*)  =  1 INTERSECT SELECT T1.client_id FROM clients AS T1 JOIN invoices AS T2 ON T1.client_id  =  T2.client_id
SELECT T1.client_id,  T1.sic_code,  T1.agency_id FROM clients AS T1 JOIN meetings AS T2 ON T1.client_id  =  T2.client_id GROUP BY T1.client_id HAVING count(*)  =  1 INTERSECT SELECT T1.client_id,  T1.sic_code,  T1.agency_id FROM clients AS T1 JOIN invoices AS T2 ON T1.client_id  =  T2.client_id
SELECT T1.start_date_time,  T1.end_date_time,  T2.client_details,  T4.staff_details FROM meetings AS T1 JOIN clients AS T2 ON T1.client_id  =  T2.client_id JOIN staff_in_meetings AS T3 ON T1.meeting_id  =  T3.meeting_id JOIN staff AS T4 ON T3.staff_id  =  T4.staff_id
SELECT T1.start_date_time,  T1.end_date_time,  T2.client_details,  T4.staff_details FROM meetings AS T1 JOIN clients AS T2 ON T1.client_id  =  T2.client_id JOIN staff_in_meetings AS T3 ON T1.meeting_id  =  T3.meeting_id JOIN staff AS T4 ON T3.staff_id  =  T4.staff_id
