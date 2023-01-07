select *
from car;

create or replace procedure add_customer(full_name VARCHAR)
language plpgsql
as $$
begin 
	insert into customer (
	first_name,
	last_name
) values (
	SPLIT_PART(full_name, ' ', 1),
	SPLIT_PART(full_name, ' ', 2)
);
end;
$$;


call add_customer('Isaac Ryan');

call add_customer('Terry Kubalewswki');

call add_customer('Taylor Catherine');

select *
from customer;


create or replace procedure add_car (make VARCHAR, model VARCHAR, year_ INTEGER, price NUMERIC(7,2))
language plpgsql
as $$
begin 
	insert into car (
	make,
	model,
	year_,
	price
	) values (
	make,
	model,
	year_,
	price
	);
end;
$$;

call add_car ('Nissan', 'Frontier', 2012, 17499);
call add_car ('Toyota', '4Runner', 2018, 27199);
call add_car ('Ford', 'Focus', 2015, 5999);



create or replace procedure add_mechanic (full_name VARCHAR)
language plpgsql
as $$
begin 
	insert into mechanic (
	first_name,
	last_name
) values (
	SPLIT_PART(full_name, ' ', 1),
	SPLIT_PART(full_name, ' ', 2)
);
end;
$$;

call add_mechanic ('Claire Youngman');
call add_mechanic ('John Hartman');
call add_mechanic ('Michele Hendricks');


create or replace procedure add_salesperson (full_name VARCHAR)
language plpgsql
as $$
begin 
	insert into salesperson (
	first_name,
	last_name
) values (
	SPLIT_PART(full_name, ' ', 1),
	SPLIT_PART(full_name, ' ', 2)
);
end;
$$;

call add_salesperson ('Tom Kubby');
call add_salesperson ('Loretta Gilly');
call add_salesperson ('Max Bagman');


create or replace procedure create_invoice (date_ VARCHAR(8), car_id INTEGER, salesperson_id INTEGER, customer_id INTEGER)
language plpgsql
as $$
begin 
	insert into invoice (
	date_,
	car_id,
	salesperson_id,
	customer_id
	) values (
	date_,
	car_id,
	salesperson_id,
	customer_id
	);
end;
$$;

call create_invoice ('Nov', 1, 3, 3);
call create_invoice ('10262022', 2, 1, 4);
call create_invoice ('06152022', 3, 2, 2);



create or replace procedure create_service (date_ VARCHAR(8), repairs text, price NUMERIC(7,2), car_id INTEGER, customer_id INTEGER, mechanic_id INTEGER)
language plpgsql
as $$
begin 
	insert into service( 
	date_,
	repairs,
	price,
	car_id,
	customer_id,
	mechanic_id
	) values (
	date_,
	repairs,
	price,
	car_id,
	customer_id,
	mechanic_id
	);
end;
$$;

call create_service ('08012022', 'repair broken window motor', 250, 3, 2, 2);
call create_service ('11292022', 'replace front bumper (cust wrecked immediately after purchase)', 3800, 1, 3, 3);
call create_service ('01012023', 'routine checkup/oil change/tire rotation', 150, 2, 4, 1);

select *
from service