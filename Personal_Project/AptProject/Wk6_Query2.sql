SELECT Person.*
FROM   Person INNER JOIN
             Address ON Person.Address_ID = Address.Address_ID
ORDER BY Last_Name