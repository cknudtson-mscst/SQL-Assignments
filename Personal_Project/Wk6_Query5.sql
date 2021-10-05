SELECT LineItem.Qty, Product.Name, Product.Price
FROM   LineItem INNER JOIN
             Product ON LineItem.Product_ID = Product.Product_ID
WHERE Invoice_ID = 1