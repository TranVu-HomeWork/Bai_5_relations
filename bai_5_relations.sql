create database if not exists SalesDB;
use SalesDB;

create table if not exists Customers (
	CustomerID int auto_increment primary key,
    FullName varchar(255) not null,
    Email varchar(100)
);

create table if not exists Orders (
	OrderID int auto_increment primary key,
    OrderDate datetime,
    CustomerId int,
    foreign key (CustomerID) references Customers(CustomerID)
);

INSERT INTO Customers (FullName, Email)
VALUES 
    ('Nguyễn Văn A', 'nguyenvana@gmail.com'),
    ('Trần Thị B', 'tranthib@gmail.com');


INSERT INTO Orders (OrderDate, CustomerID)
VALUES 
    ('2023-10-26 10:00:00', 1), -- Đơn hàng 1 của Khách hàng 1 (Nguyễn Văn A)
    ('2023-10-27 14:30:00', 1), -- Đơn hàng 2 của Khách hàng 1 (Nguyễn Văn A)
    ('2023-10-28 09:15:00', 2); -- Đơn hàng 3 của Khách hàng 2 (Trần Thị B)

SELECT 
    Orders.OrderID AS 'Mã đơn hàng',
    Orders.OrderDate AS 'Ngày đặt hàng',
    Customers.FullName AS 'Tên khách hàng'
FROM 
    Orders
INNER JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID;