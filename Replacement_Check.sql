-- Optimal Trade-in or Vehicle_Year Check
SELECT
    VIN,
    Make,
    Model,
    Vehicle_Year,
    Mileage,
    Date_Added,
    CASE
        WHEN Mileage >= 50000
             AND Date_Added <= CURRENT_DATE - INTERVAL '5 years'
            THEN 'Trade-in recommended: Mileage and age'

        WHEN Mileage >= 50000
            THEN 'Trade-in recommended: Mileage'

        WHEN Date_Added <= CURRENT_DATE - INTERVAL '5 years'
            THEN 'Trade-in recommended: Age'
    END AS Replacement_Alert

FROM Vehicles

WHERE Mileage >= 50000
   OR Date_Added <= CURRENT_DATE - INTERVAL '5 years'

ORDER BY Mileage DESC;