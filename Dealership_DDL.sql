create table customer (
	customer_id SERIAL primary key,
	first_name VARCHAR(20),
	last_name VARCHAR(50)
);


create table salesperson (
	salesperson_id SERIAL primary key,
	first_name VARCHAR(20),
	last_name VARCHAR(50)
);


create table mechanic (
	mechanic_id SERIAL primary key,
	first_name VARCHAR(20),
	last_name VARCHAR(50)
);

create table car (
	car_id SERIAL primary key,
	make VARCHAR(20),
	model VARCHAR(20),
	year_ INTEGER,
	price NUMERIC(7,2),
	customer_id INTEGER,
	foreign key (customer_id) references customer(customer_id),
	salesperson_id INTEGER,
	foreign key (salesperson_id) references salesperson(salesperson_id),
	mechanic_id INTEGER,
	foreign key (mechanic_id) references mechanic(mechanic_id)
);


create table invoice (
	invoice_id SERIAL primary key,
	date_ TIMESTAMP,
	car_id INTEGER,
	foreign key (car_id) references car(car_id),
	salesperson_id INTEGER,
	foreign key (salesperson_id) references salesperson(salesperson_id),
	customer_id INTEGER,
	foreign key (customer_id) references customer(customer_id)
);

alter table invoice 
alter column date_ type VARCHAR(8);



create table service (
	service_id SERIAL primary key,
	date_ TIMESTAMP,
	repairs text,
	price NUMERIC(7,2),
	car_id INTEGER,
	foreign key (car_id) references car(car_id),
	customer_id INTEGER,
	foreign key (customer_id) references customer(customer_id),
	mechanic_id INTEGER,
	foreign key (mechanic_id) references mechanic(mechanic_id)
);

alter table service 
alter column date_ type VARCHAR(8);

alter table customer 
add column car_id INTEGER,
add foreign key(car_id) references car(car_id);

alter table customer 
add column invoice_id INTEGER,
add foreign key(invoice_id) references invoice(invoice_id),
add column service_id INTEGER,
add foreign key(service_id) references service(service_id);


alter table salesperson 
add column car_id INTEGER,
add foreign key(car_id) references car(car_id);

alter table mechanic
add column car_id INTEGER,
add foreign key(car_id) references car(car_id),
add column service_id INTEGER,
add foreign key(service_id) references service(service_id);


alter table car 
add column invoice_id INTEGER,
add foreign key(invoice_id) references invoice(invoice_id);

select *
from service;
