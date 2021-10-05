SELECT Address.Address_ID, Address.Street_1, Address.Street_2, Address.City, Address.State, Address.Zip, Building.Building_ID, Building.Building_Name, Building.Address_ID AS Expr1
FROM   Address INNER JOIN
             Building ON Address.Address_ID = Building.Address_ID
ORDER BY Building_Name
