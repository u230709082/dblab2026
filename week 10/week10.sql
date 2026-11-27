#1) Shows the customer locations.
CREATE  VIEW view_customer_locations as
SELECT CustomerName, Country from customers;
select*from view_customer_locations;



#2) Total quantity ordered for each product.

create view view_product_sales as
select P.ProductName, 
       SUM(OD.Quantity) AS TotalQuantity
from  OrderDetails  OD
join Products P on OD.ProductId =p.ProductID
group by p.ProductName ;

select*from view_product_sales
Where TotalQuantity < 159;

#3) Countries With the Most Customers.

create view view_customer_country_count as
select
     Country,
     count(*) as TotalCustomers
from Customers
group by Country
order by TotalCustomers desc;

select*from view_customer_country_count ;


#4) Orders with Shipper Information.
create view view_order_shipper as
select
     O.OrderID,
     O.OrderDate,
     C.CustomerName,
     S.ShipperName
FROM Orders O
join Customers C on O.CustomerId =C.CustomerId
join Shippers S on O.ShipperId=S.ShipperId;
     


select*from view_order_shipper ;

select ShipperName, count(*)  as OrderCount 
from view_order_shipper
group  by ShipperName 
order by OrderCount desc;
