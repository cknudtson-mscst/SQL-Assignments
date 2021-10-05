SELECT Address.*, Building.Building_Name
FROM   Building INNER JOIN
             Address ON Building.Address_ID = Address.Address_ID
ORDER BY City