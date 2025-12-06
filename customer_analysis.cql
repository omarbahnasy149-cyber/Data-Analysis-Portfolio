--  Create Table
CREATE TABLE Transactions (
    CustomerID INT,
    TransactionDate DATE,
    Amount DECIMAL(10, 2)
);

--  Insert Mock Data
INSERT INTO Transactions VALUES
(101, '2023-10-01', 500.00),
(102, '2023-09-15', 120.00),
(101, '2023-10-05', 300.00),
(103, '2023-08-01', 60.00),
(102, '2023-10-02', 100.00);

--  RFM Query
SELECT
    CustomerID,
    COUNT(*) AS Frequency,
    SUM(Amount) AS Monetary,
    MAX(TransactionDate) AS Last_Purchase,
    CASE
        WHEN SUM(Amount) > 400 THEN 'VIP Customer'
        WHEN COUNT(*) > 1 THEN 'Loyal Customer'
        ELSE 'New/Low-Value Customer'
    END AS Customer_Segment
FROM Transactions
GROUP BY CustomerID;
