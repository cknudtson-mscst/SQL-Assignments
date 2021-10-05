SELECT Receipt.*, Invoice.*
FROM   Receipt INNER JOIN
             Invoice ON Receipt.Invoice_ID = Invoice.InvoiceID
