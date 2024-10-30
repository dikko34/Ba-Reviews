
--Aircraft Ratings
SELECT aircraft,COUNT(aircraft) Countaircraft,ROUND(AVG(rating),1) AircraftRating
,ROUND(AVG(seat_comfort),1) Aircraftseat_comfort,ROUND(AVG(cabin_staff_service),1) cabin_staff_service_Rating
,ROUND(AVG(food_beverages),1) Food_beverage_Rating,ROUND(AVG(ground_service),1) ground_service_Rating
,ROUND(AVG(value_for_money),1) Value_for_money_Rating,ROUND(AVG(entertainment),1) Entertainment_Rating
FROM Coasters
GROUP BY aircraft
HAVING COUNT(aircraft) >= 30
ORDER BY Countaircraft DESC


-- Traveller & seat type rating
SELECT traveller_type,seat_type,ROUND(AVG(rating),1) Rating
FROM Coasters
WHERE traveller_type IS NOT NULL
GROUP BY traveller_type,seat_type


SELECT traveller_type,seat_type,MAX(rating) Maxrating,MIN(rating) Minrating,AVG(rating)Avgrating
FROM Coasters 
WHERE traveller_type IS NOT NULL
GROUP BY traveller_type,seat_type

--Traveller & Seat type recommendations
SELECT traveller_type,seat_type,recommended,COUNT(recommended) NoRecomendations
FROM Coasters
GROUP BY traveller_type,seat_type,recommended
HAVING COUNT(recommended) >= 10
ORDER BY traveller_type,seat_type,recommended

SELECT traveller_type,recommended,COUNT(recommended)
FROM Coasters
WHERE traveller_type IS NOT NULL
GROUP BY traveller_type,recommended

SELECT seat_type,recommended,COUNT(recommended)
FROM Coasters
GROUP BY seat_type,recommended
ORDER BY seat_type

-- Aircraft Recommendations
SELECT aircraft,recommended,COUNT(recommended) NoOfRecommendation
FROM Coasters
GROUP BY aircraft,recommended
HAVING COUNT(recommended)>30
ORDER BY aircraft,recommended,NoOfRecommendation DESC


--Regions with the Highest Overall Rating
SELECT place,ROUND(AVG(rating),1) Rating
FROM Coasters
GROUP BY place
HAVING AVG(rating)>=5
ORDER BY Rating DESC


--Temp 1
CREATE TABLE #Aircraft_Ratings
(Aircraft Nvarchar(255),
Countaircraft int,
Aircraft_rating float,
seat_comfort_Rating float,
cabin_staff_service_Rating float,
food_beverages_Rating float,
groung_service_Raitng float,
Value_For_money_rating float,
Entertainment float
)

INSERT INTO #Aircraft_Ratings
SELECT aircraft,COUNT(aircraft) Countaircraft,ROUND(AVG(rating),1) AircraftRating
,ROUND(AVG(seat_comfort),1) Aircraftseat_comfort,ROUND(AVG(cabin_staff_service),1) cabin_staff_service_Rating
,ROUND(AVG(food_beverages),1) Food_beverage_Rating,ROUND(AVG(ground_service),1) ground_service_Rating
,ROUND(AVG(value_for_money),1) Value_for_money_Rating,ROUND(AVG(entertainment),1) Entertainment_Rating
FROM Coasters
GROUP BY aircraft
HAVING COUNT(aircraft) >= 30
ORDER BY Countaircraft DESC

-- View 1
CREATE VIEW Aircraft_Ratings As
SELECT aircraft,COUNT(aircraft) Countaircraft,ROUND(AVG(rating),1) AircraftRating
,ROUND(AVG(seat_comfort),1) Aircraftseat_comfort,ROUND(AVG(cabin_staff_service),1) cabin_staff_service_Rating
,ROUND(AVG(food_beverages),1) Food_beverage_Rating,ROUND(AVG(ground_service),1) ground_service_Rating
,ROUND(AVG(value_for_money),1) Value_for_money_Rating,ROUND(AVG(entertainment),1) Entertainment_Rating
FROM Coasters
GROUP BY aircraft
HAVING COUNT(aircraft) >= 30
ORDER BY Countaircraft DESC

-- Temp 2
CREATE TABLE #Travel_seatRating
(traveller_type Nvarchar(255),
seat_type Nvarchar(255),
rating float,
)

INSERT INTO #Travel_seatRating
SELECT traveller_type,seat_type,ROUND(AVG(rating),1) Rating
FROM Coasters
WHERE traveller_type IS NOT NULL
GROUP BY traveller_type,seat_type

--View 2
CREATE VIEW Travel_SeatRating AS
SELECT traveller_type,seat_type,ROUND(AVG(rating),1) Rating
FROM Coasters
WHERE traveller_type IS NOT NULL
GROUP BY traveller_type,seat_type

-- Temp 3
CREATE TABLE #Travel_seat_type_recommendations
(traveller_type Nvarchar(255),
seat_type Nvarchar(255),
recommendation Nvarchar(255),
NoOfrecommendation int,
)

INSERT INTO #Travel_seat_type_recommendations
--Traveller & Seat type recommendations
SELECT traveller_type,seat_type,recommended,COUNT(recommended) NoRecomendations
FROM Coasters
GROUP BY traveller_type,seat_type,recommended
HAVING COUNT(recommended) >= 10
ORDER BY traveller_type,seat_type,recommended

-- View 3
CREATE VIEW Traveller_SeatType_recommendation AS
--Traveller & Seat type recommendations
SELECT traveller_type,seat_type,recommended,COUNT(recommended) NoRecomendations
FROM Coasters
GROUP BY traveller_type,seat_type,recommended
HAVING COUNT(recommended) >= 10
--ORDER BY traveller_type,seat_type,recommended

-- Temp 4
CREATE TABLE #Aircraft_recommendations
(aircraft Nvarchar(255),
Recommendations Nvarchar(255),
NoOfrecommendation int,
)

INSERT INTO #Aircraft_recommendations
-- Aircraft Recommendations
SELECT aircraft,recommended,COUNT(recommended) NoOfRecommendation
FROM Coasters
GROUP BY aircraft,recommended
HAVING COUNT(recommended)>30
ORDER BY aircraft,recommended,NoOfRecommendation DESC

-- View 4
CREATE VIEW Aircraft_recommendations AS
-- Aircraft Recommendations
SELECT aircraft,recommended,COUNT(recommended) NoOfRecommendation
FROM Coasters
GROUP BY aircraft,recommended
HAVING COUNT(recommended)>30
--ORDER BY aircraft,recommended,NoOfRecommendation DESC


--Temp 5
CREATE TABLE #Region_Rating
(place Nvarchar(255),
Rating int,
)

INSERT INTO #Region_Rating
--Regions with the Highest Overall Rating
SELECT place,ROUND(AVG(rating),1) Rating
FROM Coasters
GROUP BY place
HAVING AVG(rating)>=5
ORDER BY Rating DESC

-- View 5
CREATE VIEW Region_Rating As
--Regions with the Highest Overall Rating
SELECT place,ROUND(AVG(rating),1) Rating
FROM Coasters
GROUP BY place
HAVING AVG(rating)>=5
--ORDER BY Rating DESC




SELECT *
FROM Coasters