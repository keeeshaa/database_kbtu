--1.
create database lab5;

--2.
create table salesman (
    salesman_id int primary key,
    name varchar(50),
    city varchar(50),
    commission decimal(4, 2)
);

create table customers (
    customer_id int primary key,
    cust_name varchar(50),
    city varchar(50),
    grade int,
    salesman_id int,
    foreign key (salesman_id) references salesman(salesman_id)
);

create table orders (
    ord_no int primary key,
    purch_amt decimal(10, 2),
    ord_date date,
    customer_id int,
    salesman_id int,
    foreign key (customer_id) references customers(customer_id),
    foreign key (salesman_id) references salesman(salesman_id)
);

insert into salesman (salesman_id, name, city, commission) values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lousan Hen', null, 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

insert into customers (customer_id, cust_name, city, grade, salesman_id) values
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian John', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

insert into orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) values
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001);


--3.
select sum(purch_amt) as total_purch from orders;

--4.
select round(avg(purch_amt),2) as avg_purch from orders;

--5.
select count(cust_name) as cust_count from customers;

--6.
select min(purch_amt) as min_purch from orders;

--7.
select * from customers where cust_name like '%b';

--8.
select orders.* from orders
join customers on orders.customer_id = customers.customer_id
where customers.city = 'New York';

--9.
select customers.* from customers 
join orders on orders.customer_id = customers.customer_id
where purch_amt>10;

--10.
select sum(grade) as total_grade from customers;

--11.
select cust_name from customers;

--12.
select max(grade) as max_grade from customers;